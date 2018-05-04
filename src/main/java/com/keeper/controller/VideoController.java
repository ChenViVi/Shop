package com.keeper.controller;


import com.keeper.model.VideoEntity;
import com.keeper.model.VideoTypeEntity;
import com.keeper.repository.VideoRepository;
import com.keeper.repository.VideoTypeRepository;
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
public class VideoController {

    @Autowired
    private VideoRepository videoRepository;

    @Autowired
    private VideoTypeRepository typeRepository;

    @RequestMapping(value = "/video", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        List<VideoTypeEntity> typeList = typeRepository.findAll();
        List<VideoEntity> videoList = videoRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        modelMap.addAttribute("videoList", videoList);
        return "video";
    }
}
