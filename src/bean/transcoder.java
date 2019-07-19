package bean;

import java.io.UnsupportedEncodingException;

public class transcoder {
	public static String toChinese(String str){
		if(str == null){
			str = "";
		}
		try {
			//
			str = new String(str.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO: handle exception
			str = "";
			e.printStackTrace();
		}
		return str;
	}
}
