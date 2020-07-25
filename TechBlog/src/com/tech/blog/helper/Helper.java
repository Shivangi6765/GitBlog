package com.tech.blog.helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	
	public static boolean deleteFile(String path)  //static jisse direct call ho ske
	{
		boolean f = false;
		
		try {
			
			File file = new File(path);
			f=file.delete();  //if delete then f true otherwise false
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	
	public static boolean saveFile(InputStream is , String path) {
	    boolean f = false;
	    
	    try {
	    	
	    	byte b[]=new byte[is.available()];
	    	
	    	is.read(b);  //is se data read krke b me rkh de
	    	
	    	FileOutputStream fos= new FileOutputStream(path);
	    	fos.write(b);
	    	fos.close();
	    	f=true;   // b se data write krke path me overwrite ya change kr dega
	    	
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return f;
	}
	
}
