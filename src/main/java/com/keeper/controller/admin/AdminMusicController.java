package com.keeper.controller.admin;

import com.keeper.model.MusicEntity;
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
public class AdminMusicController {

    @Autowired
    private MusicRepository musicRepository;

    @Autowired
    private MusicTypeRepository typeRepository;



    @RequestMapping(value = "/admin/music", method = RequestMethod.GET)
    public String showMusic(ModelMap modelMap) {
        List<MusicEntity> musicList = musicRepository.findAll();
        modelMap.addAttribute("musicList", musicList);
        return "admin/music/music";
    }

    @RequestMapping(value = "/admin/music/add", method = RequestMethod.GET)
    public String addMusic(ModelMap modelMap) {
        List<MusicTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        return "admin/music/addMusic";
    }

    @RequestMapping(value = "/admin/music/addP", method = RequestMethod.POST)
    public String addMusicPost(@ModelAttribute("music") MusicEntity musicEntity) {
        musicRepository.saveAndFlush(musicEntity);
        return "redirect:/admin/music";
    }

    @RequestMapping("/admin/music/update/{id}")
    public String updateMusic(@PathVariable("id") int id, ModelMap modelMap) {
        MusicEntity music = musicRepository.findOne(id);
        List<MusicTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("music", music);
        modelMap.addAttribute("typeList", typeList);
        return "admin/music/updateMusic";
    }

    @RequestMapping(value = "/admin/music/updateP", method = RequestMethod.POST)
    public String updateBlogP(@ModelAttribute("musicP") MusicEntity musicEntity) {
        musicRepository.updateItem(musicEntity.getName(), musicEntity.getType().getId(),
                musicEntity.getComment(), musicEntity.getScore(), musicEntity.getCover(),musicEntity.getLink(),musicEntity.getId());
        musicRepository.flush();
        return "redirect:/admin/music";
    }

    @RequestMapping("/admin/music/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        musicRepository.delete(id);
        musicRepository.flush();
        return "redirect:/admin/music";
    }
}
