package com.runwit.common.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

public class DbConnection {
	private static String url = "jdbc:mysql://localhost:3306/db_bookms?verifyServerCertificate=false&useSSL=false";
	private static String user = "tester";
	private static String password = "infinera";

	private static Logger logger = Logger.getLogger(DbConnection.class);

	static {
		logger.info("Load JDBC driver");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			logger.info("Load JDB driver done.");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}

	/**
	 * close database connection
	 * 
	 * @param conn
	 */
	public void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * close Statement
	 * 
	 * @param stat
	 */
	public void closeStatement(Statement stat) {
		if (stat != null) {
			try {
				stat.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Close Result Set
	 * 
	 * @param rs
	 */
	public void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Commit transaction
	 * 
	 * @param conn
	 */
	public void commitTrans(Connection conn) {
		if (conn != null) {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void rollbackTrans(Connection conn) {
		if (conn != null) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
