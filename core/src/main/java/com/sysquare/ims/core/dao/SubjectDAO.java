package com.sysquare.ims.core.dao;

import java.util.List;

import com.sysquare.ims.model.domain.Subject;

public interface SubjectDAO {
	
	public void addSubject(Subject subject);
    public void updateSubject(Subject subject);
    public void removeSubject(Integer id);
	public List<Subject> list();
    public Subject findById(Integer id);
    public Subject findByTitle(String title);
}
