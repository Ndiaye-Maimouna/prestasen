package sn.prestasen.service;

import org.springframework.data.domain.Sort;
import sn.prestasen.dto.service.ServiceCartePointResponse;
import sn.prestasen.dto.service.ServiceRequest;
import sn.prestasen.dto.service.ServiceResponse;
import sn.prestasen.entity.Categorie;
import sn.prestasen.entity.ProfilProfessionnel;
import sn.prestasen.exception.ForbiddenException;
import sn.prestasen.exception.ResourceNotFoundException;
import sn.prestasen.mapper.ServiceMapper;
import sn.prestasen.repository.CategorieRepository;
import sn.prestasen.repository.ProfilProfessionnelRepository;
import sn.prestasen.repository.ServiceRepository;
import sn.prestasen.specification.ServiceSpecifications;
import org.springframework.data.jpa.domain.Specification;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sn.prestasen.util.CoordonneesRegions;
import sn.prestasen.util.DispersionGeographique;

import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ServiceService {

    private final ServiceRepository serviceRepository;
    private final ProfilProfessionnelRepository profilProfessionnelRepository;
    private final CategorieRepository categorieRepository;
    private final ServiceMapper serviceMapper;

    public ServiceResponse obtenirParId(UUID id) {
        sn.prestasen.entity.Service service = serviceRepository.findById(id)
                .orElseThrow(() -> ResourceNotFoundException.of("Service", id));
        return serviceMapper.toResponse(service);
    }

    public List<ServiceResponse> rechercher(UUID categorieId, String region, String motCle) {
        Specification<sn.prestasen.entity.Service> spec = Specification.allOf(
                ServiceSpecifications.actif(),
                ServiceSpecifications.avecCategorie(categorieId),
                ServiceSpecifications.avecRegion(region),
                ServiceSpecifications.avecMotCle(motCle)
        );
        Sort tri = Sort.by(Sort.Direction.DESC, "dateCreation");

        return serviceRepository.findAll(spec, tri).stream()
                .map(serviceMapper::toResponse)
                .collect(Collectors.toList());
    }

    @Transactional
    public ServiceResponse creer(UUID utilisateurConnecteId, ServiceRequest request) {
        ProfilProfessionnel profil = profilProfessionnelRepository.findByUtilisateurId(utilisateurConnecteId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Vous devez avoir un profil professionnel pour publier un service"));

        Categorie categorie = categorieRepository.findById(request.getCategorieId())
                .orElseThrow(() -> ResourceNotFoundException.of("Catégorie", request.getCategorieId()));

        sn.prestasen.entity.Service service = sn.prestasen.entity.Service.builder()
                .professionnel(profil)
                .titre(request.getTitre())
                .description(request.getDescription())
                .categorie(categorie)
                .prixIndicatif(request.getPrixIndicatif())
                .images(request.getImages() != null ? request.getImages() : List.of())
                .actif(true)
                .build();

        service = serviceRepository.save(service);
        return serviceMapper.toResponse(service);
    }

    @Transactional
    public ServiceResponse mettreAJour(UUID utilisateurConnecteId, UUID serviceId, ServiceRequest request) {
        sn.prestasen.entity.Service service = serviceRepository.findById(serviceId)
                .orElseThrow(() -> ResourceNotFoundException.of("Service", serviceId));

        verifierProprietaire(service, utilisateurConnecteId);

        Categorie categorie = categorieRepository.findById(request.getCategorieId())
                .orElseThrow(() -> ResourceNotFoundException.of("Catégorie", request.getCategorieId()));

        service.setTitre(request.getTitre());
        service.setDescription(request.getDescription());
        service.setCategorie(categorie);
        service.setPrixIndicatif(request.getPrixIndicatif());
        if (request.getImages() != null) service.setImages(request.getImages());
        service.setDateModification(Instant.now());

        service = serviceRepository.save(service);
        return serviceMapper.toResponse(service);
    }

    @Transactional
    public void desactiver(UUID utilisateurConnecteId, UUID serviceId) {
        sn.prestasen.entity.Service service = serviceRepository.findById(serviceId)
                .orElseThrow(() -> ResourceNotFoundException.of("Service", serviceId));

        verifierProprietaire(service, utilisateurConnecteId);
        service.setActif(false);
        serviceRepository.save(service);
    }

    private void verifierProprietaire(sn.prestasen.entity.Service service, UUID utilisateurConnecteId) {
        if (!service.getProfessionnel().getUtilisateur().getId().equals(utilisateurConnecteId)) {
            throw new ForbiddenException("Vous ne pouvez modifier que vos propres services");
        }
    }

    public List<ServiceCartePointResponse> obtenirPointsCarte(
            Double latMin, Double latMax, Double lngMin, Double lngMax, UUID categorieId) {

        Specification<sn.prestasen.entity.Service> spec = Specification.allOf(
                ServiceSpecifications.actif(),
                ServiceSpecifications.avecCategorie(categorieId),
                ServiceSpecifications.avecRegionDefinie()
        );
        return serviceRepository.findAll(spec).stream()
                .map(this::versPointCarte)
                .filter(p -> p != null
                        && p.getLatitude() >= latMin && p.getLatitude() <= latMax
                        && p.getLongitude() >= lngMin && p.getLongitude() <= lngMax)
                .collect(Collectors.toList());
    }

    private ServiceCartePointResponse versPointCarte(sn.prestasen.entity.Service s) {
        String region = s.getProfessionnel().getUtilisateur().getRegion();
        CoordonneesRegions.Coordonnees centre = CoordonneesRegions.pour(region);
        if (centre == null) return null;

        DispersionGeographique.Position position = DispersionGeographique.disperser(region, centre, s.getId());

        return ServiceCartePointResponse.builder()
                .id(s.getId())
                .titre(s.getTitre())
                .professionnelNom(s.getProfessionnel().getUtilisateur().getPrenom() + " " + s.getProfessionnel().getUtilisateur().getNom())
                .categorieNom(s.getCategorie().getNom())
                .categorieIcone(s.getCategorie().getIcone())
                .prixIndicatif(s.getPrixIndicatif())
                .image(s.getImages().isEmpty() ? null : s.getImages().get(0))
                .latitude(position.latitude())
                .longitude(position.longitude())
                .build();
    }
}
