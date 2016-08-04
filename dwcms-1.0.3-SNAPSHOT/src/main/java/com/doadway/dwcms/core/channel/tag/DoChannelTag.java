package com.doadway.dwcms.core.channel.tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;

public class DoChannelTag extends TagSupport {

	/**
	* @Fields serialVersionUID : TODO
	*/ 
	private static final long serialVersionUID = -1183073652760079932L;
	private Integer channelId=null;
	ChannelBiz channelBiz;
	private static String CHANEL = "CHANEL";
	private static String CONTENT = "CONTENT";
	private static String CHANNEL_NAME = "SHOWNAME";
	
	private String showType=DoChannelTag.CHANEL;	
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		channelBiz=(ChannelBiz)ac.getBean("channelBizImpl");
	}
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		JspWriter out = this.pageContext.getOut();
		
		try {
		 if(showType.equals(DoChannelTag.CHANEL)){
			 out.println("<select name=\"parentId\" id=\"parentId\">");
			 if(channelId==0){
				 out.println(createChannelSelect(0));
			 }else if(channelId!=null&&channelId!=0){
				 out.println(createChannelSelect(channelId));
				 
			 }
			 out.println("</select>");
		 }else if(showType.equals(DoChannelTag.CONTENT)){
			 out.println("<select name=\"channelId\" id=\"channelId\">");
			 if(channelId==0){
				 out.println(contentChannelSelect(0));
			 }else if(channelId!=null&&channelId!=0){
				 out.println(contentChannelSelect(channelId));
				 
			 }
			 out.println("</select>");			 
		 }else if(showType.equals(DoChannelTag.CHANNEL_NAME)){
			 if(channelId.equals("")||channelId==null||channelId==0){
				 out.println("根目录");
			 }else{
				 out.println(channelBiz.findChannelById(channelId).getChannelName());
			 }
		 }	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	@Override
	public void release() {
		// TODO Auto-generated method stub
		super.release();
	}


	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}


	Integer flag=0;
	public StringBuffer createChannelSelect(Integer id){
		StringBuffer str=new StringBuffer("");
		if(channelBiz.isParentChannel(id)){
				
				List<ChannelDTO> channelDtoList=new ArrayList<ChannelDTO>();
			    if(id==null||id==0){
			    	str.append("<option value=\"\" >顶级栏目</option>");
			    	channelDtoList=channelBiz.findChannelsByParentId(id);
			    	flag++;
			    }else{
			    	ChannelDTO channelDTO  =channelBiz.findChannelById(id);
			    	channelDtoList=channelBiz.findChannelsByParentId(channelDTO.getChannelId());
					str.append("<option value=\""+channelDTO.getChannelId()+"\">");
					for(int i=0;i<flag;i++){
						str.append("&nbsp;&nbsp;");
					}
					str.append(">"+channelDTO.getChannelName()+"</option>");
					flag++;
			    }
			   
				for(ChannelDTO tempChannelDto:channelDtoList){
					str.append(createChannelSelect(tempChannelDto.getChannelId()));
				}
				flag--;
		}else{
			ChannelDTO channelDTO  =channelBiz.findChannelById(id);
			str.append("<option value=\""+channelDTO.getChannelId()+"\">");
			for(int i=0;i<flag;i++){
				str.append("&nbsp;&nbsp;");
			}
			str.append(">"+channelDTO.getChannelName()+"</option>");
			
			
			return str;
		}
		return str;
	}

	
	
	Integer cFlag=0;
	public StringBuffer contentChannelSelect(Integer id){
		StringBuffer str=new StringBuffer("");
		if(channelBiz.isParentChannel(id)){
				
				List<ChannelDTO> channelDtoList=new ArrayList<ChannelDTO>();
			    if(id==null||id==0){
			    	str.append("<option value=\"\" >顶级栏目</option>");
			    	channelDtoList=channelBiz.findChannelsByParentId(id);
			    	List<ChannelDTO> tempChannelDtoList = new ArrayList<ChannelDTO>();
			    	for(ChannelDTO cDto:channelDtoList){
			    		if(cDto.getModelId()!=2){
			    			tempChannelDtoList.add(cDto);
			    		}
			    	}
			    	channelDtoList=tempChannelDtoList;
			    	cFlag++;
			    }else{
			    	ChannelDTO channelDTO  =channelBiz.findChannelById(id);
			    	channelDtoList=channelBiz.findChannelsByParentId(channelDTO.getChannelId());
			    	List<ChannelDTO> tempChannelDtoList = new ArrayList<ChannelDTO>();
			    	for(ChannelDTO cDto:channelDtoList){
			    		if(cDto.getModelId()!=2){
			    			tempChannelDtoList.add(cDto);
			    		}
			    	}
			    	channelDtoList=tempChannelDtoList;
					str.append("<option value=\""+channelDTO.getChannelId()+"\">");
					for(int i=0;i<flag;i++){
						str.append("&nbsp;&nbsp;");
					}
					str.append(">"+channelDTO.getChannelName()+"</option>");
					cFlag++;
			    }
			   
				for(ChannelDTO tempChannelDto:channelDtoList){
					str.append(contentChannelSelect(tempChannelDto.getChannelId()));
				}
				cFlag--;
		}else{
			ChannelDTO channelDTO  =channelBiz.findChannelById(id);
			str.append("<option value=\""+channelDTO.getChannelId()+"\">");
			for(int i=0;i<cFlag;i++){
				str.append("&nbsp;&nbsp;");
			}
			str.append(">"+channelDTO.getChannelName()+"</option>");
			
			
			return str;
		}
		return str;
	}

	
	public String getShowType() {
		return showType;
	}

	public void setShowType(String showType) {
		this.showType = showType;
	}

	public static void main(String args[]){
		DoChannelTag doChannelTag = new DoChannelTag();
		System.out.println(doChannelTag.createChannelSelect(null).toString());
	}

}
