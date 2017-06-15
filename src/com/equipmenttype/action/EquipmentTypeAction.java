package com.equipmenttype.action;


import java.util.List;
import com.equipmenttype.service.EquipmentTypeService;
import com.equipmenttype.vo.EquipmentType;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.util.PageBean;

@SuppressWarnings("serial")
public class EquipmentTypeAction extends ActionSupport implements ModelDriven<EquipmentType>{
	
	private EquipmentType equipmenttype = new EquipmentType();

	public EquipmentType getModel() {
		return equipmenttype;
	}
	
	private EquipmentTypeService equipmenttypeService;

	public void setEquipmenttypeService(EquipmentTypeService equipmenttypeService) {
		this.equipmenttypeService = equipmenttypeService;
	}
	
	// Ω” ’page
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}
	
	public String findByUserId(){
		List<EquipmentType> typesid = equipmenttypeService.findByUserId(equipmenttype.getUserid());
		ActionContext.getContext().getSession().put("typesid", typesid);
		return "findByUserId";
	}
	
	public String findByName(){
		EquipmentType typesname = equipmenttypeService.findByName(equipmenttype.getName());
		ActionContext.getContext().getSession().put("typesname", typesname);
		
		return "findByName";
	}
	
	public String findByPage(){
		
		PageBean<EquipmentType> pageBean = equipmenttypeService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findByPage";
	}
	
	

	public String findAll() {

		List<EquipmentType> types = equipmenttypeService.findAll();

		ActionContext.getContext().getSession().put("types", types);
		
		return "findAll";
	}
}
