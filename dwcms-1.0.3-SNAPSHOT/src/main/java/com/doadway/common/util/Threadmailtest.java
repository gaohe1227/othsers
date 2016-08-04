package com.doadway.common.util;


public class Threadmailtest {

	public static void main(String[] args) throws Exception{
		TheadPool tp = new TheadPool(20);
		// 任务数
		ThreadMail r[] = new ThreadMail[3000];
		r[0] = new ThreadMail();
		r[0].setTo("45115517@qq.com");
		r[0].setAuth(true);
		r[0].setSmtp("smtp.qq.com");
		r[0].setFrom("1624413124@qq.com");
		r[0].setUser("1624413124");
		r[0].setPass("A45115517");
		r[0].setSubject("线程池发送邮件测试");
		r[0].setContent("您好!这是陈曦雨发来的测试文件");
		tp.execute(r[0]);
	}

}



