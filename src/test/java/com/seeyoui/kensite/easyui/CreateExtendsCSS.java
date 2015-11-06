package com.seeyoui.kensite.easyui;

import java.io.File;

public class CreateExtendsCSS {
	public static void main(String[] args) {
		String fileUrl = "C:\\Users\\cuichen\\git\\kensite\\src\\main\\webapp\\script\\easyui\\themes\\icons\\uicomponent";
		File fileDir = new File(fileUrl);
		File[] files = fileDir.listFiles();
	    for(File file:files){
	    	String fileName = file.getName();
	    	String filePer = fileName.split("\\.")[0];
	    	String css = ".icon-uicomponent-"+filePer+"{background:url('icons/uicomponent/"+fileName+"') no-repeat center center;}";
	    	System.out.println(css);
	    }
		
	}
}
