package com.sysquare.ims.web.ui.dto;

import org.hibernate.validator.constraints.NotEmpty;

public class CourseDTO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer courseId;
	@NotEmpty
	private String title;

	public CourseDTO() {
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "CourseDTO [courseId=" + courseId + ", title=" + title + "]";
	}
}
