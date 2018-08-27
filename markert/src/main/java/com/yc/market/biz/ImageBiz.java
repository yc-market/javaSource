package com.yc.market.biz;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yc.market.bean.Image;
import com.yc.market.dao.ImageDao;

@Service
public class ImageBiz {
	@Resource
	private ImageDao idao;
	
	public List<Image> selectByGid(int gid){
		return idao.selectByGid(gid);		
	}
	
	
	
	/*
	 * 上传图片并返回图片的相对地址
	 */	
	public String uploadImage(CommonsMultipartFile file,String realUploadPath) throws IOException
	{
		//如果目录不存在则创建目录
		File uploadFile=new File(realUploadPath+"/rawImages");
		if(!uploadFile.exists()){
			uploadFile.mkdirs();
		}		
		
		//创建输入流
		InputStream inputStream=file.getInputStream();
		//生成输出地址URL
		String outputPath=realUploadPath+"/rawImages/"+file.getOriginalFilename();
		//创建输出流
		OutputStream outputStream=new FileOutputStream(outputPath);		
		//设置缓冲区
		byte[] buffer=new byte[1024];
		
		//输入流读入缓冲区，输出流从缓冲区写出
		while((inputStream.read(buffer))>0)
		{
		  outputStream.write(buffer);
		}
		outputStream.close();
		
		//返回原图上传后的相对地址
		return "upload/rawImages/"+file.getOriginalFilename();
	}
	/**
	 * 	//获取文件夹下所有文件名
	 * @param path
	 * @return
	 */
	public static List<String> printFile(String path) {
		File file = new File(path);
		List<String> images = new ArrayList<String>();
		
		// 是文件夹的话
		if (file.isDirectory()) {
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++) {
				File readfile = new File(path + "/" + filelist[i]);
				if (!readfile.isDirectory()) {
					images.add(readfile.getName());
				}
			}
 
		}
		return images;
	}
	
	public void insert(Image img) throws BizException{
		idao.insert(img);
		Image image = idao.selectById(img.getImgid());
		if(image == null){
			throw new BizException("图片上传失败");
		}
	}
}
