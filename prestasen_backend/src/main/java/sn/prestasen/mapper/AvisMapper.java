package sn.prestasen.mapper;

import sn.prestasen.dto.avis.AvisResponse;
import sn.prestasen.entity.Avis;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface AvisMapper {

    @Mapping(source = "auteur.id", target = "auteurId")
    @Mapping(expression = "java(avis.getAuteur().getPrenom() + \" \" + avis.getAuteur().getNom())", target = "auteurNom")
    AvisResponse toResponse(Avis avis);
}
