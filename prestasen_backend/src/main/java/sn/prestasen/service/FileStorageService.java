package sn.prestasen.service;

import sn.prestasen.exception.ValidationException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileStorageService {

    @Value("${app.upload.directory}")
    private String uploadDirectory;

    @Value("${app.upload.base-url}")
    private String baseUrl;

    private static final List<String> EXTENSIONS_AUTORISEES = List.of("jpg", "jpeg", "png", "webp");

    public String stocker(MultipartFile fichier) {
        if (fichier.isEmpty()) {
            throw new ValidationException("Le fichier est vide");
        }

        String nomOriginal = fichier.getOriginalFilename();
        String extension = extraireExtension(nomOriginal);

        if (!EXTENSIONS_AUTORISEES.contains(extension.toLowerCase())) {
            throw new ValidationException("Format de fichier non autorisé. Formats acceptés : "
                    + String.join(", ", EXTENSIONS_AUTORISEES));
        }

        String nomFichier = UUID.randomUUID() + "." + extension;

        try {
            Path cheminDossier = Paths.get(uploadDirectory);
            if (!Files.exists(cheminDossier)) {
                Files.createDirectories(cheminDossier);
            }

            Path cheminFichier = cheminDossier.resolve(nomFichier);
            Files.copy(fichier.getInputStream(), cheminFichier, StandardCopyOption.REPLACE_EXISTING);

            return baseUrl + "/" + nomFichier;
        } catch (IOException e) {
            throw new RuntimeException("Erreur lors de l'enregistrement du fichier", e);
        }
    }

    private String extraireExtension(String nomFichier) {
        if (nomFichier == null || !nomFichier.contains(".")) {
            throw new ValidationException("Nom de fichier invalide");
        }
        return nomFichier.substring(nomFichier.lastIndexOf('.') + 1);
    }
}
