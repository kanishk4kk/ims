package com.sysquare.ims.core.dao;

import java.util.List;

import com.sysquare.ims.model.domain.Course;

public interface CourseDAO {
	
	public void addCourse(Course course);
    public void updateCourse(Course course);
    public void removeCourse(Integer id);
	public List<Course> list();
    public Course findById(Integer id);
    public Course findByTitle(String title);
}
