package com.runwit.books.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.runwit.books.model.Title;
import com.runwit.common.db.BaseDAO;
import com.runwit.common.db.IConnectionCreator;
import com.runwit.common.db.IRowMapper;

public class TitleDAO extends BaseDAO {
	public void save(Title title) {
		final String sql = "insert into title (isbn, title, editionNumber, copyright, publisherId, "
				+ "imageFile, price) values(?, ?, ?, ?, ?, ?, ?)";

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

				String sql2 = "insert into authorIsbn(isbn, authorId) values (?, ?)";
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
			title.setPublisherName(rs.getString("publisherName"));

			return title;
		}

	}
}
