package com.user.action;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.data.service.DataService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.user.service.UserService;
import com.user.vo.User;


@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User>,ServletResponseAware{
	private User user = new User();

	public User getModel() {
		return user;
	}

	// 注入UserService
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	private DataService dataService;

	
	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}

	private HttpServletResponse response;
	
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	

	/**
	 * 跳转到注册页面的执行方法
	 */
	public String registerPage() {
		return "registerPage";
	}

	/**
	 * 用户注册
	 */
	public String register() {
		userService.save(user);
		this.addActionMessage("注册成功!请去邮箱激活!");
	    
		return "index";
	}
	
	public void androidregister() {
		userService.save(user);
		try {
			this.response.getWriter().write("ok");
		} catch (IOException e) {

			e.printStackTrace();
		}
	    
		
	}

	/**
	 * 用户激活的方法
	 */
	public void androidactive() {
		// 根据激活码查询用户:
		
		User existUser = userService.findByCode(user.getCode());
		// 判断
		if (existUser == null) {
			// 激活码错误
			try {
				this.response.getWriter().write("active0");
			} catch (IOException e) {

				e.printStackTrace();
			}
		} else {
			
			// 修改用户的状态
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			try {
				this.response.getWriter().write("active1");
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
	}
	
	public String active() {
		// 根据激活码查询用户:
		User existUser = userService.findByCode(user.getCode());
		// 判断
		if (existUser == null) {
			// 激活码错误
			this.addActionMessage("激活失误:激活码错误!");
		} else {
			
			// 修改用户的状态
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功:请去登录!");
		}
		return "index";
	}

	/**
	 * 跳转到登录页面
	 */
	public String loginPage() {
		return "loginPage";
	}


	public String login() {
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			this.addActionError("登录失败:用户名或密码错误或用户未激活!");
			return LOGIN;
		} else {
			// 登录成功
			// 将用户的信息存入到session域
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			// 页面跳转
			return "loginSuccess";
		}
	
	}
	
	public void androidlogin() {
		
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			try {
				this.response.getWriter().write("failure");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 登录成功
			try {
				
				String data = dataService.finNew().get(0).getData();
				this.response.getWriter().write("exit"+data);
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	}
	/**
	 * 用户退出的方法
	 */
	public String quit(){
		// 消毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

}
