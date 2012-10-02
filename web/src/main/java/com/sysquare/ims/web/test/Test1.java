package com.sysquare.ims.web.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test1 {

	public static void main(String[] args) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MMM/yyyy");
		
		Date date = simpleDateFormat.parse("12/dec/2012");
		
		System.out.println(date);
	}

}
