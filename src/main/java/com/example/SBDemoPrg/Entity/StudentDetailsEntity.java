package com.example.SBDemoPrg.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Student_SB_Table")
public class StudentDetailsEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	private String name;
	private String rollNo;
	private String dept;
	private String cgpa;
	private String attprecent;
	public StudentDetailsEntity() {
		super();
	}
	
	public StudentDetailsEntity(String name, String rollNo, String dept, String cgpa, String attprecent) {
		super();
		this.name = name;
		this.rollNo = rollNo;
		this.dept = dept;
		this.cgpa = cgpa;
		this.attprecent = attprecent;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getCgpa() {
		return cgpa;
	}

	public void setCgpa(String cgpa) {
		this.cgpa = cgpa;
	}

	public String getAttprecent() {
		return attprecent;
	}

	public void setAttprecent(String attprecent) {
		this.attprecent = attprecent;
	}
	
	
	
}
