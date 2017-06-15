package com.equipment.service;


import java.util.List;
import com.equipment.dao.EquipmentDao;
import com.equipment.vo.Equipment;

public class EquipmentService {
	private EquipmentDao equipmentDao;
	

	public void setEquipmentDao(EquipmentDao equipmentDao) {
		this.equipmentDao = equipmentDao;
	}

	// 按用户名查询用户
	public Equipment findByName(String name){
		return equipmentDao.findByName(name);
	}
	
	public List<Equipment> findByUserId(Integer id){
		return equipmentDao.findByUserId(id);
	}
	
	public List<Equipment> findAll() {
		return equipmentDao.findAll();
	}

	public void save(Equipment equipment) {
		// 将数据存入到数据库
		equipmentDao.save(equipment);
	}

	public void delete(Equipment exist) {
		equipmentDao.delete(exist);
	}
}
