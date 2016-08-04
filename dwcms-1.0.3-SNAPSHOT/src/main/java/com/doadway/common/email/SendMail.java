package com.doadway.common.email;

import javax.annotation.Resource;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
@Service
public class SendMail {
	@Resource(name="mailSender")
	JavaMailSender sender; 
	public SendMail() {
	}
	public void send() {
		SimpleMailMessage mail = new SimpleMailMessage(); //<span style="color: rgb(255, 0, 0);">注意SimpleMailMessage只能用来发送text格式的邮件</span>

		try {
			mail.setTo("45115517@qq.com");//接受者
			mail.setFrom("45115517@qq.com");//发送者,这里还可以另起Email别名，不用和xml里的username一致
			mail.setSubject("spring mail test!");//主题
			mail.setText("springMail的简单发送测试");//邮件内容
			sender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]){
		SendMail s = new SendMail();
		s.send();
	}
}