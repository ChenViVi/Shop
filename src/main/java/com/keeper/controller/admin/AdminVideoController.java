package com.keeper.controller.admin;

import com.keeper.model.ItemEntity;
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
public class AdminVideoController {

    @Autowired
    private ItemTypeRepository typeRepository;

    @Autowired
    private ItemRepository itemRepository;

    @RequestMapping(value = "/admin/video", method = RequestMethod.GET)
    public String showMusic(ModelMap modelMap) {
        List<ItemEntity> videoList = itemRepository.findAll();
        modelMap.addAttribute("videoList", videoList);
        return "admin/video/video";
    }

    @RequestMapping(value = "/admin/video/add", method = RequestMethod.GET)
    public String addMusic(ModelMap modelMap) {
        List<ItemTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        return "admin/video/addVideo";
    }

    @RequestMapping(value = "/admin/video/addP", method = RequestMethod.POST)
    public String addMusicPost(@ModelAttribute("video") ItemEntity video) {
        itemRepository.saveAndFlush(video);
        return "redirect:/admin/video";
    }

    @RequestMapping("/admin/video/update/{id}")
    public String updateMusic(@PathVariable("id") int id, ModelMap modelMap) {
        ItemEntity video = itemRepository.findOne(id);
        List<ItemTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("video", video);
        modelMap.addAttribute("typeList", typeList);
        return "admin/video/updateVideo";
    }

    @RequestMapping(value = "/admin/video/updateP", method = RequestMethod.POST)
    public String updateBlogP(@ModelAttribute("videoP") ItemEntity video) {
        itemRepository.updateVideo(video.getName(), video.getType().getId(),
                video.getDetail(), video.getPrice(), video.getCover(),video.getLink(),video.getId());
        itemRepository.flush();
        return "redirect:/admin/video";
    }

    @RequestMapping("/admin/video/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        itemRepository.delete(id);
        itemRepository.flush();
        return "redirect:/admin/video";
    }
}
