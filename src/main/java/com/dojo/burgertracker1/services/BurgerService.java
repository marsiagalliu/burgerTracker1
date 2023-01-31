package com.dojo.burgertracker1.services;

import com.dojo.burgertracker1.models.Burger;
import com.dojo.burgertracker1.repositories.BurgerRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BurgerService {

private final BurgerRepository burgerRepository;

    public BurgerService(BurgerRepository burgerRepository) {
        this.burgerRepository = burgerRepository;
    }

    public List<Burger> allBurgers() {
        return burgerRepository.findAll();
    }

    public Burger createBurger(Burger b) {
        return burgerRepository.save(b);
    }

    public Burger findBurger(Long id) {
        Optional<Burger> optionalBurger = burgerRepository.findById(id);
        if(optionalBurger.isPresent()) {
            return optionalBurger.get();
        } else {
            return null;
        }
    }

    public Burger updateBurger(Long id, String burName, String restauName, Integer rat, String note) {
        Burger burger = findBurger(id);
        if (burger == null){
            return null;
        }
        burger.setId(id);
        burger.setBurgerName(burName);
        burger.setRestaurantName(restauName);
        burger.setRating(rat);
        burger.setNotes(note);

        return burgerRepository.save(burger);
    }

    public void deleteBurger(Long id) {
        burgerRepository.deleteById(id);
    }
}
