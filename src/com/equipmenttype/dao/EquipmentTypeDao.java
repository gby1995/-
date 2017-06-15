package com.equipmenttype.dao;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.equipmenttype.vo.EquipmentType;
import com.util.PageHibernateCallback;


public class EquipmentTypeDao extends HibernateDaoSupport{
	@SuppressWarnings("unchecked")
	public EquipmentType findByName(String name) {
		String hql = "from EquipmentType where name = ?";
		List<EquipmentType> list = this.getHibernateTemplate().find(hql, name);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void save(EquipmentType equipmenttype) {
		this.getHibernateTemplate().save(equipmenttype);
	}
	

	public List<EquipmentType> findByPage(int begin, int limit) {
		String hql = "from EquipmentType";
		List<EquipmentType> list = this.getHibernateTemplate().execute(new PageHibernateCallback<EquipmentType>(hql, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<EquipmentType> findAll() {
		String hql = "from EquipmentType";
		List<EquipmentType> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	@SuppressWarnings("unchecked")
	public int findCount() {
		String hql = "select count(*) from EquipmentType";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	//根据用户名查询设备
	@SuppressWarnings("unchecked")
	public List<EquipmentType> findByUserId(Integer id) {
		String hql = "from EquipmentType where userid = ?";
		List<EquipmentType> list = this.getHibernateTemplate().find(hql, id);
		return list;
	}

	public void delete(EquipmentType equipmenttype) {
		this.getHibernateTemplate().delete(equipmenttype);
	}
}
