package com.dz.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * 获得精确到秒的时间
 */
public class TimeUtil {
		public static String getDate() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date secondDate = new Date();
			String date = sdf.format(secondDate);
			try {
				secondDate = sdf.parse(date);
				return date;
			} catch (Exception e) {
				e.printStackTrace();
				return "0000-00-00";
			}
		}
}
