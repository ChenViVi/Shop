package com.keeper.controller;

import com.keeper.model.UserEntity;
import com.keeper.model.base.BaseEntity;
import com.keeper.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    @ResponseBody
    public BaseEntity login(@RequestParam(value="account") String account, @RequestParam(value="password") String password) {
        BaseEntity entity = new BaseEntity();
        List<UserEntity> users = userRepository.findByAccount(account);
        if (users.size() == 0){
            entity.setMsg("此用户名未注册");
        }
        else {
            UserEntity user = users.get(0);
            if (user.getPassword().equals(password)){
                entity.setCode(1);
                entity.setMsg("登录成功");
                entity.setData(account);
            }
            else {
                entity.setMsg("密码错误");
            }
        }
        return entity;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    @ResponseBody
    public BaseEntity register(@RequestParam(value="account") String account, @RequestParam(value="password") String password) {
        BaseEntity entity = new BaseEntity();
        if(userRepository.findByAccount(account).size() != 0){
            entity.setMsg("此用户名已被注册");
        }
        else{
            UserEntity user = new UserEntity();
            user.setAccount(account);
            user.setPassword(password);
            userRepository.save(user);
            entity.setCode(1);
            entity.setData(account);
        }
        return entity;
    }
}
