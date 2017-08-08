package com.runwit.books.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.runwit.books.model.Author;
import com.runwit.books.model.Title;
import com.runwit.common.db.BaseDAO;
import com.runwit.common.db.IConnectionCreator;
import com.runwit.common.db.IRowMapper;

public class TitleDAO extends BaseDAO {
	static Logger logger = Logger.getLogger(BaseDAO.class);

	public void save(Title title) {
		final String sql = "insert into titles (isbn, title, editionNumber, copyright, publisherId, "
				+ "imageFile, price) values(?, ?, ?, ?, ?, ?, ?)";
		
		System.out.println(title);

		executeInConnection(new IConnectionCreator() {

			@Override
			public boolean doInConnection(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title.getIsbn());
				pstmt.setString(2, title.getTitle());
				pstmt.setInt(3, title.getEditionNumber());
				pstmt.setString(4, title.getCopyright());
				pstmt.setInt(5, title.getPublisherId());
				pstmt.setString(6, title.getImageFile());
				pstmt.setFloat(7, title.getPrice());

				pstmt.executeUpdate();

				String sql2 = "insert into authorisbn(isbn, id) values (?, ?)";
				pstmt = conn.prepareStatement(sql2);

				int[] aids = title.getAuthorIds();
				if (aids != null) {
					for (int i = 0; i < aids.length; i++) {
						final int aid = aids[i];
						pstmt.setString(1, title.getIsbn());
						pstmt.setInt(2, aid);
						pstmt.addBatch();
					}
					pstmt.executeBatch();
				}

				return true;
			}
		});
	}

	public void update(final Title title) {
		final String sql = "update titles set title=?, editionNumber=?, copyright=?, "
				+ "publisherId=?, imageFile=?, price=? where isbn=?";

		executeInConnection(new IConnectionCreator() {
			@Override
			public boolean doInConnection(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, title.getTitle());
				pstmt.setInt(2, title.getEditionNumber());
				pstmt.setString(3, title.getCopyright());
				pstmt.setInt(4, title.getPublisherId());
				pstmt.setString(5, title.getImageFile());
				pstmt.setFloat(6, title.getPrice());
				pstmt.setString(7, title.getIsbn());

				logger.debug(pstmt);
				pstmt.executeUpdate();
				pstmt.close();

				// delete author's publish information
				pstmt = conn.prepareStatement("delete from authorisbn where isbn=?");
				pstmt.setString(1, title.getIsbn());
				pstmt.executeUpdate();
				pstmt.close();

				pstmt = conn.prepareStatement("insert into authorisbn (isbn, id) values (?, ?)");
				int[] aids = title.getAuthorIds();
				if (aids != null) {
					for (int i = 0; i < aids.length; i++) {
						final int aid = aids[i];
						pstmt.setString(1, title.getIsbn());
						pstmt.setInt(2, aid);
						pstmt.addBatch();

						logger.debug(pstmt);
					}
					pstmt.executeBatch();
				}
				pstmt.close();

				return true;
			}
		});
	}

	public List<Title> queryAll() {
		String sql = "select t.*, p.name from titles t left outer join publishers p on t.publisherId=p.id";
		return queryBySQL(sql, new TitleRowMapper());
	}

	public List<Title> quickSearch(String isbn, String title) {
		String sql = null;
		if (!isbn.equals("") && !title.equals("")) {
			sql = "select t.*, p.name from titles t left outer join publishers p on t.publisherId = p.id";
			sql += " where isbn like \"%" + isbn + "%\" or title like \"%" + title + "%\"";
		} else if (!title.equals("")) {
			sql = "select t.*, p.name from titles t left outer join publishers p on t.publisherId = p.id";
			sql += " where title like \"%" + title + "%\"";
		} else if (!isbn.equals("")) {
			sql = "select t.*, p.name from titles t left outer join publishers p on t.publisherId = p.id";
			sql += " where isbn like \"%" + isbn + "%\"";
		} else {
			return new ArrayList<Title>();
		}

		return queryBySQL(sql, new TitleRowMapper());
	}

	public Title get(String isbn) {
		String sql = "select t.*, name from titles t left outer join publishers p on t.publisherId = p.id where isbn='"
				+ isbn + "'";
		List<Title> titles = queryBySQL(sql, new TitleRowMapper());

		return titles.size() == 0 ? null : titles.get(0);
	}

	public void delete(String isbn) {
		String sql1 = "delete from authorisbn where isbn = '" + isbn + "'";
		String sql2 = "delete from titles where isbn='" + isbn + "'";

		executeBatch(new String[] { sql1, sql2 });
	}

	public Integer[] getAuthorIdsByIsbn(String isbn) {
		String sql = "select id from authorisbn where isbn = '" + isbn + "'";

		List<Integer> list = queryBySQL(sql, new IRowMapper<Integer>() {
			@Override
			public Integer mappingRow(ResultSet rs) throws SQLException {
				return rs.getInt(1);
			}
		});

		return list.toArray(new Integer[0]);
	}

	public List<Author> getAuthorModelsByIsbn(String isbn) {
		String sql = "select authors.* from authors, authorisbn where authors.id=authorisbn.id and authorisbn.isbn='"
				+ isbn + "'";
		List<Author> myList = queryBySQL(sql, new IRowMapper<Author>() {

			@Override
			public Author mappingRow(ResultSet rs) throws SQLException {
				Author model = new Author(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"));
				return model;
			}
		});
		return myList;
	}

	class TitleRowMapper implements IRowMapper<Title> {

		@Override
		public Title mappingRow(ResultSet rs) throws SQLException {
			Title title = new Title();

			title.setCopyright(rs.getString("copyright"));
			title.setIsbn(rs.getString("isbn"));
			title.setEditionNumber(rs.getInt("editionNumber"));
			title.setCopyright(rs.getString("copyright"));
			title.setImageFile(rs.getString("imageFile"));
			title.setPrice(rs.getFloat("price"));
			title.setPublisherId(rs.getInt("publisherID"));
			title.setTitle(rs.getString("title"));
			title.setPublisherName(rs.getString("name"));

			return title;
		}

	}
}
