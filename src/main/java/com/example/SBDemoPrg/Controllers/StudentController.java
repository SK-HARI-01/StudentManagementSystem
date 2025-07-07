package com.example.SBDemoPrg.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.SBDemoPrg.Entity.StudentDetailsEntity;
//import com.example.SBDemoPrg.Model.StudentDetails;
import com.example.SBDemoPrg.Repository.StudentRepo;



@Controller
@RequestMapping("/student-details")
public class StudentController {
	
	@Autowired
	private StudentRepo studentRepo;
	
	@GetMapping("/home")
	public String home() {
		return "StdHomePage";
	}
	
	@GetMapping("/getdetails")
	public String hello() {
		return "StdGetDetails";
	}
	
	@GetMapping("/Student-db-details")
	public String getStudents(@RequestParam(name="searchparam",required=false) String uname, Model model) {

	    List<StudentDetailsEntity> students;

	    if (uname != null && !uname.equalsIgnoreCase("null") && !uname.trim().isEmpty()) {
	        students = studentRepo.findByPartialName(uname);
	    } else {
	        students = studentRepo.findAll();
	    }

	    model.addAttribute("students", students);
	    return "StdViewDetails";
	}
	
	@GetMapping("/update-form")
	public String showUpdateForm(@RequestParam("id") long id, Model model) {
	    StudentDetailsEntity student = studentRepo.findById(id).orElse(null);
	    model.addAttribute("student", student);
	    return "StdUpdateForm"; // JSP file name
	}

	@PostMapping("/update")
	public String updateStudent(
	        @RequestParam("id") long id,
	        @RequestParam("name") String name,
	        @RequestParam("rollNo") String rollNo,
	        @RequestParam("dept") String dept,
	        @RequestParam("cgpa") String cgpa,
	        @RequestParam("attprecent") String attprecent) {

	    StudentDetailsEntity student = studentRepo.findById(id).orElse(null);
	    if (student != null) {
	        student.setName(name);
	        student.setRollNo(rollNo);
	        student.setDept(dept);
	        student.setCgpa(cgpa);
	        student.setAttprecent(attprecent);
	        studentRepo.save(student);
	    }

	    return "redirect:/student-details/Student-db-details";
	}

	@PostMapping("/delete")
	public String deleteStudent(@RequestParam("id") long id) {
	    studentRepo.deleteById(id);
	    return "redirect:/student-details/Student-db-details";
	}


	@PostMapping("/add-student-details-to-db")
    public String addStudent(
    		@RequestParam("name") String name,
    		@RequestParam("rollNo") String rollNo,
    		@RequestParam("dept") String dept,
    		@RequestParam(name="cgpa",defaultValue="NaN") String cgpa,
    		@RequestParam(name="attprecent",defaultValue="NaN") String attprecent,
    		Model model)
	{
		StudentDetailsEntity student = new StudentDetailsEntity(name,rollNo,dept,cgpa,attprecent);
		
		studentRepo.save(student);
		System.out.println("Successfully inserted to database...");
		
        return "StdGetDetails";
    }
}
