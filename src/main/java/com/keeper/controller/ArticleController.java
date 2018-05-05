package com.keeper.controller;

import com.keeper.model.ArticleEntity;
import com.keeper.model.ArticleTypeEntity;
import com.keeper.repository.ArticleRepository;
import com.keeper.repository.ArticleTypeRepository;
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
public class ArticleController {

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private ArticleTypeRepository typeRepository;

    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        List<ArticleTypeEntity> typeList = typeRepository.findAll();
        List<ArticleEntity> videoList = articleRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        modelMap.addAttribute("videoList", videoList);
        return "article";
    }
}
