package com.runwit.books.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.runwit.books.model.Author;
import com.runwit.common.db.BaseDAO;
import com.runwit.common.db.IParamBinding;
import com.runwit.common.db.IRowMapper;

public class AuthorDAO extends BaseDAO {
	public void save(final Author author) {
		String sql = "insert into authors (firstName, lastName) value(?, ?)";
		updateBySQL(sql, new IParamBinding() {

			@Override
			public void bindParam(PreparedStatement pstmt) throws SQLException {
				pstmt.setString(1, author.getFirstName());
				pstmt.setString(2, author.getLastName());
			}
		});
	}

	public void update(Author author) {
		String sql = String.format("update authors set firstName=%s, lastName=%s where id=%d", author.getFirstName(),
				author.getLastName(), author.getId());

		updateBySQL(sql);
	}

	public void delete(int authorId) {
		String sql = "delete from authors where id=" + authorId;

		updateBySQL(sql);
	}

	public Author get(int authorId) {
		String sql = "select * from authors where id=" + authorId;

		List<Author> authors = queryBySQL(sql, new AuthorRowMapper());

		return authors.size() == 0 ? null : authors.get(0);
	}

	public List<Author> queryAll() {
		String sql = "select * from authors";
		return queryBySQL(sql, new AuthorRowMapper());
	}

	class AuthorRowMapper implements IRowMapper<Author> {

		@Override
		public Author mappingRow(ResultSet rs) throws SQLException {
			return new Author(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"));
		}

	}

}
