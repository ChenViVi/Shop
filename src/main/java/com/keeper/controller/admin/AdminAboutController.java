package com.keeper.controller.admin;

import com.keeper.model.AboutEntity;
import com.keeper.model.base.BaseEntity;
import com.keeper.repository.AboutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
@RequestMapping(value = "/admin/about")
public class AdminAboutController {

    @Autowired
    private AboutRepository aboutRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("about", aboutRepository.findOne(1));
        return "admin/about";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    @ResponseBody
    public BaseEntity update(@RequestParam(value="content") String content) {
        BaseEntity entity = new BaseEntity();
        if(content == null || content.length() == 0){
            entity.setMsg("关于内容不可为空");
        }
        else {
            AboutEntity aboutEntity = aboutRepository.findOne(1);
            aboutEntity.setContent(content);
            aboutRepository.save(aboutEntity);
            entity.setCode(1);
            entity.setMsg("修改成功");
        }
        return entity;
    }
}
