package com.equipment.vo;

import java.util.HashSet;
import java.util.Set;

import com.data.vo.Data;

public class Equipment {
	private Integer equipmentid;
	private String name;
	private Integer userid;
	private Integer equipmenttypeid;
	private Set<Data> data = new HashSet<Data>();
	public Integer getEquipmentid() {
		return equipmentid;
	}
	public void setEquipmentid(Integer equipmentid) {
		this.equipmentid = equipmentid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getEquipmenttypeid() {
		return equipmenttypeid;
	}
	public void setEquipmenttypeid(Integer equipmenttypeid) {
		this.equipmenttypeid = equipmenttypeid;
	}
	public Set<Data> getData() {
		return data;
	}
	public void setData(Set<Data> data) {
		this.data = data;
	}

	
}
