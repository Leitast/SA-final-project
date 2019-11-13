package com.model;

public class FoodType {

	private Integer ftypeId;
	private String typeName;
	public Integer getFtypeId() {
		return ftypeId;
	}
	public void setFtypeId(Integer ftypeId) {
		this.ftypeId = ftypeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public FoodType(Integer ftypeId, String typeName) {
		super();
		this.ftypeId = ftypeId;
		this.typeName = typeName;
	}
	public FoodType(String typeName) {
		super();
		this.typeName = typeName;
	}
	public FoodType() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return String.format("FoodType [ftypeId=%s, typeName=%s]", ftypeId, typeName);
	}
	
}
