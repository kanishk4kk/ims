package com.sysquare.ims.core.service;

import java.util.List;

import com.sysquare.ims.model.domain.Subject;

public interface SubjectService {
	
	public void addSubject(Subject subject);
    public void updateSubject(Subject subject);
    public void removeSubject(Integer id);
	public List<Subject> list();
    public Subject findById(Integer id);
    public Subject findByTitle(String title);
    
}
