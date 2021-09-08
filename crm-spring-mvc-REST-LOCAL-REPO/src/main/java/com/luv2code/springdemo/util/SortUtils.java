package com.luv2code.springdemo.util;

public enum SortUtils {
	
	FirstName("firstName"),
	LastName("lastName"),
	Email("email");
	
	public String sort;
	
	private SortUtils(String sort) {
		this.sort = sort;
	}
	
	public String getValue() {
		return sort;
	}
}
