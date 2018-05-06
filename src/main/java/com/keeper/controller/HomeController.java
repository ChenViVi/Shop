package com.keeper.controller;



import com.keeper.model.*;
import com.keeper.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
public class HomeController {

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private BannerRepository bannerRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("itemList", itemRepository.findAll());
        modelMap.addAttribute("articleList", articleRepository.findAll());
        modelMap.addAttribute("bannerList", bannerRepository.findAll());
        return "index";
    }
}
