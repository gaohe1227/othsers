package com.doadway.common.shiro;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.velocity.tools.Scope;
import org.apache.velocity.tools.config.DefaultKey;
import org.apache.velocity.tools.config.ValidScope;

@DefaultKey("date")
@ValidScope(Scope.APPLICATION)
public class DateUtils {
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	public String formart(Timestamp timestamp){
		if(timestamp==null)
			return null;
		String dateTime = timestamp.toString();
		if(dateTime.indexOf(".")!=-1) {
			dateTime = dateTime.substring(0,dateTime.indexOf("."));
		}
		return dateTime;
	}
	
	public boolean gt(String startDate, String endDate) {
		Date start = null;
		Date end = null;
		try {
			start = dateFormat.parse(startDate);
			end = dateFormat.parse(endDate);
			if(start.after(end)){
				return true;
			}else{
				return false;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return true;
	}

	public boolean lt(String startDate, String endDate) {
		Date start = null;
		Date end = null;
		try {
			start = dateFormat.parse(startDate);
			end = dateFormat.parse(endDate);
			if(start.before(end)){
				return true;
			}else{
				return false;
			}		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean eq(String startDate, String endDate) {
		Date start = null;
		Date end = null;
		try {
			start = dateFormat.parse(startDate);
			end = dateFormat.parse(endDate);
			if(start.equals(end)){
				return true;
			}else{
				return false;
			}			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return false;
	}
}

