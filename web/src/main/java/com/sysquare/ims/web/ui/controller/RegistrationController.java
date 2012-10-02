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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sysquare.ims.core.service.UserService;
import com.sysquare.ims.model.domain.User;
import com.sysquare.ims.web.ui.dto.RegistrationDTO;
import com.sysquare.ims.web.util.ValidationUtil;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

	private static final String MODEL_ATTRIBUTE = "RegistrationDTO";
	@Autowired
	UserService userService;
    @Autowired
    DTOBinder binder;
	
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public void getCreate(@ModelAttribute(MODEL_ATTRIBUTE)RegistrationDTO registrationDTO, ModelMap map, HttpServletRequest request) {
        //User user = WebUtil.getLoginUser(request);
    }
    
	@RequestMapping(value = "/checkUsernameAvailibility.ws", method = RequestMethod.GET)
    public @ResponseBody String checkUsernameAvailibility(@RequestParam String uname, HttpServletRequest request) {
    	User user = userService.findByUsername(uname);
    	return String.valueOf(user == null);
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String post(ModelMap map, @ModelAttribute(MODEL_ATTRIBUTE)@Valid RegistrationDTO registrationDTO, BindingResult result, HttpServletRequest request) {
        //User user = WebUtil.getLoginUser(request);
//        System.out.println("\n\n" + registrationDTO + "\n\n");
//        System.out.println("\n\n" + registrationDTO.getPicture() + "\n\n");
//        System.out.println(result);
        ValidationUtil.validatePictureUpload("picture", registrationDTO.getPicture(), result);
        if(result.hasErrors()) {
        	return "registration/create";
        }
        //Student student = binder.extractFromDto(Student.class, registrationDTO);
//        System.out.println(student);
        return "redirect:create.html";
    }
}

