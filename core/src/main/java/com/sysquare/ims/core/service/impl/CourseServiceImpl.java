package com.sysquare.ims.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sysquare.ims.core.dao.CourseDAO;
import com.sysquare.ims.core.service.CourseService;
import com.sysquare.ims.model.domain.Course;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDAO courseDAO;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addCourse(Course course) {
		courseDAO.addCourse(course);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateCourse(Course course) {
		courseDAO.updateCourse(course);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void removeCourse(Integer id) {
		courseDAO.removeCourse(id);
	}

	@Override
	public List<Course> list() {
		return courseDAO.list();
	}

	@Override
	public Course findByTitle(String title) {
		return courseDAO.findByTitle(title);
	}

	@Override
	public Course findById(Integer id) {
		return courseDAO.findById(id);
	}
    
}
