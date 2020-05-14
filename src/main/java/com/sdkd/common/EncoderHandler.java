package com.sdkd.common;

import java.security.MessageDigest;

public class EncoderHandler {

	private static final char[] HEX_DIGITS = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
	/**
	 * encode string
	 *
	 * @param algorithm
	 * @param str
	 * @return String
	 */
	private static String encode(String algorithm, String str) {
		if (str == null) {
			return null;
		}
		try {
			MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
			messageDigest.update(str.getBytes());
			return getFormattedText(messageDigest.digest());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}
	/**
	 * Takes the raw bytes from the digest and formats them correct.
	 *
	 * @param bytes
	 *            the raw bytes from the digest.
	 * @return the formatted bytes.
	 */
	/**
	 * @param bytes
	 * @return
	 */
	private static String getFormattedText(byte[] bytes) {
		int len = bytes.length;
		StringBuilder buf = new StringBuilder(len * 2);
		// 把密文转换成十六进制的字符串形式
		for (int j = 0; j < len; j++) { 			
			buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
			buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
		}
		return buf.toString();
	}
	public static String doubleEncode(String str)
	{
		String code = EncoderHandler.encode("MD5", str);
		code+="WcdslkjfDKo923_sdlfj@8923@!(*#";
//		System.out.println(code);
		code = EncoderHandler.encode("SHA1", code);
		return code;
	}
	public static boolean check(String raw,String code)
	{
		if(doubleEncode(raw).equals(code)){
			return true;
		}
		else {
			return false;
		}
	}
	public static void main(String[] args) {
		String code = doubleEncode("123");
		System.out.println(code);
		System.out.println(check("123", code));
		System.out.println(check("123456", code));
	}

//	public static String getPassword(String password){
//		try{
//			MessageDigest md = MessageDigest.getInstance("MD5");
//			md.update(password.getBytes());
//			byte b[] = md.digest();
//			
//			int i;
//			
//			StringBuffer buf = new StringBuffer("");
//			for(int offset = 0; offset < b.length; offset ++){
//				i = b[offset];
//				if(i < 0){
//					i += 256;
//				}
//				if(i < 16){
//					buf.append("0");					
//				}
//				buf.append(Integer.toHexString(i));
//			}
//			//32位加密
//			return buf.toString();
//			//16位加密
//			//return buf.toString().substring(8, 24);
//		}
//		catch(Exception e){
//			e.printStackTrace();
//			return null;
//		}
//	}
}
