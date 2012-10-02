package com.sysquare.ims.core.service;

import java.util.List;

import com.sysquare.ims.model.domain.Course;

public interface CourseService {
	
	public void addCourse(Course course);
    public void updateCourse(Course course);
    public void removeCourse(Integer id);
	public List<Course> list();
    public Course findById(Integer id);
    public Course findByTitle(String title);
    
}
