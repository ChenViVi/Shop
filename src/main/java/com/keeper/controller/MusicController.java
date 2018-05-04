package com.keeper.controller;



import com.keeper.model.MusicEntity;
import com.keeper.model.MusicTypeEntity;
import com.keeper.repository.MusicRepository;
import com.keeper.repository.MusicTypeRepository;
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
public class MusicController {

    @Autowired
    private MusicRepository musicRepository;

    @Autowired
    private MusicTypeRepository typeRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        List<MusicTypeEntity> typeList = typeRepository.findAll();
        List<MusicEntity> musicList = musicRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        modelMap.addAttribute("musicList", musicList);
        return "index";
    }
}
