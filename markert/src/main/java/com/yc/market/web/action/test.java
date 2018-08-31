package com.yc.market.web.action;

import java.util.Random;

import com.yc.market.util.Mail;

public class test {
	public static void main(String[] args) {
		Random r=new Random();
		int num=r.nextInt(999)+1000;
		String code=Integer.toString(num);
		Mail m=new Mail("1289058338@qq.com",code);
		try {
			m.sent();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
