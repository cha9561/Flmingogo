package com.sist.controller;
/*
 * 	Tomcat => web.xml	
 * 	DispatcherServlet이 메모리 할당
 */
// package.className
import java.util.*;
import java.io.*;
public class FileConfig {
	public static List<String> getFileName(String pack)
	{
		List<String> list=new ArrayList<String>();
		try
		{
			System.out.println("fileconfig");
			String path="C:\\springDev\\springStudy\\Flamingogo\\src\\main\\java\\";
			path=path+pack.replace('.', '\\');
			// com\\sist\\board
			File dir=new File(path);
			File[] files=dir.listFiles();
			for(File f:files)
			{
				if(f.isFile())
				{
					String name=f.getName();
					System.out.println(name);
					String ext=name.substring(name.lastIndexOf('.')+1);
					if(ext.equals("java"))
					{
						//com.sist.board.BoardController
						String ff=pack+"."+name.substring(0, name.lastIndexOf('.'));
						System.out.println(ff);
						list.add(ff);
					}
				}
			}
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		
		return list;
	}
}
