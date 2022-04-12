package com.aisolution.common.util;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RSA {
	private static final Logger log = LoggerFactory.getLogger(RSA.class);
	
	private String publicKeyModulus = "";
	private String publicKeyExponent = "";
	private PrivateKey privateKey = null;
	
	public static RSA getEncKey() {
		KeyPairGenerator generator;
		try {
			generator = KeyPairGenerator.getInstance("RSA");
		} catch(NoSuchAlgorithmException e) {
			log.error(e.getMessage());
			return null;
		}
		generator.initialize(1024);
		
		KeyPair keyPair = generator.genKeyPair();
		
		KeyFactory keyFactory;
		try{
			keyFactory = KeyFactory.getInstance("RSA");
		} catch(NoSuchAlgorithmException e) {
			log.error(e.getMessage());
			return null;
		}
		
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
		
		RSAPublicKeySpec publicSpec;
		try {
			publicSpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class); 
		} catch(InvalidKeySpecException e) {
			log.error(e.getMessage());
			return null;
		}
		
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
		
		RSA rsa = new RSA();
		rsa.setPrivateKey(privateKey);
		rsa.setPublicKeyExponent(publicKeyExponent);
		rsa.setPublicKeyModulus(publicKeyModulus);
		return rsa;
	}
	
	public static boolean dec(PrivateKey privateKey, String encString) throws Exception {
		boolean result = false;
		
		if (privateKey == null) {
			log.debug("Can't find a private key.");
			throw new RuntimeException("Can't find a private key.");
		}
		
		try {
			decryptRsa(privateKey, encString);
			result = true;
		} catch(Exception e) {
			log.error(e.getMessage());
			result = false;
		}
		
		return result;
	}
	
	public static String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		byte[] encryptedBytes = CommonUtils.hexToByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decryptedValue = new String(decryptedBytes, "utf-8");

		return decryptedValue;
	}
	
	public String getPublicKeyModulus() {
		return publicKeyModulus;
	}
	public void setPublicKeyModulus(String publicKeyModulus) {
		this.publicKeyModulus = publicKeyModulus;
	}
	public String getPublicKeyExponent() {
		return publicKeyExponent;
	}
	public void setPublicKeyExponent(String publicKeyExponent) {
		this.publicKeyExponent = publicKeyExponent;
	}
	public PrivateKey getPrivateKey() {
		return privateKey;
	}
	public void setPrivateKey(PrivateKey privateKey) {
		this.privateKey = privateKey;
	}
}
