package com.vsoft.pss.receipt.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.vsoft.core.base.dao.BaseDao;

@Repository
public class ReceiptDao extends BaseDao {

	private static final Logger LOG = Logger.getLogger(ReceiptDao.class);

	public int addReceiptReturnId(Map<String, Object> data) {
		int id = 0;
		try {
			id = this.insertAndReturnPrimaryId("com_pss_receipt", data);
			LOG.info("新增单据成功");
		} catch (SQLException e) {
			LOG.error("新增单据时出错", e);
			e.printStackTrace();
		}
		return id;
	}
}
