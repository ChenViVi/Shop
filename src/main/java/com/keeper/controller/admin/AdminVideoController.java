package com.keeper.controller.admin;

import com.keeper.model.MusicEntity;
import com.keeper.model.MusicTypeEntity;
import com.keeper.model.VideoEntity;
import com.keeper.model.VideoTypeEntity;
import com.keeper.repository.MusicRepository;
import com.keeper.repository.MusicTypeRepository;
import com.keeper.repository.VideoRepository;
import com.keeper.repository.VideoTypeRepository;
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
    private VideoTypeRepository typeRepository;

    @Autowired
    private VideoRepository videoRepository;

    @RequestMapping(value = "/admin/video", method = RequestMethod.GET)
    public String showMusic(ModelMap modelMap) {
        List<VideoEntity> videoList = videoRepository.findAll();
        modelMap.addAttribute("videoList", videoList);
        return "admin/video/video";
    }

    @RequestMapping(value = "/admin/video/add", method = RequestMethod.GET)
    public String addMusic(ModelMap modelMap) {
        List<VideoTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        return "admin/video/addVideo";
    }

    @RequestMapping(value = "/admin/video/addP", method = RequestMethod.POST)
    public String addMusicPost(@ModelAttribute("video") VideoEntity video) {
        videoRepository.saveAndFlush(video);
        return "redirect:/admin/video";
    }

    @RequestMapping("/admin/video/update/{id}")
    public String updateMusic(@PathVariable("id") int id, ModelMap modelMap) {
        VideoEntity video = videoRepository.findOne(id);
        List<VideoTypeEntity> typeList = typeRepository.findAll();
        modelMap.addAttribute("video", video);
        modelMap.addAttribute("typeList", typeList);
        return "admin/video/updateVideo";
    }

    @RequestMapping(value = "/admin/video/updateP", method = RequestMethod.POST)
    public String updateBlogP(@ModelAttribute("videoP") VideoEntity video) {
        videoRepository.updateVideo(video.getName(), video.getType().getId(),
                video.getComment(), video.getScore(), video.getCover(),video.getLink(),video.getId());
        videoRepository.flush();
        return "redirect:/admin/video";
    }

    @RequestMapping("/admin/video/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        videoRepository.delete(id);
        videoRepository.flush();
        return "redirect:/admin/video";
    }
}
