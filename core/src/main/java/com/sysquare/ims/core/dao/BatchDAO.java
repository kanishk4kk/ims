package com.sysquare.ims.core.dao;

import java.util.List;

import com.sysquare.ims.model.domain.Batch;

public interface BatchDAO {
	
	public void addBatch(Batch batch);
    public void updateBatch(Batch batch);
    public void removeBatch(Integer id);
	public List<Batch> list();
    public Batch findById(Integer id);
    public Batch findByTitle(String title);
}
