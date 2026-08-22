package sn.prestasen.mapper;

import sn.prestasen.dto.user.UtilisateurResponse;
import sn.prestasen.entity.Utilisateur;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UtilisateurMapper {

    UtilisateurResponse toResponse(Utilisateur utilisateur);
}
