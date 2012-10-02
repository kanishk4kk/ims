package com.sysquare.ims.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sysquare.ims.core.dao.SubjectDAO;
import com.sysquare.ims.core.service.SubjectService;
import com.sysquare.ims.model.domain.Subject;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectDAO subjectDAO;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addSubject(Subject subject) {
		subjectDAO.addSubject(subject);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateSubject(Subject subject) {
		subjectDAO.updateSubject(subject);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void removeSubject(Integer id) {
		subjectDAO.removeSubject(id);
	}

	@Override
	public List<Subject> list() {
		return subjectDAO.list();
	}

	@Override
	public Subject findByTitle(String title) {
		return subjectDAO.findByTitle(title);
	}

	@Override
	public Subject findById(Integer id) {
		return subjectDAO.findById(id);
	}
    
}
