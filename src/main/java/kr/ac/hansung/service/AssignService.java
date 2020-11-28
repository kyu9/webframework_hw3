package kr.ac.hansung.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.SubjectDao;
import kr.ac.hansung.model.Subject;

@Service
public class AssignService {
	
	@Autowired
	private SubjectDao subjectDao;

	
	public void insert(Subject subject) {
		subjectDao.insert(subject);
	}

}
