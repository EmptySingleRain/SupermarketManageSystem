package mybean;

import java.util.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateFormatTransform {
	public String format(Timestamp timestamp){
		
	     Date date = null;
	     if (timestamp != null)
	     date = new Date(timestamp.getTime());
	     DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=df.format(date);
		 return time;
	}
	
	public static String format(String timestampStr){
		
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());  
		 timestamp = Timestamp.valueOf(timestampStr);  
	     Date date = null;
	     if (timestamp != null)
	     date = new Date(timestamp.getTime());
	     DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=df.format(date);
		 return time;
	}
	
}
