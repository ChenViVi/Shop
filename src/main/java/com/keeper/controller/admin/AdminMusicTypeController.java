package com.keeper.controller.admin;

import com.keeper.model.MusicTypeEntity;
import com.keeper.repository.MusicRepository;
import com.keeper.repository.MusicTypeRepository;
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
public class AdminMusicTypeController {

    @Autowired
    private MusicRepository musicRepository;

    @Autowired
    private MusicTypeRepository typeRepository;

    @RequestMapping(value = "/admin/musicType", method = RequestMethod.GET)
    public String getMusicType(ModelMap modelMap) {
        List<MusicTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        return "admin/music/musicType";
    }

    @RequestMapping(value = "/admin/musicType/add", method = RequestMethod.GET)
    public String addMusicType() {
        return "admin/music/addMusicType";
    }

    @RequestMapping(value = "/admin/musicType/addP", method = RequestMethod.POST)
    public String addMusicTypePost(@ModelAttribute("type") MusicTypeEntity typeEntity) {
        typeRepository.saveAndFlush(typeEntity);
        return "redirect:/admin/musicType";
    }

    @RequestMapping(value = "/admin/musicType/update/{id}", method = RequestMethod.GET)
    public String updateMusicType(@PathVariable("id") Integer typeId, ModelMap modelMap) {
        MusicTypeEntity type = typeRepository.findOne(typeId);
        modelMap.addAttribute("type", type);
        return "admin/music/updateMusicType";
    }

    @RequestMapping(value = "/admin/musicType/updateP", method = RequestMethod.POST)
    public String updateMusicTypePost(@ModelAttribute("categoryP") MusicTypeEntity type) {
        typeRepository.updateMusicType(type.getName(),type.getId());
        typeRepository.flush();
        return "redirect:/admin/musicType";
    }

    @RequestMapping(value = "/admin/musicType/delete/{id}", method = RequestMethod.GET)
    public String deleteMusicType(@PathVariable("id") Integer typeId) {
        musicRepository.deleteType(typeId);
        typeRepository.delete(typeId);
        typeRepository.flush();
        return "redirect:/admin/musicType";
    }
}
