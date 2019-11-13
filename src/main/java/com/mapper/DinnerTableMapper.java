package com.mapper;

import java.util.List;

import com.model.DinnerTable;

public interface DinnerTableMapper {
	
	//查询餐桌
	public List<DinnerTable> findDinnerTable(DinnerTable dinnerTable);
	
	//更新餐桌状态
	public int updateDinnerTable(DinnerTable dinnerTable);
	
	//删除餐桌
	public int deleteDinnerTable(Integer dId);
	
	//添加餐桌
	public int insertDinnerTable(DinnerTable dinnerTable);
	
	//根据ID查餐桌
	public DinnerTable getDinnerByID(Integer dId);

}
