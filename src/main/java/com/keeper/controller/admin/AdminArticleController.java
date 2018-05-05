package com.keeper.controller.admin;

import com.keeper.model.ArticleEntity;
import com.keeper.model.ArticleTypeEntity;
import com.keeper.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
public class AdminArticleController {

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private ArticleTypeRepository typeRepository;

    @RequestMapping(value = "/admin/article", method = RequestMethod.GET)
    public String showMusic(ModelMap modelMap) {
        List<ArticleEntity> articleList = articleRepository.findAll();
        modelMap.addAttribute("articleList", articleList);
        return "admin/article/article";
    }

    @RequestMapping(value = "/admin/article/add", method = RequestMethod.GET)
    public String addMusic(ModelMap modelMap) {
        List<ArticleTypeEntity> articleList = typeRepository.findAll();
        modelMap.addAttribute("typeList", articleList);
        return "admin/article/addArticle";
    }

    @RequestMapping(value = "/admin/article/addP", method = RequestMethod.POST)
    public String addMusicPost(@ModelAttribute("article") ArticleEntity article) {
        articleRepository.saveAndFlush(article);
        return "redirect:/admin/article";
    }

    @RequestMapping("/admin/article/update/{id}")
    public String updateMusic(@PathVariable("id") int id, ModelMap modelMap) {
        ArticleEntity article = articleRepository.findOne(id);
        List<ArticleTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("article", article);
        modelMap.addAttribute("typeList", typeList);
        return "admin/article/updateArticle";
    }

    @RequestMapping(value = "/admin/article/updateP", method = RequestMethod.POST)
    public String updateBlogP(@ModelAttribute("articleP") ArticleEntity article) {
        articleRepository.updateArticle(article.getTitle(), article.getType().getId(),
                article.getContent(),article.getId());
        articleRepository.flush();
        return "redirect:/admin/article";
    }

    @RequestMapping("/admin/article/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        articleRepository.delete(id);
        articleRepository.flush();
        return "redirect:/admin/article";
    }
}
