package com.keeper.controller.admin;

import com.keeper.model.ItemTypeEntity;
import com.keeper.repository.ItemRepository;
import com.keeper.repository.ItemTypeRepository;
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
public class AdminVideoTypeController {

    @Autowired
    private ItemTypeRepository typeRepository;

    @Autowired
    private ItemRepository itemRepository;

    @RequestMapping(value = "/admin/videoType", method = RequestMethod.GET)
    public String getMusicType(ModelMap modelMap) {
        List<ItemTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        return "admin/video/videoType";
    }

    @RequestMapping(value = "/admin/videoType/add", method = RequestMethod.GET)
    public String addMusicType() {
        return "admin/video/addVideoType";
    }

    @RequestMapping(value = "/admin/videoType/addP", method = RequestMethod.POST)
    public String addMusicTypePost(@ModelAttribute("type") ItemTypeEntity type) {
        typeRepository.saveAndFlush(type);
        return "redirect:/admin/videoType";
    }

    @RequestMapping(value = "/admin/videoType/update/{id}", method = RequestMethod.GET)
    public String updateMusicType(@PathVariable("id") Integer typeId, ModelMap modelMap) {
        ItemTypeEntity type = typeRepository.findOne(typeId);
        modelMap.addAttribute("type", type);
        return "admin/video/updateVideoType";
    }

    @RequestMapping(value = "/admin/videoType/updateP", method = RequestMethod.POST)
    public String updateMusicTypePost(@ModelAttribute("categoryP") ItemTypeEntity type) {
        typeRepository.updateVideoType(type.getName(),type.getId());
        typeRepository.flush();
        return "redirect:/admin/videoType";
    }

    @RequestMapping(value = "/admin/videoType/delete/{id}", method = RequestMethod.GET)
    public String deleteMusicType(@PathVariable("id") Integer typeId) {
        itemRepository.deleteType(typeId);
        typeRepository.delete(typeId);
        typeRepository.flush();
        return "redirect:/admin/videoType";
    }
}
