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
public class MusicController {

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private ArticleRepository articleRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        List<ItemEntity> itemList = itemRepository.findAll();
        List<ArticleEntity> articleList = articleRepository.findAll();
        modelMap.addAttribute("itemList", itemList);
        modelMap.addAttribute("articleList", articleList);
        return "index";
    }
}
