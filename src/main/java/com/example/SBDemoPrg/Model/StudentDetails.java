package com.example.SBDemoPrg.Model;

public class StudentDetails {
	private long id;
	private String name;
	private String rollNo;
	private String dept;

	public StudentDetails() {}

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

	public String getDetails() {
		return id + " " + name + " " + rollNo + " " + dept;
	}
}
