package com.vsoft.customer.user.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.log4j.Logger;

import com.vsoft.core.base.dao.BaseDao;

public class UserGroupDao extends BaseDao {
	private static final Logger LOG = Logger.getLogger(UserGroupDao.class);

	public void addUserGroup(Map<String, Object> data) {
		try {
			this.insertToTable("com_customer_usergroup", data);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
