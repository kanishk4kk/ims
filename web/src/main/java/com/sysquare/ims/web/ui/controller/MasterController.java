package com.sysquare.ims.web.ui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sysquare.ims.core.service.BatchService;
import com.sysquare.ims.core.service.CourseService;
import com.sysquare.ims.core.service.SubjectService;

@Controller
@RequestMapping("/master")
public class MasterController {
	@Autowired
	CourseService courseService;
	@Autowired
	SubjectService subjectService;
	@Autowired
	BatchService batchService;
	
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public void getCreate(ModelMap map) {
    	map.put("courses", courseService.list());
    	map.put("subjects", subjectService.list());
    	map.put("batches", batchService.list());
    }
}


