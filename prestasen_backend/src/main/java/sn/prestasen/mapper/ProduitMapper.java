package sn.prestasen.mapper;

import sn.prestasen.dto.produit.ProduitResponse;
import sn.prestasen.entity.Produit;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ProduitMapper {

    @Mapping(source = "professionnel.id", target = "professionnelId")
    @Mapping(expression = "java(produit.getProfessionnel().getUtilisateur().getPrenom() + \" \" + produit.getProfessionnel().getUtilisateur().getNom())", target = "professionnelNom")
    @Mapping(source = "categorie.nom", target = "categorieNom")
    ProduitResponse toResponse(Produit produit);
}
