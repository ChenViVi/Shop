package com.keeper.controller.admin;

import com.keeper.repository.ItemRepository;
import com.keeper.repository.ItemTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
@RequestMapping(value = "/admin/items")
public class AdminItemController {

    @Autowired
    private ItemTypeRepository typeRepository;

    @Autowired
    private ItemRepository itemRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("typeList", typeRepository.findAll());
        modelMap.addAttribute("itemList", itemRepository.findAll());
        return "admin/items";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") int id) {
        itemRepository.delete(id);
        itemRepository.flush();
        return "redirect:/admin/items/";
    }
}
