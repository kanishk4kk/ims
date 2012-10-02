package com.sysquare.ims.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sysquare.ims.core.dao.BatchDAO;
import com.sysquare.ims.core.service.BatchService;
import com.sysquare.ims.model.domain.Batch;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BatchServiceImpl implements BatchService {

	@Autowired
	private BatchDAO batchDAO;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addBatch(Batch batch) {
		batchDAO.addBatch(batch);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateBatch(Batch batch) {
		batchDAO.updateBatch(batch);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void removeBatch(Integer id) {
		batchDAO.removeBatch(id);
	}

	@Override
	public List<Batch> list() {
		return batchDAO.list();
	}

	@Override
	public Batch findByTitle(String title) {
		return batchDAO.findByTitle(title);
	}

	@Override
	public Batch findById(Integer id) {
		return batchDAO.findById(id);
	}
    
}
