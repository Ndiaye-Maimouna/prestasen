package sn.prestasen.mapper;

import sn.prestasen.dto.professionnel.ProfilCartePointResponse;
import sn.prestasen.dto.professionnel.ProfilProfessionnelResponse;
import sn.prestasen.entity.Categorie;
import sn.prestasen.entity.ProfilProfessionnel;
import org.mapstruct.Mapping;
import org.mapstruct.Mapper;

import java.util.List;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public abstract class ProfilProfessionnelMapper {

    @Mapping(source = "utilisateur.id", target = "utilisateurId")
    @Mapping(expression = "java(profil.getUtilisateur().getPrenom() + \" \" + profil.getUtilisateur().getNom())", target = "nom")
    @Mapping(source = "utilisateur.telephone", target = "telephone")
    @Mapping(source = "utilisateur.photoUrl", target = "photoUrl")
    @Mapping(source = "utilisateur.region", target = "region")
    @Mapping(source = "utilisateur.ville", target = "ville")
    @Mapping(target = "categories", expression = "java(mapCategoriesNoms(profil.getCategories()))")
    @Mapping(target = "services", ignore = true)
    @Mapping(target = "produits", ignore = true)
    @Mapping(target = "avis", ignore = true)
    public abstract ProfilProfessionnelResponse toResponse(ProfilProfessionnel profil);

    @Mapping(expression = "java(profil.getUtilisateur().getPrenom() + \" \" + profil.getUtilisateur().getNom())", target = "nom")
    @Mapping(source = "utilisateur.photoUrl", target = "photoUrl")
    @Mapping(target = "categories", expression = "java(mapCategoriesNoms(profil.getCategories()))")
    public abstract ProfilCartePointResponse toCartePointResponse(ProfilProfessionnel profil);

    protected List<String> mapCategoriesNoms(List<Categorie> categories) {
        return categories.stream().map(Categorie::getNom).collect(Collectors.toList());
    }
}
