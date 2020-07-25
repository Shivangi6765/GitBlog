package com.tech.blog.entities;

public class Message {             //agr koi glt login krta h to ye message usko dikhe
	
	
	private String content;
	private String type;
	private String cssClass;
	
	//constructor
	public Message(String content, String type, String cssClass) {
		this.content = content;
		this.type = type;
		this.cssClass = cssClass;
	}
	
	//getters and setters
                                                
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getcssClass() {
		return cssClass;
	}

	public void setcssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
	
	
	
	
	

}
