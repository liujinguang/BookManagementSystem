package com.runwit.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ParamUtil {
	public static String parseDateTime(Date d, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		return sdf.format(d);
	}
	
	public static String getString(String str) {
		if (str == null) {
			return "";
		}
		
		return str.trim();
	}
	
	public static String appendParam(String url, String paramName, String paramValue) {
		int index = url.indexOf('?');
		if (index < 0) {
			return url + "?" + paramName + "=" + paramValue;
		} else {
			return url + "&" + paramName + "=" + paramValue;
		}
	}
}
