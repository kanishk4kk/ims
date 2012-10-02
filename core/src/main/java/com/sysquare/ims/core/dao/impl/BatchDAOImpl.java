package com.sysquare.ims.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sysquare.ims.core.dao.BatchDAO;
import com.sysquare.ims.model.domain.Batch;

@Repository
public class BatchDAOImpl implements BatchDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void addBatch(Batch batch) {
		sessionFactory.getCurrentSession().save(batch);
	}

	public void updateBatch(Batch batch) {
		sessionFactory.getCurrentSession().update(batch);
    }

    public void removeBatch(Integer id) {
    	Batch batch = (Batch) sessionFactory.getCurrentSession().load(Batch.class, id);
		if (null != batch) {
			sessionFactory.getCurrentSession().delete(batch);
		}
    }

    @SuppressWarnings("unchecked")
	public List<Batch> list() {
    	return (List<Batch>)sessionFactory.getCurrentSession().createQuery("from Batch").list();
	}

	public Batch findById(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Batch.class);
        criteria.add(Restrictions.eq("id", id));
        Batch batch = (Batch)criteria.uniqueResult();
        return batch;
    }

    public Batch findByTitle(String title) {
    	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Batch.class);
        criteria.add(Restrictions.eq("title", title));
        Batch batch = (Batch)criteria.uniqueResult();
        return batch;
    }
}
