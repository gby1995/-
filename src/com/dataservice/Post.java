package com.dataservice;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Post {
	 public void sendPost(String url, String str, String equipmentid) {
		   
		   URL strurl = null;
		   try{
			   strurl = new URL(url);
			   HttpURLConnection conn = (HttpURLConnection) strurl.openConnection();
			   conn.setDoInput(true);
			   conn.setDoOutput(true);
			   conn.setRequestMethod("POST");
			   conn.setUseCaches(false);
			   conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			   conn.setRequestProperty("Charset", "utf-8");
			   conn.connect();
			   DataOutputStream dop = new DataOutputStream(conn.getOutputStream());
			   dop.writeBytes("data="+str+"&equipmentid="+equipmentid);
			   dop.flush();
			   dop.close();
			   
			   
			   BufferedReader bf = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			   String result = "";
			   String readLine = null;
			   while((readLine = bf.readLine())!=null){
				   result += readLine;
			   }
			   bf.close();
			   conn.disconnect();
			   
		   }catch(IOException e){
			   e.printStackTrace();
		   }
	   } 
	
}
