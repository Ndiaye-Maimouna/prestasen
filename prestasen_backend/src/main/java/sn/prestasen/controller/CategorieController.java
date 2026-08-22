package sn.prestasen.controller;

import sn.prestasen.entity.Categorie;
import sn.prestasen.repository.CategorieRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/categories")
@RequiredArgsConstructor
public class CategorieController {

    private final CategorieRepository categorieRepository;

    @GetMapping
    public List<Categorie> lister() {
        return categorieRepository.findAll();
    }
}
