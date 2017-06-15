package com.dataservice;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ControllerAction extends ActionSupport implements ServletResponseAware{
	
	private HttpServletResponse response;
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	public void tOpen(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK T 0");
			server.run();
			this.response.getWriter().write("TOpen");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void tClose(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK T 1");
			server.run();
			this.response.getWriter().write("TClose");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	public void tAdd(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK T +");
			server.run();
			this.response.getWriter().write("TAdd");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void tDel(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK T -");
			server.run(); 
			this.response.getWriter().write("TDel");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void lOpen(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK L 0");
			server.run();
			this.response.getWriter().write("LOpen");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void lClose(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK L 1");
			server.run();
			this.response.getWriter().write("TClose");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void lAdd(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK L +");
			server.run();
			this.response.getWriter().write("LAdd");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void lDel(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK L -");
			server.run();
			this.response.getWriter().write("LDel");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void wOpen(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK W 0");
			server.run();
			this.response.getWriter().write("WOpen");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void wClose(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK W 1");
			server.run();
			this.response.getWriter().write("WClose");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void wAdd(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK W +");
			server.run();
			this.response.getWriter().write("WAdd");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void wDel(){
		try {
			ServerThread server = new ServerThread();
			server.setStr("BACK W -");
			server.run();
			this.response.getWriter().write("WDel");
			server.interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
