package sn.prestasen.service;

import sn.prestasen.dto.avis.AvisReponseRequest;
import sn.prestasen.dto.avis.AvisRequest;
import sn.prestasen.dto.avis.AvisResponse;
import sn.prestasen.dto.avis.AvisUpdateRequest;
import sn.prestasen.entity.Avis;
import sn.prestasen.entity.ProfilProfessionnel;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.exception.ConflictException;
import sn.prestasen.exception.ForbiddenException;
import sn.prestasen.exception.ResourceNotFoundException;
import sn.prestasen.exception.ValidationException;
import sn.prestasen.mapper.AvisMapper;
import sn.prestasen.repository.AvisRepository;
import sn.prestasen.repository.ProfilProfessionnelRepository;
import sn.prestasen.repository.UtilisateurRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AvisService {

    private final AvisRepository avisRepository;
    private final ProfilProfessionnelRepository profilProfessionnelRepository;
    private final UtilisateurRepository utilisateurRepository;
    private final AvisMapper avisMapper;
    private final NotificationService notificationService;

    public List<AvisResponse> obtenirParProfessionnel(UUID professionnelId) {
        return avisRepository.findByProfessionnelIdOrderByDateCreationDesc(professionnelId).stream()
                .map(avisMapper::toResponse)
                .collect(Collectors.toList());
    }

    @Transactional
    public AvisResponse creer(UUID auteurId, AvisRequest request) {
        ProfilProfessionnel professionnel = profilProfessionnelRepository.findById(request.getProfessionnelId())
                .orElseThrow(() -> ResourceNotFoundException.of("Profil professionnel", request.getProfessionnelId()));

        if (professionnel.getUtilisateur().getId().equals(auteurId)) {
            throw new ValidationException("Vous ne pouvez pas laisser un avis sur votre propre profil");
        }

        if (avisRepository.findByAuteurIdAndProfessionnelId(auteurId, request.getProfessionnelId()).isPresent()) {
            throw new ConflictException("Vous avez déjà laissé un avis pour ce professionnel");
        }

        Utilisateur auteur = utilisateurRepository.findById(auteurId)
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", auteurId));


        Avis avis = Avis.builder()
                .auteur(auteur)
                .professionnel(professionnel)
                .note(request.getNote())
                .commentaire(request.getCommentaire())
                .build();

        avis = avisRepository.save(avis);

        recalculerNoteMoyenne(professionnel);
        notificationService.notifierNouvelAvis(professionnel, avis);

        return avisMapper.toResponse(avis);
    }

    @Transactional
    public AvisResponse repondre(UUID utilisateurConnecteId, UUID avisId, AvisReponseRequest request) {
        Avis avis = avisRepository.findById(avisId)
                .orElseThrow(() -> ResourceNotFoundException.of("Avis", avisId));

        if (!avis.getProfessionnel().getUtilisateur().getId().equals(utilisateurConnecteId)) {
            throw new ForbiddenException("Vous ne pouvez répondre qu'aux avis laissés sur votre profil");
        }

        avis.setReponseProfessionnel(request.getReponse());
        avis.setDateReponse(Instant.now());
        avis = avisRepository.save(avis);

        notificationService.notifierReponseAvis(avis);

        return avisMapper.toResponse(avis);
    }

    private void recalculerNoteMoyenne(ProfilProfessionnel professionnel) {
        Double moyenne = avisRepository.calculerMoyenne(professionnel.getId());
        long nombreAvis = avisRepository.countByProfessionnelId(professionnel.getId());

        professionnel.setNoteMoyenne(Math.round(moyenne * 10.0) / 10.0); // arrondi à 1 décimale
        professionnel.setNombreAvis((int) nombreAvis);
        profilProfessionnelRepository.save(professionnel);
    }

    @Transactional
    public AvisResponse modifier(UUID utilisateurConnecteId, UUID avisId, AvisUpdateRequest request) {
        Avis avis = avisRepository.findById(avisId)
                .orElseThrow(() -> ResourceNotFoundException.of("Avis", avisId));

        if (!avis.getAuteur().getId().equals(utilisateurConnecteId)) {
            throw new ForbiddenException("Vous ne pouvez modifier que vos propres avis");
        }

        avis.setNote(request.getNote());
        avis.setCommentaire(request.getCommentaire());
        avis = avisRepository.save(avis);

        recalculerNoteMoyenne(avis.getProfessionnel());

        return avisMapper.toResponse(avis);
    }
}
