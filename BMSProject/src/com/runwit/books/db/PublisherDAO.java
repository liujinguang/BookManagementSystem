package com.runwit.books.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.runwit.books.model.Publisher;
import com.runwit.common.db.BaseDAO;
import com.runwit.common.db.IParamBinding;
import com.runwit.common.db.IRowMapper;

public class PublisherDAO extends BaseDAO {
	public void save(final Publisher publisher) {
		String sql = "insert into publishers (name) values (?)";
		
		System.out.println(publisher);
		
		updateBySQL(sql, new IParamBinding() {

			@Override
			public void bindParam(PreparedStatement pstmt) throws SQLException {
				pstmt.setString(1, publisher.getName());
			}
		});
	}

	public void update(Publisher publisher) {
//		String sql = String.format("update publishers set name=\"%s\" where id = %d", publisher.getName(),
//				publisher.getId());
		
		String sql = "update publishers set name=? where id = ?";
		
		updateBySQL(sql, new IParamBinding() {
			
			@Override
			public void bindParam(PreparedStatement pstmt) throws SQLException {
				pstmt.setString(1, publisher.getName());
				System.out.println(publisher.getName());
				pstmt.setInt(2, publisher.getId());
			}
		});
	}
	
	public void delete(int id) {
		updateBySQL("delete from publishers where id = " + id);
	}
	
	public Publisher get(int id) {
		String sql = "select * from publishers where id = " + id;
		List<Publisher> publishers = queryBySQL(sql, new PublisherRowMapper());
		
		return publishers.size() == 0 ? null : publishers.get(0);
	}
	
	public List<Publisher> queryAll() {
		return queryBySQL("select * from publishers", new PublisherRowMapper());
	}
	
	class PublisherRowMapper implements IRowMapper<Publisher> {

		@Override
		public Publisher mappingRow(ResultSet rs) throws SQLException {
			return new Publisher(rs.getInt("id"), rs.getString("name"));
		}
		
	}
}
