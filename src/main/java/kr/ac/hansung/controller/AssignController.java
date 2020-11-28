package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.hansung.model.Subject;
import kr.ac.hansung.service.AssignService;

@Controller
public class AssignController {

	@Autowired
	private AssignService assignService;
	
	//여기서 bean을던져줘야 assign.jsp에서 사용이 가능하다.
	@RequestMapping("/assign")
	public String showSubjects(Model model) {
		
		model.addAttribute("subject", new Subject());
		
		return "assign";
	}
	
	@RequestMapping("/docreate")
	public String doCreate(Model model, @Valid Subject subject, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Form Error");
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error:errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "assign";
		}
		
		assignService.insert(subject);
		return "redirect:info";
	}
}
