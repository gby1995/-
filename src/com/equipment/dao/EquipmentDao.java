package com.equipment.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.equipment.vo.Equipment;



public class EquipmentDao extends HibernateDaoSupport{
	@SuppressWarnings("unchecked")
	public Equipment findByName(String name) {
		String hql = "from Equipment where name = ?";
		List<Equipment> list = this.getHibernateTemplate().find(hql, name);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Equipment> findByUserId(Integer id) {
		String hql = "from Equipment where userid = ?";
		List<Equipment> list = this.getHibernateTemplate().find(hql, id);
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Equipment> findAll() {
		String hql = "from Equipment";
		List<Equipment> list = this.getHibernateTemplate().find(hql);
		return list;
	}
	
	public void save(Equipment equipment) {
		this.getHibernateTemplate().save(equipment);
	}

	@SuppressWarnings("unchecked")
	public int findCount() {
		String hql = "select count(*) from Equipment";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}


	public void delete(Equipment equipment) {
		this.getHibernateTemplate().delete(equipment);
	}
}
