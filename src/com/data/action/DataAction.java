package com.data.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import com.data.service.DataService;
import com.data.vo.Data;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.user.vo.User;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class DataAction extends ActionSupport implements 
ModelDriven<Data>,ServletResponseAware,ServletRequestAware{
	
    private Data data = new Data();
	
	public Data getModel() {
		return data;
	}

	private DataService dataService;

	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}
	
	private HttpServletResponse response;
	private HttpServletRequest request;
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	public Integer userid;

	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	
	public Integer equipmentid;

	public void setEquipmentid(Integer equipmentid) {
		this.equipmentid = equipmentid;
	}

	public String data(){
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existUser == null) {
			this.addActionMessage("±§Ç¸!Äú»¹Ã»ÓÐµÇÂ¼!");
			return "msg";
		}
		return "data";
	}
	
	public void findTNew() throws ServletException, IOException{				
		
		response.setHeader("Access-Control-Allow-Origin", "*");  
		try {
			List<Data> list = dataService.finNew();
			JSONObject json = new JSONObject();
			for(int i=0; i<list.size(); i++){
				String str = list.get(i).getData();
				String[] strs = str.split(" ");
				json.accumulate("T", strs[4]);
			}
			response.setContentType("text/html;charset=UTF-8");
			this.response.getWriter().write(json.toString());
		} catch (IOException e) {
			request.getRequestDispatcher("/404.jsp").forward(request, response);
		}
		
	}
	public void findHNew() throws ServletException, IOException{
		response.setHeader("Access-Control-Allow-Origin", "*");  
		try {
			List<Data> list = dataService.finNew();
			JSONObject json = new JSONObject();
			for(int i=0; i<list.size(); i++){
				String str = list.get(i).getData();
				String[] strs = str.split(" ");
				json.accumulate("T", strs[6]);
			}
			response.setContentType("text/html;charset=UTF-8");
			this.response.getWriter().write(json.toString());
		} catch (IOException e) {
			request.getRequestDispatcher("/404.jsp").forward(request, response);
		}
		
		
		
	}
	
    public void save(){
    	String str = request.getParameter("equipmentid");
    	data.setEquipmentid(Integer.valueOf(str));
    	dataService.save(data);
	}
}
