package com.yizhan.test;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import java.security.spec.AlgorithmParameterSpec;

public class lj {
	    private static final byte[] DESkey = { (byte) 0x15, (byte) 0xE7,
	            (byte) 0xA1, (byte) 0x22, (byte) 0x96, (byte) 0x8B, (byte) 0x24,
	            (byte) 0xFA };// 设置密钥，略去

	    private static final byte[] DESIV = { (byte) 0xCE, (byte) 0x35, (byte) 0x5,
	            (byte) 0xD, (byte) 0x98, (byte) 0x91, (byte) 0x8, (byte) 0xA };// 设置向量，略去

	    static AlgorithmParameterSpec iv = null;// 加密算法的参数接口，IvParameterSpec是它的一个实现
	    private static Key key = null;

	    public lj() throws Exception {
	        DESKeySpec keySpec = new DESKeySpec(DESkey);// 设置密钥参数
	        iv = new IvParameterSpec(DESIV);// 设置向量
	        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");// 获得密钥工厂
	        key = keyFactory.generateSecret(keySpec);// 得到密钥对象

	    }
	    public String encode(String data) throws Exception {
	        Cipher enCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");// 得到加密对象Cipher
	        enCipher.init(Cipher.ENCRYPT_MODE, key, iv);// 设置工作模式为加密模式，给出密钥和向量
	        byte[] pasByte = enCipher.doFinal(data.getBytes("utf-8"));
	        BASE64Encoder base64Encoder = new BASE64Encoder();
	        return base64Encoder.encode(pasByte);
	    }

	    public String decode(String data) throws Exception {
	        Cipher deCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
	        deCipher.init(Cipher.DECRYPT_MODE, key, iv);
	        BASE64Decoder base64Decoder = new BASE64Decoder();
	        byte[] pasByte = deCipher.doFinal(base64Decoder.decodeBuffer(data));
	        return new String(pasByte, "UTF-8");
	    }

	    public static void main(String[] args) throws Exception {

	        lj tools = new lj();
	        System.out.println("加密:" + tools.encode("天下"));
	        System.out.println("解密:" + tools.decode(tools.encode("天下")));
	    }

}
