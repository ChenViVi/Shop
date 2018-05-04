package com.keeper.controller.test;

import com.keeper.model.UserEntity;
import com.keeper.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/admin/user/login", method = RequestMethod.GET)
    public String login() {
        return "admin/login";
    }

    @RequestMapping(value = "/admin/user/loginP", method = RequestMethod.POST)
    public String loginPost(@ModelAttribute("user") UserEntity userEntity) {
        List<UserEntity> userList = userRepository.findAll();
        for (UserEntity user:userList) {
            if (user.getName().equals(userEntity.getName())){
                if (user.getPassword().equals(userEntity.getPassword())){
                    System.out.println("oaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                }
                else break;
            }
        }
        return "admin/index";
    }
}
