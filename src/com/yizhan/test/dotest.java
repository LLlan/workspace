package com.yizhan.test;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;

import com.fusioncharts.database.DBConnection;
import com.weixin.method.staticMethod;
import com.weixin.test.GetUrl;
import com.yizhan.util.FileUtil;
import com.yizhan.util.PathUtil;

public class dotest {

	/**
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-3-30
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String url =dotest.toPassWord("yangym","0000");
		System.out.println(url);
	}
	
	public static String toPassWord(String userName,String pwd){
		String string =  new SimpleHash("SHA-1", userName, pwd).toString();
		return string;
	}

}
