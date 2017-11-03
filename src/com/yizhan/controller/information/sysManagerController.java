package com.yizhan.controller.information;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.service.information.MokuaiService;
import com.yizhan.service.information.kehuService;
import com.yizhan.service.information.sysManagerService;
import com.hp.hpl.sparta.xpath.ThisNodeTest;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.entity.information.KeHu;
import com.yizhan.entity.system.User;
import com.yizhan.util.AppUtil;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileUpload;
import com.yizhan.util.MD5;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.Const;
import com.yizhan.util.OrderNoUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.SmsUtil;
import com.yizhan.util.Tools;
/** 
 * 创建人：yangym 
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/sys/manager")
public class sysManagerController extends BaseController {
	
	@Resource(name="sysManagerService")
	private sysManagerService sysManagerService;
	
	/**
	 * 商品单位列表
	 * 作者:chentuo
	 * 时间 :2017-08-30
	 */
	@RequestMapping(value="/sysManagerlistPage")
	public ModelAndView sysManagerListPage(Page page) throws Exception{
		 logBefore(logger, "--商品单位列表--sysManagerListPage----");
		 ModelAndView mv = new ModelAndView();
		 PageData pd = new PageData();
		 pd = this.getPageData();
		 page.setPd(pd);
		 List<PageData> sysManagerList = sysManagerService.sysManagerListPage(page);
		 mv.addObject("pd", pd);
		 mv.addObject("sysManagerList", sysManagerList);
		 
		 //页面跳转
		 mv.setViewName("system/good_danwei/good_danwei_list");
		 return mv;
	}
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAddPage")
	public ModelAndView goAddPage(Page page) throws Exception{
		
		    ModelAndView mv = new ModelAndView();
		    PageData pd = new PageData();
		    pd = this.getPageData();
		    pd.put("time", DateUtil.getTime());
		    mv.addObject("msg", "savegooddanwei");
		    mv.addObject("pd", pd);
		    //页面跳转
		    mv.setViewName("system/good_danwei/good_danwei_edit");
		    return mv;
	}
	
	/**
	 * 保存商品单位
	 */
	@RequestMapping(value="/savegooddanwei")
	public ModelAndView savegooddanwei() throws Exception{
		    ModelAndView mv = new ModelAndView();
		    PageData pd = new PageData();
		    pd = this.getPageData();
		    pd.put("danwei_id", this.get32UUID());
		    sysManagerService.savegooddanwei(pd);
		    mv.addObject("msg","success");
		    mv.setViewName("save_result");
	    	return mv;
	} 
	/**
	 * 跳转到商品单位编辑页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(Page page) throws Exception{
		   ModelAndView mv = new ModelAndView();
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   pd.put("danwei_id", pd.get("tagID"));
		   pd = sysManagerService.getDataByID(pd);
		   
		   mv.addObject("pd", pd);
		   mv.addObject("msg", "update");
		   mv.setViewName("system/good_danwei/good_danwei_edit");
		   return mv;
	}
	/**
	 * 保存修改的商品单位
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		   ModelAndView mv = new ModelAndView();
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   sysManagerService.updateGoodDanwei(pd);
		   mv.addObject("msg","success");
		   mv.setViewName("save_result");
		   return mv;
	}
	
	/**
	 * 删除商品单位
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter writer) throws Exception{
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   pd.put("danwei_id", pd.get("tagID"));
		   sysManagerService.deleteGooddanwei(pd);
		   writer.close();
	}
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		 //让name属性无法被接收
        //binder.setDisallowedFields("name");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
