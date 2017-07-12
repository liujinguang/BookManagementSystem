package com.runwit.common.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface IRowMapper<T> {
	public T mappingRow(ResultSet rs) throws SQLException;
}
