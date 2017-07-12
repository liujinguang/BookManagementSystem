package com.runwit.common.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

public class BaseDAO<T> {
	protected DbConnection dbConn;
	static Logger logger = Logger.getLogger(BaseDAO.class);

	public BaseDAO() {
		dbConn = new DbConnection();
	}

	/**
	 * execute add, delte update operations
	 * 
	 * @param sql
	 * @return
	 */
	public int updateBySQL(String sql) {
		Connection conn = null;
		Statement stat = null;

		try {
			conn = dbConn.getConnection();
			stat = conn.createStatement();
			logger.info(sql);
			return stat.executeUpdate(sql);
		} catch (SQLException e) {
			logger.info("SQL Exception");
			e.printStackTrace();

			return -1;
		} finally {
			dbConn.closeStatement(stat);
			dbConn.closeConnection(conn);
		}
	}

	/**
	 * update with PreparedStatement
	 * 
	 * @param sql
	 * @param bind
	 * @return
	 */
	public int updateBySQL(String sql, IParamBinding bind) {
		Connection conn = null;
		PreparedStatement pStatement = null;

		try {
			conn = dbConn.getConnection();
			pStatement = conn.prepareStatement(sql);
			logger.info(sql);
			bind.bindParam(pStatement);

			return pStatement.executeUpdate();
		} catch (SQLException e) {
			logger.info("SQL Exception");
			e.printStackTrace();

			return -1;
		} finally {
			dbConn.closeStatement(pStatement);
			dbConn.closeConnection(conn);
		}
	}
	
	public List<T> queryBySQL(String sql, IRowMapper<T> mapper) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<>();
		
		try {
			conn = dbConn.getConnection();
			stmt = conn.createStatement();
			logger.info(sql);
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				T t = mapper.mappingRow(rs);
				list.add(t);
			}
		} catch (SQLException e) {
			logger.info("SQL Exception");
		} finally {
			dbConn.closeResultSet(rs);
			dbConn.closeStatement(stmt);
			dbConn.closeConnection(conn);
		}
		
		return list;
	}
	
	public List<T> queryBySQL(String sql, IParamBinding bind, IRowMapper<T> mapper) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<>();
		
		try {
			conn = dbConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			logger.info(sql);
			bind.bindParam(pstmt); //bind parameters
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				T t = mapper.mappingRow(rs);
				list.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbConn.closeResultSet(rs);
			dbConn.closeStatement(pstmt);
			dbConn.closeConnection(conn);
		}
		
		return list;
	}
	
}
