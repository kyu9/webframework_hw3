package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.SubjectDao;
import kr.ac.hansung.model.Subject;

@Service
public class SubjectService {
	
	@Autowired
	private SubjectDao subjectDao;
	
	public List<Subject> getCurrent(){
		return subjectDao.getSubjects();
	}
	
	public int getYSscore(int year, int semester) {
		return subjectDao.getYSscore(year, semester);
	}
	
	public List<Subject> getYSsubjects(int year, int semester){
		return subjectDao.getYSsubjects(year, semester);
	}

}
