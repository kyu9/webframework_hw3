package kr.ac.hansung.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.hansung.model.Subject;
import kr.ac.hansung.service.SubjectService;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("/info")
	public String showSubjects(Model model) {
		int s1 = subjectService.getYSscore(2016, 1);
		int s2 = subjectService.getYSscore(2016, 2);
		int s3 = subjectService.getYSscore(2017, 1);
		int s4 = subjectService.getYSscore(2017, 2);
		int s5 = subjectService.getYSscore(2020, 1);
		int s6 = subjectService.getYSscore(2020, 2);
		
		model.addAttribute("s1", s1);
		model.addAttribute("s2", s2);
		model.addAttribute("s3", s3);
		model.addAttribute("s4", s4);
		model.addAttribute("s5", s5);
		model.addAttribute("s6", s6);
		
		
		//전체다를 가져오는 방법
		//List<Subject> subjects = subjectService.getCurrent();
		//model.addAttribute("subjects", subjects);
		
		return "info";
	}
	
	@RequestMapping("/info/s1")
	public String showS1(Model model) {
		List<Subject> subjects = subjectService.getYSsubjects(2016, 1);
		model.addAttribute("subjects", subjects);
		return "detail";
	}
	@RequestMapping("/info/s2")
	public String showS2(Model model) {
		List<Subject> subjects = subjectService.getYSsubjects(2016, 2);
		model.addAttribute("subjects", subjects);
		return "detail";
	}
	@RequestMapping("/info/s3")
	public String showS3(Model model) {
		List<Subject> subjects = subjectService.getYSsubjects(2017, 1);
		model.addAttribute("subjects", subjects);
		return "detail";
	}
	@RequestMapping("/info/s4")
	public String showS4(Model model) {
		List<Subject> subjects = subjectService.getYSsubjects(2017, 2);
		model.addAttribute("subjects", subjects);
		return "detail";
	}
	@RequestMapping("/info/s5")
	public String showS5(Model model) {
		List<Subject> subjects = subjectService.getYSsubjects(2020, 1);
		model.addAttribute("subjects", subjects);
		return "detail";
	}
	@RequestMapping("/info/s6")
	public String showS6(Model model) {
		List<Subject> subjects = subjectService.getYSsubjects(2020, 2);
		model.addAttribute("subjects", subjects);
		return "detail";
	}
	
	@RequestMapping("/detail")
	public String doConfirm(Model model) {
		List<Subject> subjects = subjectService.getYSsubjects(2021, 1);

		model.addAttribute("subjects", subjects);
		
		return "detail";
	}
	
	
}
