package com.sysquare.ims.web.ui.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.jdto.DTOBinder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sysquare.ims.core.service.CourseService;
import com.sysquare.ims.core.service.UserService;
import com.sysquare.ims.model.domain.Course;
import com.sysquare.ims.model.domain.User;
import com.sysquare.ims.web.ui.dto.CourseDTO;
import com.sysquare.ims.web.util.WebUtil;

@Controller
@RequestMapping("/course")
public class CourseController {

	private static final String MODEL_ATTRIBUTE = "CourseDTO";
	@Autowired
	UserService userService;
	@Autowired
	CourseService courseService;
    @Autowired
    DTOBinder binder;
	
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public void getCreate(@ModelAttribute(MODEL_ATTRIBUTE)CourseDTO courseDTO, ModelMap map, HttpServletRequest request) {
        //User user = WebUtil.getLoginUser(request);
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String post(ModelMap map, @ModelAttribute(MODEL_ATTRIBUTE)@Valid CourseDTO courseDTO, BindingResult result, HttpServletRequest request) {
        User loginUser = WebUtil.getLoginUser(request);
        System.out.println("\n\n" + courseDTO + "\n\n");
        if(result.hasErrors()) {
        	return "/master/add";
        }
        Course course = binder.extractFromDto(Course.class, courseDTO);
        course.setUpdatedBy(loginUser);
        courseService.addCourse(course);
        return "redirect:/master/add.html";
    }
}

