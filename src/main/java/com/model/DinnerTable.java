package com.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DinnerTable {
	
	private Integer dId;
	private String tableName;
	private Integer tableStatus;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date orderTime;
	public Integer getdId() {
		return dId;
	}
	public void setdId(Integer dId) {
		this.dId = dId;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public Integer getTableStatus() {
		return tableStatus;
	}
	public void setTableStatus(Integer tableStatus) {
		this.tableStatus = tableStatus;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public DinnerTable(String tableName, Integer tableStatus, Date orderTime) {
		super();
		this.tableName = tableName;
		this.tableStatus = tableStatus;
		this.orderTime = orderTime;
	}
	public DinnerTable(String tableName, Date orderTime) {
		super();
		this.tableName = tableName;
		this.orderTime = orderTime;
	}
	public DinnerTable() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return String.format("DinnerTable [dId=%s, tableName=%s, tableStatus=%s, orderTime=%s]", dId, tableName,
				tableStatus, orderTime);
	}
}
