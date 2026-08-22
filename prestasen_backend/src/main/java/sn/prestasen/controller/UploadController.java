package sn.prestasen.controller;

import sn.prestasen.service.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/api/upload")
@RequiredArgsConstructor
public class UploadController {

    private final FileStorageService fileStorageService;

    @PostMapping(consumes = "multipart/form-data")
    public Map<String, String> uploader(@RequestParam("file") MultipartFile fichier) {
        String url = fileStorageService.stocker(fichier);
        return Map.of("url", url);
    }
}
