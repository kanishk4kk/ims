package com.sysquare.ims.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sysquare.ims.core.dao.CourseDAO;
import com.sysquare.ims.model.domain.Course;

@Repository
public class CourseDAOImpl implements CourseDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void addCourse(Course course) {
		sessionFactory.getCurrentSession().save(course);
	}

	public void updateCourse(Course course) {
		sessionFactory.getCurrentSession().update(course);
    }

    public void removeCourse(Integer id) {
    	Course course = (Course) sessionFactory.getCurrentSession().load(Course.class, id);
		if (null != course) {
			sessionFactory.getCurrentSession().delete(course);
		}
    }

    @SuppressWarnings("unchecked")
	public List<Course> list() {
    	return (List<Course>)sessionFactory.getCurrentSession().createQuery("from Course").list();
	}

	public Course findById(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Course.class);
        criteria.add(Restrictions.eq("id", id));
        Course course = (Course)criteria.uniqueResult();
        return course;
    }

    public Course findByTitle(String title) {
    	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Course.class);
        criteria.add(Restrictions.eq("title", title));
        Course course = (Course)criteria.uniqueResult();
        return course;
    }
}
