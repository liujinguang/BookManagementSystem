package com.runwit.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ParamUtil {
	public static String parseDateTime(Date d, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		return sdf.format(d);
	}
}
