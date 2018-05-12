package com.keeper.controller.admin;

import com.keeper.model.ArticleEntity;
import com.keeper.model.base.BaseEntity;
import com.keeper.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
@RequestMapping(value = "/admin/article")
public class AdminArticleController {

    @Autowired
    private ArticleRepository articleRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("articleList", articleRepository.findAll());
        return "admin/article";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    @ResponseBody
    public BaseEntity add(@RequestParam(value="title") String title ,@RequestParam(value="content") String content) {
        BaseEntity entity = new BaseEntity();
        if(title == null || title.length() == 0){
            entity.setMsg("标题不可为空");
        }
        if(content == null || content.length() == 0){
            entity.setMsg("内容不可为空");
        }
        else {
            ArticleEntity articleEntity = new ArticleEntity();
            articleEntity.setTitle(title);
            articleEntity.setContent(content);
            articleRepository.save(articleEntity);
            entity.setCode(1);
        }
        return entity;
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    @ResponseBody
    public BaseEntity update(@RequestParam(value="id") int id, @RequestParam(value="title") String title, @RequestParam(value="content") String content) {
        BaseEntity entity = new BaseEntity();
        if(title == null || title.length() == 0){
            entity.setMsg("标题不可为空");
        }
        if(content == null || content.length() == 0){
            entity.setMsg("内容不可为空");
        }
        else {
            ArticleEntity articleEntity = articleRepository.findOne(id);
            if (articleEntity == null){
                entity.setMsg("此id不存在");
            }
            else {
                articleEntity.setTitle(title);
                articleEntity.setContent(content);
                articleRepository.save(articleEntity);
            }
            entity.setCode(1);
        }
        return entity;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") int id) {
        articleRepository.delete(id);
        articleRepository.flush();
        return "redirect:/admin/article";
    }
}
