package com.equipment.action;


import java.util.List;

import com.equipment.service.EquipmentService;
import com.equipment.vo.Equipment;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@SuppressWarnings("serial")
public class EquipmentAction extends ActionSupport implements ModelDriven<Equipment>{
	private Equipment equipment = new Equipment();
	
	public Equipment getModel() {
		return equipment;
	}

	private EquipmentService equipmentService;

	public void setEquipmentService(EquipmentService equipmentService) {
		this.equipmentService = equipmentService;
	}

	public String findByName(){
		Equipment listname = equipmentService.findByName(equipment.getName());
		ActionContext.getContext().getSession().put("listname", listname);
		return "findByName";
	}
	
	public String FindByUserId(){
		List<Equipment> listid = equipmentService.findByUserId(equipment.getUserid());
		ActionContext.getContext().getSession().put("listid", listid);
		return "findByUserId";
	}
	
	public String findAll() {

		List<Equipment> elist = equipmentService.findAll();

		ActionContext.getContext().getSession().put("elist", elist);
		
		return "findAll";
	}

	

	
}
