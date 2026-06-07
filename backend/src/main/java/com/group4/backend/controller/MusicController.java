package com.group4.backend.controller;

import com.group4.backend.entity.Music;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.group4.backend.repository.MusicRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import java.util.List;

@RestController
@RequestMapping("/api/music")
@CrossOrigin(origins = "http://loclhost4200")
public class MusicController {

    @Autowired
    private MusicRepository repository;

    @GetMapping
    public List<Music> getAllMusic() {
        return repository.findAll();
    }

    @PostMapping
    public Music addMusic(@RequestBody Music music) {
        return repository.save(music);
    }

    @DeleteMapping("/{id}")
    public void deleteMusic(@PathVariable Long id) {
        repository.deleteById(id);
    }

}
