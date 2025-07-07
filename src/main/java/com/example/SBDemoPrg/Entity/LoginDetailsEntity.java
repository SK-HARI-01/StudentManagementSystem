package com.example.SBDemoPrg.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="LoginDetailsTable")
public class LoginDetailsEntity {
		
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID")
	private int id;
	
	@Column(name="username")
	private String username;

	@Column(name="useremail")
	private String useremail;
	
	@Column(name="Password")
	private String password;
	
	public LoginDetailsEntity() {
		super();
	}

	public LoginDetailsEntity(String username, String useremail, String password) {
		super();
		this.username = username;
		this.useremail = useremail;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
