package com.dataservice;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class ServerThread extends Thread{

	public  String HOST = "tcp://139.199.97.82:61613";
    public  String TOPIC = "net";
    private  String str = "0";
    private  String userName = "admin";
    private  String passWord = "password";
    private  MqttMessage message;
    private  String clientid = "server";
    private  MqttClient client;
    private  MqttTopic topic;

    public String getHOST() {
		return HOST;
	}

	public void setHOST(String hOST) {
		HOST = hOST;
	}

	public String getTOPIC() {
		return TOPIC;
	}

	public void setTOPIC(String tOPIC) {
		TOPIC = tOPIC;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public void run() {
        try {
			client = new MqttClient(HOST, clientid, new MemoryPersistence());
		} catch (MqttException e) {
		
			e.printStackTrace();
		}
        MqttConnectOptions options = new MqttConnectOptions();
        options.setCleanSession(false);
        options.setUserName(userName);
        options.setPassword(passWord.toCharArray());
        // 设置超时时间
        options.setConnectionTimeout(10);
        // 设置会话心跳时间
        options.setKeepAliveInterval(20);
        try {
            client.setCallback(new PushCallback());
            client.connect(options);
            topic = client.getTopic(TOPIC);
        } catch (Exception e) {
            e.printStackTrace();
        }
        message = new MqttMessage();
        message.setQos(0);
        message.setRetained(true);
        message.setPayload(str.getBytes());
        try {
        	 MqttDeliveryToken token = topic.publish(message);
             token.waitForCompletion();
             System.out.println("message is published completely! "
                     + token.isComplete());
		} catch (MqttException e) {
			e.printStackTrace();
		}

        System.out.println(message.isRetained() + "------ratained状态");   
       
    }
}