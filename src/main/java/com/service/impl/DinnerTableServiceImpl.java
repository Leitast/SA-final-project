package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.DinnerTableMapper;
import com.model.DinnerTable;
import com.service.DinnerTableService;

@Service
public class DinnerTableServiceImpl implements DinnerTableService {

	@Autowired
	private DinnerTableMapper dinnerTableMapper;
	
	@Override
	public List<DinnerTable> findDinnerTable(DinnerTable dinnerTable) {
		// TODO Auto-generated method stub
		return this.dinnerTableMapper.findDinnerTable(dinnerTable);
	}

	@Override
	public int updateDinnerTable(DinnerTable dinnerTable) {
		// TODO Auto-generated method stub
		return this.dinnerTableMapper.updateDinnerTable(dinnerTable);
	}

	@Override
	public int deleteDinnerTable(Integer dId) {
		// TODO Auto-generated method stub
		return this.dinnerTableMapper.deleteDinnerTable(dId);
	}

	@Override
	public int insertDinnerTable(DinnerTable dinnerTable) {
		// TODO Auto-generated method stub
		return this.dinnerTableMapper.insertDinnerTable(dinnerTable);
	}

	@Override
	public DinnerTable getDinnerByID(Integer dId) {
		// TODO Auto-generated method stub
		return this.dinnerTableMapper.getDinnerByID(dId);
	}
	

}
