package com.yizhan.controller.zjh;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.controller.base.BaseController;
import com.yizhan.util.CutImageUtil;
@Controller
@RequestMapping(value="/app/zjh/test")
public class Zjh extends BaseController{

	@RequestMapping(value="/getInformation")
	public void getInformation(HttpServletResponse response,HttpServletRequest request) throws IOException{
		response.setContentType("text/html;charset=UTF-8");//设置返回页面内容的编码格式为UTF-8
		//response.setContentType("text/plain");  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        Map<String,String> map = new HashMap<String,String>();
		map.put("name", "张建华");
		map.put("sex", "男");
		map.put("birthday", "1992-09-11");
		map.put("age", "24");
		String jsonpCallback = request.getParameter("jsonpCallback");
		response.getWriter().println(jsonpCallback+"("+JSONObject.fromObject(map)+")");
		response.getWriter().flush();
		response.getWriter().close();
	}
	@RequestMapping(value="/jump")
	public ModelAndView jump(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("cropper/index");
		return mv;
	}
	@RequestMapping(value="/ceshi")
	public void upload(
			@RequestParam(required = false) MultipartFile file,
			@RequestParam(required = false) String dataX,
			@RequestParam(required = false) String dataY,
			@RequestParam(required = false) String dataWidth,
			@RequestParam(required = false) String dataHeight,
			@RequestParam(required = false) String dataRotate,
			@RequestParam(required = false) String boxWidth,
			@RequestParam(required = false) String boxHeigth
			) throws IOException{
			String folderName = "cutImage/";
			String uuid =this.get32UUID();
			String filePath = CutImageUtil.CutIamgeToCustomSize(file, dataX, dataY, dataWidth, dataHeight, dataRotate, boxWidth, boxHeigth, folderName, uuid);                     
			System.out.println("=======dfgsdfgsdfg======="+filePath);
	}
}
