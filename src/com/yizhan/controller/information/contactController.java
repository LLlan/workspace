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
import com.yizhan.service.information.contactService;
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
@RequestMapping(value="/api/contact")
public class contactController extends BaseController {
	
	@Resource(name="contactService")
	private contactService contactService;
	
	/**
	 * 联系我们列表
	 * 作者:chentuo
	 * 时间 :2017-08-30
	 */
	@RequestMapping(value="/contactlistPage")
	public ModelAndView contactlistPage(Page page) throws Exception{
		 logBefore(logger, "--联系我们列表--contactlistPage----");
		 ModelAndView mv = new ModelAndView();
		 PageData pd = new PageData();
		 pd = this.getPageData();
		 page.setPd(pd);
		 List<PageData> contactlist = contactService.contactlistPage(page);
		 mv.addObject("pd", pd);
		mv.addObject("contactlist", contactlist);
		 
		 //页面跳转
		 mv.setViewName("system/contact/lianxiwm_list");
		 return mv;
	}
	/**
	 * 联系我们新增页面
	 */
	@RequestMapping(value="/contactwmAdd")
	public ModelAndView contactwmAdd(Page page) throws Exception{
		 logBefore(logger, "--联系我们新增页面--contactwmAdd----");
		    ModelAndView mv = new ModelAndView();
		    mv.addObject("msg", "saveContactwm");
		    //页面跳转
		    mv.setViewName("system/contact/lianxiwm_edit");
		    return mv;
	}
	
	/**
	 * 保存联系我们新增数据
	 */
	@RequestMapping(value="/saveContactwm")
	public ModelAndView saveContactwm(HttpServletRequest request) throws Exception{
		 logBefore(logger, "--保存联系我们新增数据--saveContactwm----");
		    ModelAndView mv = new ModelAndView();
		    PageData pd = new PageData();
		    pd = this.getPageData();
		    pd.put("contact_id", this.get32UUID());
		    pd.put("hotline", pd.getString("hotline"));
		    
		    String cmbProvince= request.getParameter("cmbProvince"); //省
	        String cmbCity= request.getParameter("cmbCity"); //市
	        String cmbArea= request.getParameter("cmbArea"); // 区/县
	        //添加空格，为编辑时方便分隔获取
			String weizhi = cmbProvince+" "+cmbCity+" "+cmbArea;//位置
		    pd.put("weizhi", weizhi);
		    pd.put("detailWeizhi", pd.getString("detailWeizhi"));
		    pd.put("create_time", DateUtil.getTime());
		    
		    contactService.saveContactwm(pd);
		    mv.addObject("msg","success");
		    mv.setViewName("save_result");
	    	return mv;
	} 
	/**
	 * 跳转到联系我们编辑页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toContactwmEdit")
	public ModelAndView toContactwmEdit(Page page) throws Exception{
		 logBefore(logger, "--跳转到联系我们编辑页面--toContactwmEdit----");
		   ModelAndView mv = new ModelAndView();
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   pd.put("contact_id", pd.get("Id"));
		   pd = contactService.getDataByID(pd);//根据id查询联系我们的信息
		   
		   String weizhi = pd.getString("weizhi");//地址
			//分隔，得到省 市 区/县 以便于在页面进行回现
			String[] wz = weizhi.split(" ");
			String cmbProvince= wz[0]; //省
			String cmbCity= wz[1]; //市
		    String cmbArea= wz[2]; // 区/县
			mv.addObject("cmbProvince", cmbProvince);
			mv.addObject("cmbCity", cmbCity);
			mv.addObject("cmbArea", cmbArea);
		   mv.addObject("pd", pd);
		   mv.addObject("msg", "updateContactwm");
		   mv.setViewName("system/contact/lianxiwm_edit");
		   return mv;
	}
	/**
	 * 保存修改的联系我们信息
	 */
	@RequestMapping(value="/updateContactwm")
	public ModelAndView updateContactwm(HttpServletRequest request) throws Exception{
		 logBefore(logger, "--保存修改的联系我们信息--updateContactwm----");
		   ModelAndView mv = new ModelAndView();
		   PageData pd = new PageData();
		   pd=this.getPageData();
		    pd.put("contact_id",pd.getString("contact_id"));
		   pd.put("hotline", pd.getString("hotline"));
		   
		   String cmbProvince= request.getParameter("cmbProvince"); //省
	        String cmbCity= request.getParameter("cmbCity"); //市
	        String cmbArea= request.getParameter("cmbArea"); // 区/县
	        //添加空格，为编辑时方便分隔获取
			String weizhi = cmbProvince+" "+cmbCity+" "+cmbArea;//位置
		    pd.put("weizhi", weizhi);
		    pd.put("detailWeizhi", pd.getString("detailWeizhi"));
		    pd.put("update_time", DateUtil.getTime());
		   contactService.updateContactwm(pd);
		   mv.addObject("msg","success");
		   mv.setViewName("save_result");
		   return mv;
	}
	
	/**
	 * 删除联系我们信息
	 */
	@RequestMapping(value="/deleteContactwm")
	public void delete(PrintWriter writer) throws Exception{
		 logBefore(logger, "--删除联系我们信息--delete----");
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   pd.put("contact_id", pd.getString("id"));
		   contactService.deleteContactwm(pd);
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
