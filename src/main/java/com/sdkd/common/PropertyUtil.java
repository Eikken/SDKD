package com.sdkd.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyUtil {

	private static Properties init() {
		String path = "/login.properties";
		Properties prop = new Properties();
		InputStream fis = null;
		try {
			fis = PropertyUtil.class.getResourceAsStream(path);
			prop.load(fis);
		} catch (IOException e) {
			e.printStackTrace();
		} finally { 
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return prop;
	}

	public static String get(String name) {
		Properties prop = init();
		return prop.getProperty(name);
	}
}
