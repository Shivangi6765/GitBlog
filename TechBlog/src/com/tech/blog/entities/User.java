
//form se value fetch krne ke liye


package com.tech.blog.entities;
import java.sql.*;

public class User {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private Timestamp datetime;
	private String profile;

	public User(int id, String name, String email, String password, String gender, String about, Timestamp dateTime)
	{
		
		this.id=id;
		this.name=name;
		this .email=email;
		this.password=password;
		this.gender=gender;
		this.about=about;
		this.datetime=dateTime;
		
	}
	
	public User() {
		
	}
	
	public User(String name, String email, String password, String gender, String about, String profile)
	{
		
		this.name=name;
		this .email=email;
		this.password=password;
		this.gender=gender;
		this.about=about;
		this.profile = profile;
		
	}
	//getters and setters
   //hmare saare instance variable private h unki value update krne ke liye hme getter setter ki need hogi jisse hum object bnayenge or value pass krenge to asani se use get ya set kr skein
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
	
	
}
