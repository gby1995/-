package com.equipmenttype.service;

import java.util.List;
import com.equipmenttype.dao.EquipmentTypeDao;
import com.equipmenttype.vo.EquipmentType;
import com.util.PageBean;


public class EquipmentTypeService {
	
	//注入Dao
	private EquipmentTypeDao equipmenttypeDao;

	public void setEquipmenttypeDao(EquipmentTypeDao equipmenttypeDao) {
		this.equipmenttypeDao = equipmenttypeDao;
	}
	//查询所有设备类型
	public List<EquipmentType> findAll() {
		return equipmenttypeDao.findAll();
	}
	//根据用户id查询
	public List<EquipmentType> findByUserId(Integer id) {
		return equipmenttypeDao.findByUserId(id);
	}
	
	// 按设备名字名查询用户
	public EquipmentType findByName(String name){
		return equipmenttypeDao.findByName(name);
	}
	//删除设备
	public void delete(EquipmentType exist) {
		equipmenttypeDao.delete(exist);
	}
	
	//分页查询
	public PageBean<EquipmentType> findByPage(int page) {
		PageBean<EquipmentType> pageBean = new PageBean<EquipmentType>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 9;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = equipmenttypeDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合
		int begin = (page - 1) * limit;
		List<EquipmentType> list = equipmenttypeDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
}
