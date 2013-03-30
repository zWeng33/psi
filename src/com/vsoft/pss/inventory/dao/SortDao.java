package com.vsoft.pss.inventory.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import com.vsoft.core.base.dao.BaseDao;

@Repository
public class SortDao extends BaseDao {

	private final static Logger LOG = Logger.getLogger(SortDao.class);

	public boolean addSort(Map<String, Object> data) {
		try {
			this.insertToTable("com_pss_sort", data);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean updateSortById(Map<String, Object> data) {
		try {
			this.updateTableById("com_pss_sort", data);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<Map<String, Object>> queryAllSort(List<Object> params) {
		List<Map<String, Object>> datas = null;
		String sql = "select s.id,s.name,s.remark,s.level,ts.name as topname from com_pss_sort s left join com_pss_sort ts on s.topId = ts.id order by s.topId asc, s.id desc limit ? , ?";
		try {
			datas = this.executeQueryWithMultiple(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	public List<Map<String, Object>> queryAllSortByTopId(List<Object> params) {
		List<Map<String, Object>> datas = null;
		String sql = "select s.id,s.name,s.remark,ts.name as topname from com_pss_sort s left join com_pss_sort ts on s.topId = ts.id where s.topId = ? order by s.topId asc, s.id desc";
		try {
			datas = this.executeQueryWithMultiple(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}

	public Map<String, Object> queryOneSort(List<Object> params) {
		Map<String, Object> data = null;
		String sql = "select s.id,s.name,s.remark,s.topId,s.level from com_pss_sort s where s.id = ?";
		try {
			data = this.executeQueryWithSingle(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	public boolean deleteSort(String id) {
		StringBuffer sql = new StringBuffer("delete from com_pss_sort where id in (");
		sql.append(id).append(")");
		try {
			this.execute(sql.toString());
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public int countSortById() {
		int count = 0;
		try {
			count = this.countTable("com_pss_sort", "id", null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}