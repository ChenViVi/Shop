package com.keeper.controller.admin;

import com.keeper.model.ArticleTypeEntity;
import com.keeper.repository.ArticleRepository;
import com.keeper.repository.ArticleTypeRepository;
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
public class AdminArticleTypeController {

    @Autowired
    private ArticleTypeRepository typeRepository;

    @Autowired
    private ArticleRepository articleRepository;

    @RequestMapping(value = "/admin/articleType", method = RequestMethod.GET)
    public String getMusicType(ModelMap modelMap) {
        List<ArticleTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        return "admin/article/articleType";
    }

    @RequestMapping(value = "/admin/articleType/add", method = RequestMethod.GET)
    public String addMusicType() {
        return "admin/article/addArticleType";
    }

    @RequestMapping(value = "/admin/articleType/addP", method = RequestMethod.POST)
    public String addMusicTypePost(@ModelAttribute("type") ArticleTypeEntity type) {
        typeRepository.saveAndFlush(type);
        return "redirect:/admin/articleType";
    }

    @RequestMapping(value = "/admin/articleType/update/{id}", method = RequestMethod.GET)
    public String updateMusicType(@PathVariable("id") Integer typeId, ModelMap modelMap) {
        ArticleTypeEntity type = typeRepository.findOne(typeId);
        modelMap.addAttribute("type", type);
        return "admin/article/updateArticleType";
    }

    @RequestMapping(value = "/admin/articleType/updateP", method = RequestMethod.POST)
    public String updateMusicTypePost(@ModelAttribute("categoryP") ArticleTypeEntity type) {
        typeRepository.updateArticleType(type.getName(),type.getId());
        typeRepository.flush();
        return "redirect:/admin/articleType";
    }

    @RequestMapping(value = "/admin/articleType/delete/{id}", method = RequestMethod.GET)
    public String deleteMusicType(@PathVariable("id") Integer typeId) {
        articleRepository.deleteType(typeId);
        typeRepository.delete(typeId);
        typeRepository.flush();
        return "redirect:/admin/articleType";
    }
}
