package sn.prestasen.exception;

import org.springframework.http.HttpStatus;

public class ResourceNotFoundException extends ApiException {

    public ResourceNotFoundException(String message) {
        super(message, HttpStatus.NOT_FOUND, "RESOURCE_NOT_FOUND");
    }

    public static ResourceNotFoundException of(String entite, Object id) {
        return new ResourceNotFoundException(entite + " introuvable avec l'identifiant : " + id);
    }
}
