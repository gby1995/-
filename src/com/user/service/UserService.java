package com.user.service;

import com.user.dao.UserDao;
import com.user.vo.User;
import com.util.MailUitls;
import com.util.UUIDUtils;

public class UserService {
	    // 注入UserDao
		private UserDao userDao;

		public void setUserDao(UserDao userDao) {
			this.userDao = userDao;
		}
		
		
		// 按用户名查询用户
		public User findByUsername(String username){
			return userDao.findByUsername(username);
		}

		// 业务层完成用户注册
		public void save(User user) {
			// 将数据存入到数据库
			user.setState(0); // 0:代表用户未激活.  1:代表用户已经激活.
			String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
			user.setCode(code);
			userDao.save(user);
			// 发送激活邮件;
			System.out.println(22222+user.getUsername());
			System.out.println(33333+user.getPassword());
			System.out.println(111111+user.getEmail());
			MailUitls.sendMail(user.getEmail(), code);
		}

		// 业务层根据激活码查询用户
		public User findByCode(String code) {
			return userDao.findByCode(code);
		}

		// 修改用户的状态的方法
		public void update(User existUser) {
			userDao.update(existUser);
		}

		// 用户登录
		public User login(User user) {
			return userDao.login(user);
		}



		public User findByUid(Integer uid) {
			return userDao.findByUid(uid);
		}


		public void delete(User existUser) {
			userDao.delete(existUser);
		}
}
