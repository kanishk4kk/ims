package com.sysquare.ims.web.ui.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {

    @RequestMapping("/home")
    public void listUsers(ModelMap map, HttpServletRequest request) {
        //User user = WebUtil.getLoginUser(request);
    }
}
