package com.data.service;

import java.util.List;
import com.data.dao.DataDao;
import com.data.vo.Data;

public class DataService {
	
    private DataDao dataDao;

	public void setDataDao(DataDao dataDao) {
		this.dataDao = dataDao;
	}	
	
	public List<String> findByEquipmentId(Integer equipmentid){
		return dataDao.findByEquipmentId(equipmentid);
	}

	public void save(Data data) {

		dataDao.save(data);
		
	}
	
	public List<Data> finNew(){
		return dataDao.findNew();
	}


	public void delete(Data data) {
		dataDao.delete(data);
	}
}
