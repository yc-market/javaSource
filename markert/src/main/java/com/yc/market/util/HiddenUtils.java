package com.yc.market.util;

import java.io.FileNotFoundException;

public class HiddenUtils {
	
	public static void Hidden(String a){
		//计算length的时候，不区分中文与英文
		//规则，保留末尾两位，前面4个字符换为****,超过的这6位的保持为原来的状态
		if(a.length()<=6){
			a=a.substring(a.length()-2,a.length());	
			a="****"+a;
			System.out.print(a);
			}else{
		       a=a.replaceFirst(a.substring(a.length()-6, a.length()-2), "****");
		       System.out.println(a);
			}
	}
	public static void main(String[] args) throws FileNotFoundException {
		 
		
		 
		String a="14132514364136346346";
		Hidden(a);
		
	
	}
}
