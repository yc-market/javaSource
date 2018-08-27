package com.yc.market.util;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

public class ServletUtils {

	@SuppressWarnings("unchecked")
	public static <T>T getParameter(HttpServletRequest request, Class<T> cls, String obj) {
		String s = request.getParameter(obj);
		// 空值跳过
				if (s == null)
					return null;

				// 声明转换后 的值变量
				T ovalue = null;
				// 判断 字段类型
				switch (cls.getName().toLowerCase()) {
				case "java.lang.string":
					ovalue = (T)s;
					break;
				case "byte":
				case "java.lang.byte":
					ovalue = (T) Byte.valueOf(s);
					break;
				case "short":
				case "java.lang.short":
					ovalue = (T) Short.valueOf(s);
					break;
				case "int":
				case "java.lang.integer":
					ovalue = (T) Integer.valueOf(s);
					break;
				case "long":
				case "java.lang.long":
					ovalue = (T) Long.valueOf(s);
					break;
				case "float":
				case "java.lang.float":
					ovalue = (T) Float.valueOf(s);
					break;
				case "double":
				case "java.lang.double":
					ovalue = (T) Double.valueOf(s);
					break;
				case "boolean":
				case "java.lang.boolean":
					ovalue = (T) Boolean.valueOf(s);
					break;
				case "char":
				case "java.lang.character":
					ovalue = (T) Character.valueOf(s.charAt(0));
					break;
				case "java.sql.date":
					ovalue = (T) Date.valueOf(s);
					break;
				case "java.sql.timestamp":
					ovalue = (T) Timestamp.valueOf(s);
					break;
				}
				
				return ovalue;
	}

}
