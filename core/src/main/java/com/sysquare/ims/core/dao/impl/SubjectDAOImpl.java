package com.sysquare.ims.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sysquare.ims.core.dao.SubjectDAO;
import com.sysquare.ims.model.domain.Subject;

@Repository
public class SubjectDAOImpl implements SubjectDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void addSubject(Subject subject) {
		sessionFactory.getCurrentSession().save(subject);
	}

	public void updateSubject(Subject subject) {
		sessionFactory.getCurrentSession().update(subject);
    }

    public void removeSubject(Integer id) {
    	Subject subject = (Subject) sessionFactory.getCurrentSession().load(Subject.class, id);
		if (null != subject) {
			sessionFactory.getCurrentSession().delete(subject);
		}
    }

    @SuppressWarnings("unchecked")
	public List<Subject> list() {
    	return (List<Subject>)sessionFactory.getCurrentSession().createQuery("from Subject").list();
	}

	public Subject findById(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Subject.class);
        criteria.add(Restrictions.eq("id", id));
        Subject subject = (Subject)criteria.uniqueResult();
        return subject;
    }

    public Subject findByTitle(String title) {
    	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Subject.class);
        criteria.add(Restrictions.eq("title", title));
        Subject subject = (Subject)criteria.uniqueResult();
        return subject;
    }
}
