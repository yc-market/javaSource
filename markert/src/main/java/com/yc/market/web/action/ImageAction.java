package com.yc.market.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yc.market.bean.Image;
import com.yc.market.bean.Store;
import com.yc.market.bean.User;
import com.yc.market.biz.BizException;
import com.yc.market.biz.ImageBiz;
import com.yc.market.biz.StoreBiz;
import com.yc.market.biz.Thumbnail;
import com.yc.market.util.ImageListUtils;
import com.yc.market.util.ServletUtils;

@Controller
public class ImageAction {
	//使用Autowired时，该业务类需要声明为@service，此时xml中不用其它的配置
	@Resource    
    private ImageBiz ibiz;	
	@Resource    
    private StoreBiz sbiz;	
	@Resource
    private Thumbnail thumbnail;
 
	//文件上传并生成缩略图
	@RequestMapping(value="/thumb.do",method=RequestMethod.POST)
	public String GenerateImage(Image img,@RequestParam("image")CommonsMultipartFile file,HttpServletRequest request) throws IOException
	{			
		//根据相对路径获取绝对路径，图片上传后位于元数据中
		String realUploadPath=request.getServletContext().getRealPath("/")+"upload";		
				
		//获取上传后原图的相对地址
		ibiz.uploadImage(file, realUploadPath);
				
		//获取生成的缩略图的相对地址
		thumbnail.generateThumbnail(file, realUploadPath);
		img.setImgname(file.getOriginalFilename());
        img.setGid(ServletUtils.getParameter(request, java.lang.Integer.class, "gid"));
     
		try {
			ibiz.insert(img);
			request.setAttribute("msg", "图片上传成功");
			request.setAttribute("imgname", img.getImgname());
		} catch (BizException e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
		}
		return "EditGoods";
	}
}
