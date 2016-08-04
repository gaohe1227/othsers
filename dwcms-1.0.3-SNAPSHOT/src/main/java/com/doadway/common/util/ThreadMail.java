package com.doadway.common.util;



import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import java.util.Date;


import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.Session;
import java.util.Properties;
import javax.mail.MessagingException;




public class ThreadMail implements Runnable{
	  
    String smtp="smtp";
    String port="25";
    String from="";
    String to="";
    String cc="";
    String content="";
    String subject="";
    String user="";
    String pass="";
    boolean auth=false;
    boolean debug=false;
  

  
  
  /**
   * 发送Email方法
   * @return boolean
   */
  public void run(){
    
      try {
        //System.out.println(Thread.currentThread().getName()+" excute ......");
      
        //创建属性对象
        Properties props = new Properties();
        //设置邮件传输协议为：smtp
        props.put("mail.transpost.protocol","smtp");
        //设置邮件服务器地址
        props.put("mail.smtp.host", this.smtp);

        //设置邮件服务器端口
        props.put("mail.smtp.port",this.port);
      
      
        //创建session对象
        Session sendMailSession=null;
      
       if(this.auth){
                //设置邮件验证为真
                props.put("mail.smtp.auth", "true");
                SmtpAuthenticator sa=new SmtpAuthenticator(this.user,this.pass);
                sendMailSession = Session.getInstance(props, sa);
                
        }else{
                sendMailSession = Session.getInstance(props, null);
                 
       }
     
       //设置输出调试信息
       sendMailSession.setDebug(this.debug);
     
        //创建信息对象
       final MimeMessage newMessage = new MimeMessage(sendMailSession);
     
        //设置发信人地址
        newMessage.setFrom(new InternetAddress(this.from));
      

        //设置收信人地址，可以支持多用户发送

        newMessage.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(this.to));
      
        //设置抄送人地址
        newMessage.setRecipients(Message.RecipientType.CC,
                InternetAddress.parse(this.cc));

        //设置信件正文
        newMessage.setContent(content, "text/html;charset=utf-8");

        //设置信件主题

        newMessage.setSubject(this.subject,"GB2312");

        //设置信件发送日期
      
        newMessage.setSentDate(new Date());
      
        //发送邮件
        System.out.println("begin send to "+to+"...");
        Transport.send(newMessage);
        System.out.println(Thread.currentThread().getName());
      
      }catch(MessagingException e){
    	  e.printStackTrace();
    	  System.out.println("msg error:"+e.getLocalizedMessage());
          System.out.println("to="+to+" title="+subject+" send mail Failed...");
      }
  }
 
  /**
   * 设置smtp服务器地址
   * @param smtp
   */
  public void setSmtp(String smtp){
      this.smtp=smtp;
  }
 
  /**
   * 设置端口
   * @param port
   */
  public void setPort(String port){
      this.port=port;
  }
 
  /**
   * 设置发信人地址
   * @param from
   */
  public void setFrom(String from){
      this.from=from;
  }
  /**
   * 设置收信人地址，可以支持多用户发送(,分隔)
   * @param to
   */
  public void setTo(String to){
      this.to=to;
  }
 
  /**
   * 设置抄送人地址
   * @param from
   */
  public void setCC(String cc){
      this.cc=cc;
  }
 
  /**
   * 设置正文内容text格式
   * @param content
   */
  public void setContent(String content){
      this.content=content;
  }
 
  /**
   * 设置标题
   * @param subject
   */
  public void setSubject(String subject){
      this.subject=subject;
  }
 
  /**
   * 验证的用户名
   * @param user
   */
  public void setUser(String user){
      this.user=user;
  }
 
  /**
   * 验证的用户密码
   * @param pass
   */
  public void setPass(String pass){
      this.pass=pass;
  }
 
  /**
   * 是否验证
   * @param auth
   */
  public void setAuth(boolean auth){
      this.auth=auth;
  }
 
  /**
   * 是否输出调试信息
   * @param debug
   */
  public void setDebug(boolean debug){
      this.debug=debug;
  }
 
    
  }

