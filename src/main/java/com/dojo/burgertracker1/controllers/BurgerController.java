package com.dojo.burgertracker1.controllers;

import com.dojo.burgertracker1.models.Burger;
import com.dojo.burgertracker1.services.BurgerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class BurgerController {

    @Autowired
    BurgerService burgerService;

    public BurgerController(BurgerService burgerService) {
        this.burgerService = burgerService;
    }

    @RequestMapping("/")
    public String index(Model model) {
        List<Burger> burger = burgerService.allBurgers();
        model.addAttribute("burger", burger);
        return "index.jsp";
    }

    @RequestMapping("/{id}")
    public String show(Model model, @PathVariable("id") Long id){
        Burger burger = burgerService.findBurger(id);
        model.addAttribute("burger", burger);
        return "show.jsp";
    }

    @RequestMapping("/new")
    public String newBurger(@ModelAttribute("burger") Burger burger) {
        return "new.jsp";
    }

    @PostMapping("/")
    public String create(@Valid @ModelAttribute("burger") Burger burger, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
            burgerService.createBurger(burger);
            return "redirect:/";
        }
    }

    @RequestMapping("/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Burger burger = burgerService.findBurger(id);
        model.addAttribute("burger", burger);
        return "edit.jsp";
    }

    @RequestMapping(value="/{id}", method= RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("burger") Burger burger, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            burgerService.updateBurger(burger);
            return "redirect:/";
        }
    }
}
