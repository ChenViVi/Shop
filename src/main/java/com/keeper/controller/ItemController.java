package com.keeper.controller;


import com.keeper.model.ItemEntity;
import com.keeper.model.ItemTypeEntity;
import com.keeper.repository.ItemRepository;
import com.keeper.repository.ItemTypeRepository;
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
public class ItemController {

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private ItemTypeRepository typeRepository;

    @RequestMapping(value = "/items", method = RequestMethod.GET)
    public String items(ModelMap modelMap) {
        List<ItemTypeEntity> typeList = typeRepository.findAll();
        List<ItemEntity> itemList = itemRepository.findAll();
        modelMap.addAttribute("typeList", typeList);
        modelMap.addAttribute("itemList", itemList);
        return "items";
    }
}
