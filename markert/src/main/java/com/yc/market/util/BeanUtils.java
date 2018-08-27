package com.yc.market.util;
import java.lang.reflect.Field;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

public class BeanUtils {
	public static void toBean(HttpServletRequest request, Object obj) {
		Field[] fields = obj.getClass().getDeclaredFields();
		// 输入的值对象为空则退出
		for (Field f : fields) {
			String name = f.getName();

			String value = request.getParameter(name);
			// 空值跳过
			if (value == null) {
				continue;
			}
			try {
				Object ovalue = cast(value, f.getType());
				// 设置字段可直接访问
				f.setAccessible(true);
				// 将字段值设置到obj对象中去
				f.set(obj, ovalue);
			} catch (SecurityException | IllegalArgumentException | IllegalAccessException e1) {
				System.err.println("请求参数解析错误：参数名=" + f.getName() + ". 字段类型" + f.getType() + ". 参数值=" + value);
			}

			/*
			 * 
			 * if(value != null){ try { if( f.getType().equals(String.class) ){
			 * f.set(obj, value); }else if(f.getType().equals(Integer.class)){
			 * f.set(obj, Integer.valueOf(value)); }else
			 * if(f.getType().equals(Timestamp.class)){//其他几种类型自己实现 f.set(obj,
			 * Timestamp.valueOf(value)); } } catch (IllegalArgumentException e)
			 * { // TODO Auto-generated catch block e.printStackTrace(); } catch
			 * (IllegalAccessException e) { // TODO Auto-generated catch block
			 * e.printStackTrace(); } }
			 */
		}
	}

	@SuppressWarnings("unchecked")
	private static <T> T cast(String value, Class<T> cls) {
		// 空值跳过
		if (value == null)
			return null;

		// 声明转换后 的值变量
		T ovalue = null;
		// 判断 字段类型
		switch (cls.getName().toLowerCase()) {
		case "java.lang.string":
			ovalue = (T) value;
			break;
		case "byte":
		case "java.lang.byte":
			ovalue = (T) Byte.valueOf(value);
			break;
		case "short":
		case "java.lang.short":
			ovalue = (T) Short.valueOf(value);
			break;
		case "int":
		case "java.lang.integer":
			ovalue = (T) Integer.valueOf(value);
			break;
		case "long":
		case "java.lang.long":
			ovalue = (T) Long.valueOf(value);
			break;
		case "float":
		case "java.lang.float":
			ovalue = (T) Float.valueOf(value);
			break;
		case "double":
		case "java.lang.double":
			ovalue = (T) Double.valueOf(value);
			break;
		case "boolean":
		case "java.lang.boolean":
			ovalue = (T) Boolean.valueOf(value);
			break;
		case "char":
		case "java.lang.character":
			ovalue = (T) Character.valueOf(value.charAt(0));
			break;
		case "java.sql.date":
			ovalue = (T) Date.valueOf(value);
			break;
		case "java.sql.timestamp":
			ovalue = (T) Timestamp.valueOf(value);
			break;
		}
		
		return ovalue;
	}
	
	public static void main(String[] args){
		System.out.println(cast("100",int.class));
	}

}
