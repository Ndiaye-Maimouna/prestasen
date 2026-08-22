package sn.prestasen.service;

import org.springframework.data.domain.Sort;
import sn.prestasen.dto.professionnel.ProfilCartePointResponse;
import sn.prestasen.dto.professionnel.ProfilProfessionnelResponse;
import sn.prestasen.dto.professionnel.ProfilProfessionnelUpdateRequest;
import sn.prestasen.specification.ProfilProfessionnelSpecifications;
import sn.prestasen.entity.Categorie;
import sn.prestasen.entity.ProfilProfessionnel;
import sn.prestasen.exception.ForbiddenException;
import sn.prestasen.exception.ResourceNotFoundException;
import sn.prestasen.mapper.AvisMapper;
import sn.prestasen.mapper.ProduitMapper;
import sn.prestasen.mapper.ProfilProfessionnelMapper;
import sn.prestasen.mapper.ServiceMapper;
import sn.prestasen.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProfilProfessionnelService {

    private final ProfilProfessionnelRepository profilProfessionnelRepository;
    private final CategorieRepository categorieRepository;
    private final ServiceRepository serviceRepository;
    private final ProduitRepository produitRepository;
    private final AvisRepository avisRepository;
    private final ProfilProfessionnelMapper profilProfessionnelMapper;
    private final ServiceMapper serviceMapper;
    private final ProduitMapper produitMapper;
    private final AvisMapper avisMapper;

    public ProfilProfessionnelResponse obtenirProfilComplet(UUID profilId) {
        ProfilProfessionnel profil = profilProfessionnelRepository.findById(profilId)
                .orElseThrow(() -> ResourceNotFoundException.of("Profil professionnel", profilId));

        ProfilProfessionnelResponse response = profilProfessionnelMapper.toResponse(profil);

        response.setServices(serviceRepository.findByProfessionnelIdAndActifTrueOrderByDateCreationAsc(profilId).stream()
                        .map(serviceMapper::toResponse)
                        .collect(Collectors.toList())
        );

        response.setProduits(produitRepository.findByProfessionnelIdAndActifTrueOrderByDateCreationAsc(profilId).stream()
                        .map(produitMapper::toResponse)
                        .collect(Collectors.toList())
        );

        response.setAvis(avisRepository.findByProfessionnelIdOrderByDateCreationDesc(profilId).stream()
                        .map(avisMapper::toResponse)
                        .collect(Collectors.toList())
        );

        return response;
    }

    public List<ProfilProfessionnelResponse> rechercher(UUID categorieId, String region, UUID utilisateurConnecteId) {
        Specification<ProfilProfessionnel> spec = Specification.allOf(
                ProfilProfessionnelSpecifications.avecCategorie(categorieId),
                ProfilProfessionnelSpecifications.avecRegion(region)
        );

        Sort tri = Sort.by(Sort.Direction.DESC, "dateCreation");

        return profilProfessionnelRepository.findAll(spec, tri).stream()
                .filter(p -> utilisateurConnecteId == null || !p.getUtilisateur().getId().equals(utilisateurConnecteId))
                .map(profilProfessionnelMapper::toResponse)
                .collect(Collectors.toList());
    }

    public List<ProfilCartePointResponse> obtenirPointsCarte(
            Double latMin, Double latMax, Double lngMin, Double lngMax, UUID categorieId) {

        Specification<ProfilProfessionnel> spec = Specification.allOf(
                ProfilProfessionnelSpecifications.dansZone(latMin, latMax, lngMin, lngMax),
                ProfilProfessionnelSpecifications.avecCategorie(categorieId)
        );

        return profilProfessionnelRepository.findAll(spec).stream()
                .map(profilProfessionnelMapper::toCartePointResponse)
                .collect(Collectors.toList());
    }

    @Transactional
    public ProfilProfessionnelResponse mettreAJour(
            UUID utilisateurConnecteId, UUID profilId, ProfilProfessionnelUpdateRequest request) {

        ProfilProfessionnel profil = profilProfessionnelRepository.findById(profilId)
                .orElseThrow(() -> ResourceNotFoundException.of("Profil professionnel", profilId));

        verifierProprietaire(profil, utilisateurConnecteId);

        if (request.getDescription() != null) profil.setDescription(request.getDescription());
        if (request.getLatitude() != null) {
            profil.setLatitude(request.getLatitude());
            profil.setPositionAutomatique(false);
        }
        if (request.getLongitude() != null) {
            profil.setLongitude(request.getLongitude());
        }

        if (request.getCategorieIds() != null) {
            List<Categorie> categories = categorieRepository.findAllById(request.getCategorieIds());
            profil.setCategories(categories);
        }

        profil = profilProfessionnelRepository.save(profil);
        return profilProfessionnelMapper.toResponse(profil);
    }

    public void verifierProprietaire(ProfilProfessionnel profil, UUID utilisateurConnecteId) {
        if (!profil.getUtilisateur().getId().equals(utilisateurConnecteId)) {
            throw new ForbiddenException("Vous ne pouvez modifier que votre propre profil");
        }
    }

    public ProfilProfessionnelResponse obtenirMonProfil(UUID utilisateurConnecteId) {
        ProfilProfessionnel profil = profilProfessionnelRepository.findByUtilisateurId(utilisateurConnecteId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Aucun profil professionnel associé à ce compte"));
        return obtenirProfilComplet(profil.getId());
    }
}
