package sn.prestasen.service;

import org.springframework.data.domain.Sort;
import sn.prestasen.dto.produit.ProduitRequest;
import sn.prestasen.dto.produit.ProduitResponse;
import sn.prestasen.entity.Categorie;
import sn.prestasen.entity.Produit;
import sn.prestasen.entity.ProfilProfessionnel;
import sn.prestasen.exception.ForbiddenException;
import sn.prestasen.exception.ResourceNotFoundException;
import sn.prestasen.mapper.ProduitMapper;
import sn.prestasen.repository.CategorieRepository;
import sn.prestasen.repository.ProduitRepository;
import sn.prestasen.repository.ProfilProfessionnelRepository;
import sn.prestasen.specification.ProduitSpecifications;
import org.springframework.data.jpa.domain.Specification;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProduitService {

    private final ProduitRepository produitRepository;
    private final ProfilProfessionnelRepository profilProfessionnelRepository;
    private final CategorieRepository categorieRepository;
    private final ProduitMapper produitMapper;

    public ProduitResponse obtenirParId(UUID id) {
        Produit produit = produitRepository.findById(id)
                .orElseThrow(() -> ResourceNotFoundException.of("Produit", id));
        return produitMapper.toResponse(produit);
    }

    public List<ProduitResponse> rechercher(UUID categorieId, String region, String motCle) {
        Specification<Produit> spec = Specification.allOf(
                ProduitSpecifications.actif(),
                ProduitSpecifications.avecCategorie(categorieId),
                ProduitSpecifications.avecRegion(region),
                ProduitSpecifications.avecMotCle(motCle)
        );

        Sort tri = Sort.by(Sort.Direction.DESC, "dateCreation");

        return produitRepository.findAll(spec, tri).stream()
                .map(produitMapper::toResponse)
                .collect(Collectors.toList());
    }

    @Transactional
    public ProduitResponse creer(UUID utilisateurConnecteId, ProduitRequest request) {
        ProfilProfessionnel profil = profilProfessionnelRepository.findByUtilisateurId(utilisateurConnecteId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Vous devez avoir un profil professionnel pour publier un produit"));

        Categorie categorie = categorieRepository.findById(request.getCategorieId())
                .orElseThrow(() -> ResourceNotFoundException.of("Catégorie", request.getCategorieId()));

        Produit produit = Produit.builder()
                .professionnel(profil)
                .titre(request.getTitre())
                .description(request.getDescription())
                .categorie(categorie)
                .prix(request.getPrix())
                .images(request.getImages() != null ? request.getImages() : List.of())
                .actif(true)
                .build();

        produit = produitRepository.save(produit);
        return produitMapper.toResponse(produit);
    }

    @Transactional
    public ProduitResponse mettreAJour(UUID utilisateurConnecteId, UUID produitId, ProduitRequest request) {
        Produit produit = produitRepository.findById(produitId)
                .orElseThrow(() -> ResourceNotFoundException.of("Produit", produitId));

        verifierProprietaire(produit, utilisateurConnecteId);

        Categorie categorie = categorieRepository.findById(request.getCategorieId())
                .orElseThrow(() -> ResourceNotFoundException.of("Catégorie", request.getCategorieId()));

        produit.setTitre(request.getTitre());
        produit.setDescription(request.getDescription());
        produit.setCategorie(categorie);
        produit.setPrix(request.getPrix());
        if (request.getImages() != null) produit.setImages(request.getImages());
        produit.setDateModification(Instant.now());

        produit = produitRepository.save(produit);
        return produitMapper.toResponse(produit);
    }

    @Transactional
    public void desactiver(UUID utilisateurConnecteId, UUID produitId) {
        Produit produit = produitRepository.findById(produitId)
                .orElseThrow(() -> ResourceNotFoundException.of("Produit", produitId));

        verifierProprietaire(produit, utilisateurConnecteId);
        produit.setActif(false);
        produitRepository.save(produit);
    }

    private void verifierProprietaire(Produit produit, UUID utilisateurConnecteId) {
        if (!produit.getProfessionnel().getUtilisateur().getId().equals(utilisateurConnecteId)) {
            throw new ForbiddenException("Vous ne pouvez modifier que vos propres produits");
        }
    }
}
