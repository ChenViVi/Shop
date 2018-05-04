package com.keeper.controller;

import com.keeper.repository.AboutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
public class AboutController {

    @Autowired
    private AboutRepository aboutRepository;

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("aboutList", aboutRepository.findAll());
        return "about";
    }
}
