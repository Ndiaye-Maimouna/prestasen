package sn.prestasen.mapper;

import sn.prestasen.dto.service.ServiceResponse;
import sn.prestasen.entity.Service;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ServiceMapper {

    @Mapping(source = "professionnel.id", target = "professionnelId")
    @Mapping(expression = "java(service.getProfessionnel().getUtilisateur().getPrenom() + \" \" + service.getProfessionnel().getUtilisateur().getNom())", target = "professionnelNom")
    @Mapping(source = "categorie.nom", target = "categorieNom")
    ServiceResponse toResponse(Service service);
}
