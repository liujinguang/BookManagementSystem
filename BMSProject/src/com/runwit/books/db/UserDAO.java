package com.runwit.books.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.runwit.books.model.User;
import com.runwit.common.db.BaseDAO;
import com.runwit.common.db.IParamBinding;
import com.runwit.common.db.IRowMapper;
import com.runwit.common.util.ParamUtil;

public class UserDAO extends BaseDAO {
	public void save(final User user) {
		String sql = "insert into users (account, password, name) values (?, ?, ?) ";
		updateBySQL(sql, new IParamBinding() {
			
			@Override
			public void bindParam(PreparedStatement pstmt) throws SQLException {
				pstmt.setString(1, user.getAccount());
				pstmt.setString(2, user.getPassword());
				pstmt.setString(3, user.getName());
			}
		});
	}
	
	public void update(final User user) {
		String sql = "update users set account=?, password=?, name=? where id = ?";
		updateBySQL(sql, new IParamBinding() {
			
			@Override
			public void bindParam(PreparedStatement pstmt) throws SQLException {
				pstmt.setString(1, user.getAccount());
				pstmt.setString(2, user.getPassword());
				pstmt.setString(3, user.getName());
				pstmt.setInt(4, user.getId());
			}
		});
	}
	
	public void delete(int id) {
		String sql = "delete from users where id = " + id;
		updateBySQL(sql);
	}
	
	class UserRowMapper implements IRowMapper<User> {

		@Override
		public User mappingRow(ResultSet rs) throws SQLException {
			User user = new User();
			user.setAccount(rs.getString("account"));
			user.setName(rs.getString("name"));
			user.setPassword(rs.getString("password"));
			user.setId(rs.getInt("id"));
			user.setCreateTime(ParamUtil.parseDateTime(rs.getTimestamp("createTime"), "yyyy-MM-dd HH:mm:ss"));
			
			return user;
		}
	}
	
	public List<User> queryAll() {
		return queryBySQL("select * from users", new UserRowMapper());
	}
	
	public User login(final String account, final String password) {
		String sql = "select * from users where account=? and password=?";
		List<User> list = queryBySQL(sql, new IParamBinding() {
			
			@Override
			public void bindParam(PreparedStatement pstmt) throws SQLException {
				pstmt.setString(1, account);
				pstmt.setString(2, password);
			}
		}, new UserRowMapper());
		
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return list.get(0);
		}
	}
}
