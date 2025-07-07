package com.example.SBDemoPrg.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="User_Details_Table")
public class UserDetailsEntity {

	@Id
	private int udtid;
	
	@Column(name="first_name")
	private String fname;
	
	@Column(name="last_name")
	private String lname;
	
	@Column(name="phone_number")
	private String  phno;
	
	@Column(name="address")
	private String address;

}
