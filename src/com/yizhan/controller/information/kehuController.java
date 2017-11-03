package com.yizhan.controller.information;

import java.io.File;
import java.io.IOException;
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
import com.yizhan.entity.information.Location;
import com.yizhan.entity.system.User;
import com.yizhan.service.information.kehuService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.CutImageUtil;
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
@RequestMapping(value="/api/kehu")
public class kehuController extends BaseController {

	@Resource(name="kehuService")
	private kehuService kehuService;
	
	@Resource(name="mokuaiService")
	private MokuaiService mokuaiService;
	
	@Resource(name="sysManagerService")
	private sysManagerService sysManagerService;
	
	/**
	 * @作者:Lj
	 * @功能:登录页面
	 * @日期:2017-9-20下午2:38:52
	 */
	@RequestMapping(value="/toLogin")
	public ModelAndView tologin(){
		logBefore(logger, "---toLogin---登录页面-----");
		ModelAndView mv = new  ModelAndView();
		mv.setViewName("information/login");
		return mv;
	}
	
	
	
	/**
	 * @作者:Lj
	 * @功能:执行登录
	 * @日期:2017-9-20下午5:16:03
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public Object login(HttpSession session, HttpServletRequest request)throws Exception {
		logBefore(logger, "--执行登录--");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData tempPd = new PageData();
		String respCode = "";
		String respMsg = "";
		if (Tools.isEmpty(pd.getString("phone"))) {
			respCode = "03";
			respMsg = "请输入登录账号！";
		} else if (Tools.isEmpty(pd.getString("password"))) {
			respCode = "04";
			respMsg = "请输入登录密码！";
		} else {
			tempPd.put("phone", pd.getString("phone"));
			tempPd.put("loginPassword", MD5.md5(pd.getString("password")));
			PageData tempData = kehuService.getDataByPhoneAndPassWord(tempPd);
			PageData result = kehuService.getUserDataByPhone(tempPd);
			if (result == null) {
				respCode = "02";
				respMsg = "该用户还未注册!";
			} else if (tempData == null) {
				respCode = "00";
				respMsg = "密码错误！";
			} else {
				respCode = "01";
				respMsg = "登录成功!";
				// 创建session
				KeHu kehu = new KeHu();
				kehu.setUser_kehu_id(tempData.getString("user_kehu_id"));
				kehu.setPhone(tempData.getString("phone"));
				session.setAttribute("h5User", kehu);
				// 更新登录时间和登录IP
				PageData temp = new PageData();
				temp.put("last_login_time", DateUtil.getTime());// 最近登陆时间
				temp.put("ip", request.getRemoteHost());// ip地址
				temp.put("user_kehu_id", tempData.getString("user_kehu_id"));
				kehuService.updateLoginTimeAndIp(temp);
			}
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 * @作者:Lj
	 * @功能:去注册页面
	 * @日期:2017-9-20下午3:03:15
	 */
	@RequestMapping(value="/register")
	public ModelAndView toRegister(){
		logBefore(logger, "--去注册页面--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("information/register");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:获取短信验证码
	 * @日期:2017-9-20下午3:07:55
	 */
	@RequestMapping(value="/getSms")
	@ResponseBody
	public Object getSms() throws Exception{
		logBefore(logger, "--获取短信验证码--");
		PageData pd = new PageData();
		pd= this.getPageData();
		Map<String,String> map = new HashMap<String,String>();
		String respCode = "";
		String respMsg="";
		String phone = pd.getString("phone");
		pd.put("phone", phone);
		PageData result = kehuService.getUserDataByPhone(pd);
		if (result == null) {
			respCode="03";
			map = SmsUtil.sendMsM(phone);
			map.put("phone", phone);
			if(map.size()>0){
				map.put("reqCode", "01");
			}else{
				map.put("reqCode", "00");
			}
		}else {
			respMsg="该用户已存在！";
			respCode="04";
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行注册
	 * @日期:2017-9-20下午3:04:23
	 */
	@RequestMapping(value="/toRegister")
	@ResponseBody
	public Object register(HttpServletRequest request) throws Exception{
		logBefore(logger, "--执行注册--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		String respCode = "";
		String respMsg="";
		String regExp="/^[0-9]{6}$/";
		if (Tools.isEmpty(pd.getString("phone"))) {
				respMsg="手机号不能为空！";
		}else if (Tools.isEmpty(pd.getString("fhyzm"))) {
				respMsg="请获取验证码！";
		}else if (Tools.isEmpty(pd.getString("yzm"))) {
				respMsg="请输入验证码！";
		}else if (!pd.getString("fhyzm").equals(pd.getString("yzm"))) {
				respMsg="验证码不正确！";
		}else if (Tools.isEmpty(pd.getString("password"))) {
				respMsg="新密码不能为空！";
		/*}else if (pd.getString("password").matches(regExp)) {
			respMsg="新密码不少于6位！";*/
		}else if(Tools.isEmpty(pd.getString("passwords"))){
				respMsg="确认密码不能为空！";
		}else if(!pd.getString("password").equals(pd.getString("passwords"))){
				respMsg="密码不一致！";
		}else if(Tools.isEmpty(pd.getString("names"))){
				respMsg="请输入姓名！";
		}else if(Tools.isEmpty(pd.getString("sex"))){
				respMsg="请选择性别！";
		/*}else if(Tools.isEmpty(pd.getString("calendar"))){
				respMsg="请选择日历！";
		}else if(Tools.isEmpty(pd.getString("birthday"))){
				respMsg="请选择您的生日！";*/
		}else if(Tools.isEmpty(pd.getString("shanghuName"))){
				respMsg="请输入您的商户名称！";
		}else if(pd.getString("address").equals("-请选择--请选择--请选择-")){
				respMsg="请您选择所在（省/市/区、县）！";
		}else if(Tools.isEmpty(pd.getString("detailAddress"))){
				respMsg="请输入详细地址！";
		}else if(pd.getString("agrees").equals("0")){
				respMsg="请勾选菜篮协议！";
		}else {
			//根据用户名或者手机号查询对象信息
			PageData tempPhone=kehuService.getUserDataByPhone(pd);
			if(tempPhone!=null){//
				respCode="00";
				respMsg="注册失败，该手机号已经注册！";
			}else{
				respCode="01";
				respMsg="注册成功！";
				pd.put("user_kehu_id", this.get32UUID());	//主键
				pd.put("phone", pd.getString("phone"));	
				pd.put("loginPassword", MD5.md5(pd.getString("password")));	
//				pd.put("headImg","");	
				pd.put("userName", pd.getString("names"));
				pd.put("sex", pd.getString("sex"));
				pd.put("calendar", pd.getString("calendar"));
				pd.put("birthday", pd.getString("birthday"));
				pd.put("shanghuName", pd.getString("shanghuName"));
				pd.put("address", pd.getString("address"));
				pd.put("detailAddress", pd.getString("detailAddress"));
//				pd.put("payPassword","");
				pd.put("registerTime", DateUtil.getTime());//注册时间	
				pd.put("last_login_time",DateUtil.getTime());//最近登陆时间	
				pd.put("ip", request.getRemoteHost());//ip地址
				pd.put("status", 1); //1 使用中 0 已停用
				pd.put("bz", "小菜一篮用户");	
				kehuService.saveU(pd);
			}
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * @作者:Lj
	 * @功能: 我已同意《小菜一篮门店协议》页面
	 * @日期:2017-9-22下午2:41:20
	 */
	@RequestMapping(value="/xcylmdxy")
	public ModelAndView xcylmdxy(){
		logBefore(logger, "--我已同意《小菜一篮门店协议》页面--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("information/xcylmdxy");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去忘记密码页面
	 * @日期:2017-9-22上午9:18:31
	 */
	@RequestMapping(value="/forget")
	public ModelAndView forget(){
		logBefore(logger, "--忘记密码页面--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("information/forget");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:忘记密码,获取短信验证码
	 * @日期:2017-9-20下午3:07:55
	 */
	@RequestMapping(value="/getSmspwd")
	@ResponseBody
	public Object getSmspwd() throws Exception{
		logBefore(logger, "--忘记密码,获取短信验证码--");
		PageData pd = new PageData();
		pd= this.getPageData();
		Map<String,String> map = new HashMap<String,String>();
		String respCode = "";
		String respMsg="";
		String phone = pd.getString("phone");
		pd.put("phone", phone);
		PageData result = kehuService.getUserDataByPhone(pd);
		if (Tools.isEmpty(pd.getString("phone"))) {
			respMsg="号码不能为空";
		}else if(result != null){//如果号码存在则才，发送验证验证码
			respCode="04";
			map = SmsUtil.sendMsM(phone);
			map.put("phone", phone);
			if(map.size()>0){
				map.put("reqCode", "01");
			}else{
				map.put("reqCode", "00");
			}
		}else {
			respMsg="该号码还未注册";
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 * @作者:Lj
	 * @功能:执行修改密码
	 * @日期:2017-9-22上午9:28:18
	 */
	@RequestMapping(value="/toUpdatePwd")
	@ResponseBody
	public Object toUpdatePwd(HttpServletRequest request) throws Exception{
		logBefore(logger, "--执行修改密码--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		String respCode = "";
		String respMsg="";
		if (Tools.isEmpty(pd.getString("phone"))) {
				respMsg="手机号不能为空！";
		}else if (Tools.isEmpty(pd.getString("fhyzm"))) {
				respMsg="请获取验证码！";
		}else if (Tools.isEmpty(pd.getString("yzm"))) {
				respMsg="请输入验证码！";
		}else if (!pd.getString("fhyzm").equals(pd.getString("yzm"))) {
				respMsg="验证码不一致！";
		}else if (Tools.isEmpty(pd.getString("password"))) {
				respMsg="新密码不能为空！";
		}else if(Tools.isEmpty(pd.getString("passwords"))){
				respMsg="确认密码不能为空！";
		}else if(!pd.getString("password").equals(pd.getString("passwords"))){
				respMsg="密码不一致！";
		}else {
			//根据用户名或者手机号查询对象信息
			PageData tempPhone=kehuService.getUserDataByPhone(pd);
			if(tempPhone==null){//
				respCode="00";
				respMsg="该手号码还未注册！";
			}else{
				respCode="01";
				respMsg="修改成功！";
				pd.put("phone", pd.getString("phone"));	
				pd.put("loginPassword", MD5.md5(pd.getString("password")));	
				kehuService.updatePasswordByPhone(pd);
			}
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 去首页
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/index")
	public ModelAndView saveXiaoshou(HttpServletRequest request,Page page) throws Exception{
		logBefore(logger, "--去首页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//查出商品模块一栏大种类
		List<PageData> daohangMKlist = mokuaiService.getMokuaiList(pd);
		mv.addObject("daohangMKlist", daohangMKlist);
		mv.setViewName("information/index");
		return mv;
	}
	
	
	
	/**
	 * ajax请求首页数据渲染 根据模块id
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-9-30
	 * @throws Exception 
	 */
	@RequestMapping(value="/getDataByMKID")
	@ResponseBody
	public Object getDataByMKID() throws Exception{
		logBefore(logger, "--根据商品id查看商品详情--");
		PageData pd = new PageData();
	
		List<Object> resultlist = new ArrayList();
		pd = this.getPageData();
		Map<String, Object> map = new HashMap<String, Object>();
		//查出所有商品种类
		List<PageData> goodsCategoryList = kehuService.goodsCategoryList(pd);
		for (PageData pdselects : goodsCategoryList) {
			//查出商家下的所有商品 by yym 
			List<PageData> goodsList =  kehuService.getDataByCategoryNameAndId(pdselects);
			resultlist.add(goodsList);
		}
		map.put("goodsCategoryList", goodsCategoryList);
		map.put("resultlist", resultlist);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 设置地址到session中
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-10-11
	 */
	@RequestMapping(value="/setLocationToSession")
	@ResponseBody
	public Object setLocationToSession(HttpSession session){
		logBefore(logger, "--根据商品id查看商品详情--");
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> map = new HashMap<String, Object>();
		Location location  = new Location();
		location.setCity(pd.getString("city"));
		session.setAttribute(Const.SESSION_LOCATION, location);
		map.put("respCode", "01");
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	/**
	 * @作者:Lj
	 * @功能:根据商品id查看商品详情
	 * @日期:2017-9-21上午9:13:01
	 */
	@RequestMapping(value="/getGoodDetailByID")
	@ResponseBody
	public Object getGoodDetailByID(){
		logBefore(logger, "--根据商品id查看商品详情--");
		PageData pd = new PageData();
		PageData rpd = new PageData();
		pd = this.getPageData();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rpd = kehuService.getGoodDetailByID(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("rpd", rpd);
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	/**
	 * @作者:Lj
	 * @功能:商品收搜
	 * @日期:2017-9-14下午5:25:34
	 */
	@RequestMapping(value="/search")
	public ModelAndView search(HttpServletRequest request) throws Exception{
		logBefore(logger, "--商品收搜--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/search");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:订单列表页面
	 * @日期:2017-9-21上午9:12:18
	 */
	@RequestMapping(value="/orderList")
	public ModelAndView orderList(HttpServletRequest request) throws Exception{
		logBefore(logger, "--订单列表页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = this.getPageData();
		List<PageData> orderList = new ArrayList<PageData>();
		List<PageData> resultList = new ArrayList<PageData>();
		List<PageData> finaList = new ArrayList<PageData>();
		if(isSession()){
			//其他项
			if(Tools.notEmpty(pd.getString("payState"))){
				orderList = kehuService.getOrderListBykehuID(pd);
				pd.put("payState", pd.get("payState"));
				pd.put("user_kehu_id", getSessionUser().getUser_kehu_id());
				orderList = kehuService.getOrderListBykehuID(pd);
				for(int i=0;i<orderList.size();i++){
					PageData pds  = new PageData();
					pds.put("takeout_order_id", orderList.get(i).get("order_takeou_id"));
					pds.put("orderTime", orderList.get(i).get("orderTime"));
					pds.put("totalSum", orderList.get(i).get("totalSum"));
					pds.put("bucha", orderList.get(i).get("bucha"));
					pds.put("paySum", orderList.get(i).get("paySum"));
					pds.put("orderNumber", orderList.get(i).get("orderNumber"));
					resultList = kehuService.getOrderGoodListByTateOutID(pds);
					pds.put("resultList", resultList);
					finaList.add(pds);
				}
			}else{
				//默认待付款
				pd.put("payState", "1");
				pd.put("user_kehu_id", getSessionUser().getUser_kehu_id());
				orderList = kehuService.getOrderListBykehuID(pd);
				for(int i=0;i<orderList.size();i++){
					PageData pds  = new PageData();
					pds.put("takeout_order_id", orderList.get(i).get("order_takeou_id"));
					pds.put("orderTime", orderList.get(i).get("orderTime"));
					pds.put("totalSum", orderList.get(i).get("totalSum"));
					pds.put("bucha", orderList.get(i).get("bucha"));
					pds.put("paySum", orderList.get(i).get("paySum"));
					pds.put("orderNumber", orderList.get(i).get("orderNumber"));
					resultList = kehuService.getOrderGoodListByTateOutID(pds);
					pds.put("resultList", resultList);
					finaList.add(pds);
				}
				
			}
			mv.addObject("pd", pd);
			mv.addObject("finaList", finaList);
			mv.setViewName("information/myorder");
		}else{
			mv.setViewName("redirect:/api/kehu/toLogin.do");
		}
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去立即下单页面
	 * @日期:2017-9-14下午3:59:16
	 */
	@RequestMapping(value="/querenDingdan")
	public ModelAndView querenDingdan(HttpServletRequest request) throws Exception{
		logBefore(logger, "--去立即下单页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("user_kehu_id", getSessionUser().getUser_kehu_id());
		
		//查出默认地址
		PageData mrdzData  = kehuService.selectMoredizhiByID(pd);
		//查出合计数以及该订单中的货物总重量
		PageData totolData = kehuService.getTotolByUserKeHuID(pd);
		PageData userData = kehuService.getUserDetailByID(pd);
		
		//查出临时表所有数据
		pd.put("user_kehu_id", getSessionUser().getUser_kehu_id());
		//查出临时表所有数据
		List<PageData> resultList = kehuService.selectTempOrderList(pd);
		mv.addObject("resultList", resultList);
		mv.addObject("totolData", totolData);
		mv.addObject("userData", userData);
		mv.addObject("mrdzData", mrdzData);
		mv.setViewName("information/querenDingdan");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去结算==保存到临时表中
	 * @日期:2017-9-21上午9:11:17
	 */
	@RequestMapping(value="/saveOrderTemp")
	@ResponseBody
	public Object saveOrderTemp() throws Exception{
		logBefore(logger, "--（去结算）保存到外卖临时表中--");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		if (isSession()){
			pd.put("user_kehu_id",  getSessionUser().getUser_kehu_id());
			String sp_id ="";
			//2条 =6,3条=8规律是：2*2+2 所有pd.size() = (pd.size()-2)/2
			for(int i=0;i<pd.size();i++){
				if(pd.containsKey("map["+i+"][value]")){
					if(Tools.notEmpty(pd.get("map["+i+"][value]").toString())){
						//商品id
						sp_id= pd.get("map["+i+"][key]").toString();
						//结果字符串
						String rstr[] = pd.get("map["+i+"][value]").toString().split(",");
						for(int y=0;y<1;y++){
							//添加
							PageData pdinsert = this.getPageData();
							pdinsert.put("temp_id", this.get32UUID());
							pdinsert.put("kehu_id", getSessionUser().getUser_kehu_id());
							pdinsert.put("sp_id", sp_id);
							pdinsert.put("sp_name",rstr[y]);
							pdinsert.put("price", rstr[y+1]);
							pdinsert.put("danwei", rstr[y+2]);
							pdinsert.put("num", rstr[y+3]);
							pdinsert.put("img", rstr[y+4]);
							pdinsert.put("mkID", pd.get("mkID"));
							kehuService.saveTempOrder(pdinsert);
						}
		
					}
				
				}
			}
			map.put("respCode", "01");
		}else{
			map.put("respCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 清空购物车临时表
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-18
	 */
	@RequestMapping(value = "/clearCar")
	@ResponseBody
	public Object clearCar() throws Exception {
		logBefore(logger, "--清空购物车临时表--");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("user_kehu_id", getSessionUser().getUser_kehu_id());
		kehuService.delTempOrder(pd);
		map.put("respMsg", "01");
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 * @作者:Lj
	 * @功能:去添加备注页面
	 * @日期:2017-9-14下午4:01:10
	 */
	@RequestMapping(value="/beizhu")
	public ModelAndView beizhu(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/beizhu");
		return mv;
	}
	/*====================================我的(开始)==================================*/
	/**
	 * 我的
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-9-14
	 */
	@RequestMapping(value="/wode")
	public ModelAndView wode() throws Exception{
		logBefore(logger, "-----我的--wode----");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){ 
			//客户存在
			pd.put("user_kehu_id",getSessionUser().getUser_kehu_id());
			PageData userData =  kehuService.getUserDataByID(pd);
			mv.addObject("userData", userData);
			mv.addObject("pd",pd);
			//mv.addObject("flag", true);//做是否登录标记,用于页面判断
			mv.setViewName("information/my");
		}else{
			//客户不存在，跳转到登录页面
		    mv.setViewName("redirect:/api/kehu/toLogin");
			/*mv.addObject("flag", false);//做是否登录标记,用于页面判断
			mv.setViewName("information/my");*/
		}
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去我的钱包页面
	 * @日期:2017-9-14下午4:10:21
	 */
	@RequestMapping(value="/recharge")
	public ModelAndView recharge() throws Exception{
		logBefore(logger, "-----去我的钱包页面--recharge----");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if (isSession()) {
			pd.put("user_kehu_id",getSessionUser().getUser_kehu_id());
			pd = kehuService.getKehuDataById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("information/recharge");
		}else{
			 mv.setViewName("redirect:/api/kehu/index");
		}
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:支付余额记录
	 * @日期:2017-9-22上午9:07:20
	 */
	@RequestMapping(value="/zhifuyue")
	public ModelAndView zhifuyue() throws Exception{
		logBefore(logger, "--支付余额记录--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/zhifuyue");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:补差金额记录
	 * @日期:2017-9-22上午9:08:47
	 */
	@RequestMapping(value="/bucha")
	public ModelAndView bucha() throws Exception{
		logBefore(logger, "--补差金额记录--bucha--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
	    mv.setViewName("information/bucha");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去我的收货地址列表
	 * @日期:2017-9-14下午4:03:28
	 */
	@RequestMapping(value="/dizhi")
	public ModelAndView dizhi() throws Exception{
		logBefore(logger, "--收货地址列表--dizhi---");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			pd.put("user_kehu_id",getSessionUser().getUser_kehu_id());
			List<PageData> dizhiList = kehuService.dizhiListPage(pd);
			mv.addObject("dizhiList", dizhiList);
			mv.setViewName("information/dizhi");
		}else{
			 mv.setViewName("redirect:/api/kehu/index");
		}
		
		return mv;
	}
	/**
	 * @作者:Lj
	 * @功能:去新增收货地址页面
	 * @日期:2017-9-14下午4:16:52
	 */
	@RequestMapping(value="/xinzengDizhi")
	public ModelAndView xinzengDizhi() throws Exception{
		logBefore(logger, "--跳转到新增收货地址页面--xinzengDizhi--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			mv.addObject("user_kehu_id", getSessionUser().getUser_kehu_id());
			mv.addObject("msg", "saveShouhuoAddress");
			mv.addObject("pd", pd);
			mv.setViewName("information/xinzengDizhi");
		}else{
			  mv.setViewName("redirect:/api/kehu/index");
		}
		return mv;
	}
	
	/**
	 * 保存新增收货地址
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveShouhuoAddress")
	public ModelAndView saveShouhuoAddress(HttpServletRequest request,HttpSession session) throws Exception{
		logBefore(logger, "--保存新增收货地址--saveShouhuoAddress--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		KeHu kehu = (KeHu)session.getAttribute("h5User");//获取用户id
		if(isSession()){
			    //根据id查询用户是否已有收货地址
			pd.put("user_kehu_id",getSessionUser().getUser_kehu_id());
			List<PageData> dizhiList = kehuService.dizhiListPage(pd);
			if(dizhiList == null || dizhiList.isEmpty()){  
				//客户第一次新增收货地址，设置其地址为默认
				String cmbProvince= request.getParameter("cmbProvince"); //省
		        String cmbCity= request.getParameter("cmbCity"); //市
		        String cmbArea= request.getParameter("cmbArea"); // 区/县
		        //添加空格，为编辑时方便分隔获取
				String address = cmbProvince+" "+cmbCity+" "+cmbArea;//收货地址

				pd.put("shouhuo_address_id", this.get32UUID());
				pd.put("lianxirnName", pd.getString("lianxirnName"));
				pd.put("phone", pd.getString("phone"));
				pd.put("address", address);
				pd.put("detailAddress", pd.getString("detailAddress"));
				pd.put("isDefault", "1"); 
				pd.put("user_kehu_id",kehu.getUser_kehu_id());
				pd.put("create_time", Tools.date2Str(new Date()));//创建时间
				kehuService.saveShouhuoAddress(pd);
				mv.setViewName("redirect:/api/kehu/dizhi");
			}else{
				//客户再次新增收货地址，设置其地址为不是默认
				String cmbProvince= request.getParameter("cmbProvince"); //省
		        String cmbCity= request.getParameter("cmbCity"); //市
		        String cmbArea= request.getParameter("cmbArea"); // 区/县
		        //添加空格，为编辑时方便分隔获取
				String address = cmbProvince+" "+cmbCity+" "+cmbArea;//收货地址

				pd.put("shouhuo_address_id", this.get32UUID());
				pd.put("lianxirnName", pd.getString("lianxirnName"));
				pd.put("phone", pd.getString("phone"));
				pd.put("address", address);
				pd.put("detailAddress", pd.getString("detailAddress"));
				pd.put("isDefault", "0"); 
				pd.put("user_kehu_id",kehu.getUser_kehu_id());
				pd.put("create_time", Tools.date2Str(new Date()));//创建时间
				kehuService.saveShouhuoAddress(pd);
				mv.setViewName("redirect:/api/kehu/dizhi");
			}     
		}else{
			 mv.setViewName("redirect:/api/kehu/index");
		}
		return mv;
	}
	
	/**
	 * 跳转到收货地址编辑页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "--跳转到收货地址编辑页面--edit--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			pd.put("shouhuo_address_id", pd.getString("shouhuo_address_id"));
			PageData dizhi = kehuService.getDizhiByID(pd);
			
			String address = dizhi.getString("address");//地址
			//分隔，得到省 市 区/县 以便于在页面进行回现
			String[] addr = address.split(" ");
			String cmbProvince= addr[0]; //省
			String cmbCity= addr[1]; //市
		    String cmbArea= addr[2]; // 区/县
			mv.addObject("cmbProvince", cmbProvince);
			mv.addObject("cmbCity", cmbCity);
			mv.addObject("cmbArea", cmbArea);
			
			mv.addObject("dizhi", dizhi);
			mv.addObject("msg", "saveDizhiEdit");
			mv.addObject("pd", pd);
			mv.setViewName("information/xinzengDizhi");
		}else{
			 mv.setViewName("redirect:/api/kehu/index");
		}
		return mv;
	}
	/**
	 * 保存编辑后的收货地址
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveDizhiEdit")
	public ModelAndView saveDizhiEdit(HttpServletRequest request) throws Exception{
		  logBefore(logger, "--保存编辑后的收货地址--saveDizhiEdit");
		  ModelAndView mv = new ModelAndView();
		  PageData pd = new PageData();
		  pd = this.getPageData();
		  if(isSession()){
			  pd.put("shouhuo_address_id", pd.getString("shouhuo_address_id"));
			  
			  pd.put("lianxirnName", pd.getString("lianxirnName"));
			  pd.put("phone", pd.getString("phone"));
			  
				String cmbProvince= request.getParameter("cmbProvince"); //省
		        String cmbCity= request.getParameter("cmbCity"); //市
		        String cmbArea= request.getParameter("cmbArea"); // 区/县
		        //添加空格，为编辑时方便分隔获取
				String address = cmbProvince+" "+cmbCity+" "+cmbArea;//收货地址
			  pd.put("address", address);
			  pd.put("detailAddress", pd.getString("detailAddress"));
			  pd.put("update_time", Tools.date2Str(new Date()));
			  kehuService.saveDizhiEdit(pd);
			  mv.setViewName("redirect:/api/kehu/dizhi");
		  }else{
			  mv.setViewName("redirect:/api/kehu/index");
		  }
		  return mv;
	}
	
	/**
	 * 删除收货地址
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addressDelete")
	public ModelAndView shanchu() throws Exception{
		logBefore(logger, "--删除收货地址--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("shouhuo_address_id", pd.getString("shouhuo_address_id"));
		kehuService.deleteDizhiByID(pd);
	    mv.setViewName("redirect:/api/kehu/dizhi");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:设置指定收货地址为默认收货地址
	 * @日期:2017-9-30下午5:47:51
	 */
	@RequestMapping(value="/SetisDefaultAddress")
	public ModelAndView SetisDefaultAddress(HttpSession session) throws Exception{
		logBefore(logger, "--设置指定收货地址为默认收货地址--");
		ModelAndView mv=new ModelAndView();
		PageData pd = this.getPageData();
		if(isSession()){
			PageData pdw=new PageData();
			pdw.put("user_kehu_fid", getSessionUser().getUser_kehu_id());
			pdw.put("isDefault", "0");
			kehuService.SetisDefaultAddress(pdw);
			pd.put("isDefault", "1");
			kehuService.SetisDefaultAddress(pd);
			mv.setViewName("redirect:/api/kehu/dizhi");
		}else{
			mv.setViewName("redirect:/api/kehu/index");
		}
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去建议反馈页面
	 * @日期:2017-9-14下午4:12:31
	 */
	@RequestMapping(value="/feedback")
	public ModelAndView feedback(HttpServletRequest request) throws Exception{
	   logBefore(logger, "--去意见反馈页面--feedback--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			mv.addObject("user_kehu_id",getSessionUser().getUser_kehu_id());
			mv.addObject("msg", "savefeedback");
			mv.setViewName("information/feedback");
		}else{
			 mv.setViewName("redirect:/api/kehu/index");
		}
		
		return mv;
	}
	/**
	 * 保存意见反馈
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/savefeedback")
	public ModelAndView savefeedback(HttpServletRequest request) throws Exception{
		   logBefore(logger, "--执行意见反馈--savefeedback--");
			ModelAndView mv = new ModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			if(isSession()){
				pd.put("user_kehu_id", getSessionUser().getUser_kehu_id());
			    pd.put("feedback_id", this.get32UUID());
			    pd.put("textarea", pd.getString("textarea"));
			    pd.put("status", "0");//0:默认未处理 1:已处理
			    pd.put("create_time", Tools.date2Str(new Date()));
			    kehuService.savefeedback(pd);
				mv.setViewName("redirect:/api/kehu/wode");
			}else{
				 mv.setViewName("redirect:/api/kehu/index");
			}
			return mv;
		}
	 /**
	  * 后台意见反馈列表
	  */
	@RequestMapping(value="/feedbacklistPage")
	public ModelAndView feedbacklistPage(Page page) throws Exception{
		   logBefore(logger, "--后台意见反馈列表--feedbacklistPage--");
			ModelAndView mv = new ModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			page.setPd(pd);
			pd.put("user_kehu_id",pd.getString("user_kehu_id"));
			pd.put("status", "0");//0:默认未处理 1:已处理
		     List<PageData> feedbacklist = kehuService.feedbacklistPage(page);
		    mv.addObject("feedbacklist", feedbacklist);
		    mv.addObject("pd", pd);
		  mv.setViewName("system/feedback/feedback_list");
			return mv;
		}
	/**
	 * 删除意见反馈内容
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/delfeedback")
	public void delfeedback(PrintWriter writer) throws Exception{
		 logBefore(logger, "--删除意见反馈内容--delfeedback----");
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   pd.put("feedback_id", pd.getString("tid"));
		   kehuService.delfeedback(pd);
		   writer.close();
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行意见反馈已处理
	 * @日期:2017-9-29下午5:34:38
	 */
	@RequestMapping(value="/updatechuliStatus")
	public void updatechuliStatus(PrintWriter writer) throws Exception{
		logBefore(logger, "--执行意见反馈已处理--updatechuliStatus----");
		PageData pd = new PageData();
		pd=this.getPageData();
		pd.put("status", 1);//状态(0 未处理 1 已处理)
		kehuService.updatechuliStatus(pd);
		writer.close();
	}
	
	/**
	 * @作者:Lj
	 * @功能:去联系我们列表
	 * @日期:2017-9-14下午4:13:16
	 */
	@RequestMapping(value="/contact")
	public ModelAndView contact() throws Exception{
		logBefore(logger, "--联系我们--contact--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			List<PageData> contactlist = kehuService.contactList(pd);
			mv.addObject("contactlist", contactlist);
			mv.setViewName("information/contact");
		}else{
			 mv.setViewName("redirect:/api/kehu/index");
		}
		
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:退出登录注销 
	 * @日期:2017-9-22上午10:53:19
	 */
	@RequestMapping(value="/tuichu")
	public ModelAndView tuichu(){
		logBefore(logger, "--退出登录注销 --");
		ModelAndView mv = new  ModelAndView();
		//销毁session
		removeSession();
		mv.setViewName("redirect:/api/kehu/toLogin.do");
		return mv;
	}
	
	/**
	 * 会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/memberlistPage")
	public ModelAndView memberlistPage(Page page) throws Exception{
		 logBefore(logger, "--会员列表--memberlistPage----");
		 ModelAndView mv = new ModelAndView();
		 PageData pd = new PageData();
		 pd = this.getPageData();
		 page.setPd(pd);
		 List<PageData> memberlistPage = kehuService.memberlistPage(page);
		 mv.addObject("pd", pd);
		 mv.addObject("memberlistPage", memberlistPage);
		 //页面跳转
		 mv.setViewName("system/member/list");
		 return mv;
	}
	
	/**
	 * 删除会员
	 */
	@RequestMapping(value="/deleteMenber")
	public void deleteMenber(PrintWriter writer) throws Exception{
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   pd.put("user_kehu_id", pd.get("tagID"));
		   kehuService.deleteMember(pd);
		   writer.close();
	}
	/**
	 * 去为会员选择端口页面
	 */
	@RequestMapping(value="/goAddPage")
	public ModelAndView goAddPage(Page page) throws Exception{
		 logBefore(logger, "--去为会员选择端口页面--goAddPage----");
		    ModelAndView mv = new ModelAndView();
		    PageData pd = new PageData();
		    pd = this.getPageData();
		    pd.put("user_kehu_id", pd.getString("tagID"));
		    mv.addObject("msg", "updateDuankou");
		    mv.addObject("pd", pd);
		    
		   List<PageData> duankoulist =  kehuService.duankoulist(page);//查询端口列表
		   mv.addObject("duankoulist", duankoulist);
		    //页面跳转
		    mv.setViewName("system/duankou/duankou");
		    return mv;
	}
	
	/**
	 * 保存为会员分配的端口 
	 */
	@RequestMapping(value="/updateDuankou")
	public ModelAndView updateDuankou() throws Exception{
		logBefore(logger, "--保存为会员分配的端口 --saveDuankou----");
		    ModelAndView mv = new ModelAndView();
		    PageData pd = new PageData();
		    pd = this.getPageData();
		    
		    pd.put("duankou_id", pd.getString("duankou_id"));
		    pd.put("user_kehu_id", pd.getString("user_kehu_id"));
		    kehuService.updateDuankou(pd);
		    mv.addObject("msg","success");
		    mv.setViewName("save_result");
	    	return mv;
	}
	/**
	 * 跳转到为会员分配端口编辑页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toDuankouedit")
	public ModelAndView Duankouedit(Page page) throws Exception{
		logBefore(logger, "--跳转到为会员分配端口编辑页面 --edit----");
		   ModelAndView mv = new ModelAndView();
		   PageData pd = new PageData();
		   pd=this.getPageData();
		  
		   pd.put("user_kehu_id", pd.getString("tagID"));
		   pd = kehuService.getMemberDataByID(pd);//查询会员列表中是否已分配端口，以便于在页面显示已分配好的端口
	
		   List<PageData> duankoulist = kehuService.duankoulist(page);//查询端口列表
		   
		   mv.addObject("pd", pd);
		   mv.addObject("duankoulist", duankoulist);
		   mv.addObject("msg", "saveDuankouedit");
		   mv.setViewName("system/duankou/duankou");
		   return mv;
	}
	/**
	 * 保存修改的分配端口
	 */
	@RequestMapping(value="/saveDuankouedit")
	public ModelAndView saveDuankouedit() throws Exception{
		 logBefore(logger, "--保存修改的分配端口--saveDuankouedit----");
		   ModelAndView mv = new ModelAndView();
		   PageData pd = new PageData();
		   pd=this.getPageData();
		   
		   pd.put("duankou_id",  pd.getString("duankou_id"));
		   pd.put("user_kehu_id", pd.getString("user_kehu_id"));
		   kehuService.saveDuankouedit(pd);
		   
		   mv.addObject("msg","success");
		   mv.setViewName("save_result");
		   return mv;
	}
	//=====================================session部分===============================================//
	
	/**
	 * 判断一串字符串中是否含有非数字字符
	 * 无：返回TRUE
	 * 有：返回FALSE
	 * @param str
	 * @return
	 */
	public boolean isNumeric(String str) {
		for (int i = str.length(); --i >= 0;) {
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 判断session是否存在
	 * 存在：返回TRUE
	 * 反之：返回FALSE
	 * @return
	 */
	public boolean isSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		KeHu keHu=(KeHu) session.getAttribute("h5User");
		if(keHu==null){
			return false;
		}
		return true;
	}
	
	/**
	 * 获取session对象
	 * @return
	 */
	public KeHu getSessionUser(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		KeHu KeHu=(KeHu) session.getAttribute("h5User");
		return KeHu;
	}
	
	/**
	 * 创建用户session
	 * @throws Exception 
	 */
	public void createSession(String user_shanghu_id) throws Exception{
		PageData pd=new PageData();
		pd.put("user_shanghu_id", user_shanghu_id);
		PageData tempData=kehuService.getDataByNameOrPhone(pd);
		KeHu kehu=new KeHu();
		kehu.setUser_kehu_id(tempData.getString("user_kehu_id"));
		kehu.setPhone(tempData.getString("phone"));
		kehu.setUserName(tempData.getString("userName"));
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.setAttribute("h5User",kehu);
	}
	
	/**
	 * 
	 * 退出 销毁session
	 * 
	 */
	public void removeSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.removeAttribute("h5User");
	}
	
	//=====================================session部分end===============================================//
	
	
	/*================================================商品分类管理(后台开始)======================================================*/
	/**
	 * 获取页面列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getlistPagespfl")
	public ModelAndView getlistPagespfl(Page page) throws Exception{
		logBefore(logger, "获取商品分类页面列表");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=kehuService.getlistPagespfl(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/goodsCategory/goodsCategory_list");
		return mv;
	} 
	/**
	 * 进入添加页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/spfltoAdd")
	public ModelAndView spfltoAdd() throws Exception{
		logBefore(logger, "进入商品分类添加页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> mokuailist=mokuaiService.getListOfMokuai(pd);
		mv.addObject("mokuailist", mokuailist);
		mv.addObject("msg", "spflinsert");
		mv.setViewName("information/goodsCategory/goodsCategory_add");
		return mv;
	}
	/**
	 * 验证是否存在
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/spflselectByName")
	@ResponseBody
	public Object spflselectByName() throws Exception{
		logBefore(logger, "判断商品分类名称是否存在");
		Map<String, Object> map=new HashMap<String, Object>();
		String result="";
		PageData pd=new PageData();
		pd=this.getPageData();
		PageData pd1=kehuService.spflgetDateByIdorName(pd);
		if(pd1 != null){//说明已经存在，无需添加
			result="已存在";
		}else{
			result="不存在";
		}
		map.put("result", result);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 添加信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/spflinsert")
	public ModelAndView spflinsert() throws Exception{
		logBefore(logger, "添加商品分类名称到数据库");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("goods_mokuai_fid", pd.getString("goods_mokuai_id"));
		pd.put("goods_category_id", this.get32UUID());
		pd.put("addTime", DateUtil.getTime());
		/*
			1.获取添加人的主键ID
			2.pd.put("user_shangjia_fid",id);
		 */
		kehuService.spflinsert(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入修改页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/spfltoEdit")
	public ModelAndView spfltoEdit() throws Exception{
		logBefore(logger, "进入商品分类修改页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=kehuService.spflgetDateByIdorName(pd);
		List<PageData> list=mokuaiService.getListOfMokuai(pd);
		mv.addObject("mokuailist", list);
		mv.addObject("pd", pd);
		mv.addObject("msg", "spflupdate");
		mv.setViewName("information/goodsCategory/goodsCategory_edit");
		return mv;
	}
	/**
	 * 对指定对象进行修改
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/spflupdate")
	public ModelAndView spflupdate() throws Exception{
		logBefore(logger, "对指定商品分类进行修改");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("addTime", DateUtil.getTime());
		kehuService.spflupdate(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 删除指定的记录
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/spfldelete")
	public void spfldelete(PrintWriter writer) throws Exception{
		logBefore(logger, "删除指定商品分类名称");
		PageData pd=new PageData();
		pd=this.getPageData();
		String str[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < str.length; i++) {
			ids.add(str[i]);
		}
		pd.put("ids", ids);
		kehuService.spfldelete(pd);
		writer.close();
	}
	/*===============================商品分类管理end=======================================*/
	
	/*================================================商品管理(后台开始)======================================================*/
	/**
	 * 获取页面列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goodsgetlistPage")
	public ModelAndView goodsgetlistPage(Page page) throws Exception{
		logBefore(logger, "获取商品页面列表");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		System.out.println(pd.getString("searchNames"));
		page.setPd(pd);
		List<PageData> spfllist=kehuService.goodsCategoryListSearch(pd);//商品分类列表
		List<PageData> list=kehuService.goodsgetlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.addObject("spfllist", spfllist);
//		mv.setViewName("information/goods/goods_list");
		mv.setViewName("information/goods/good_list");
		//mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 进入添加页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goodstoAdd")
	public ModelAndView goodstoAdd() throws Exception{
		logBefore(logger, "进入商品添加页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		List<PageData> spfllist=kehuService.goodsCategoryListSearch(pd);//商品分类列表
		List<PageData> sysManagerList = sysManagerService.sysManagerList(pd);//商品单位列表
		mv.addObject("list", spfllist);
		mv.addObject("sysManagerList", sysManagerList);
		mv.addObject("msg", "goodsinsert");
		mv.setViewName("information/goods/goods_add");
		return mv;
	}
	
	/**
	 * 验证是否存在
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsselectByName")
	@ResponseBody
	public Object goodsselectByName() throws Exception{
		logBefore(logger, "判断商品名称是否存在");
		Map<String, Object> map=new HashMap<String, Object>();
		String result="";
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("goodsName", pd.getString("goodsName"));
		PageData pd1=kehuService.goodsgetDateByIdorName(pd);
		if(pd1 != null){//说明已经存在，无需添加
			result="已存在";
		}else{
			result="不存在";
		}
		map.put("result", result);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 添加信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsinsert")
	public ModelAndView goodsinsert(
			String goodsName,
			String goods_category_id,
			String goodsImg,
			String goodsState,
			String goodsIntroduce,
			String topPrice,
			String advisePrice,
			String shangjiaPrice,
			String shanghuPrice,
			String Stock,
			String danwei_id
			) throws Exception{
		logBefore(logger, "添加商品分类名称到数据库");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd.put("goods_id", this.get32UUID());
		pd.put("fabuTime", DateUtil.getTime());
		pd.put("goodsName", goodsName);
		pd.put("goods_category_fid", goods_category_id);
		pd.put("goodsImg", goodsImg);
		pd.put("topPrice", topPrice);
		pd.put("advisePrice", advisePrice);
		pd.put("shangjiaPrice", shangjiaPrice);
		pd.put("shanghuPrice", shanghuPrice);
		pd.put("goodsIntroduce", goodsIntroduce);
		pd.put("goodsState", goodsState);
		pd.put("Stock", Stock);
		pd.put("danwei_fid",danwei_id);
		//1.获取添加人的主键ID
		//2.pd.put("user_shangjia_fid",id);
		kehuService.goodsinsert(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		mv.setViewName("redirect:/api/kehu/goodsgetlistPage");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去图片裁剪页面(商品新增)
	 * @日期:2017-9-26下午6:02:17
	 */
	@RequestMapping(value="/jump")
	public ModelAndView jump() throws Exception{
		logBefore(logger, "--去图片裁剪页面(商品新增)--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("goodsName", pd.getString("goodsName"));
		System.out.println("goodsImg:"+pd.getString("goodsImg"));
		pd.put("goodsImg", pd.getString("goodsImg"));
		pd.put("goods_category_fid",pd.getString("goods_category_id"));
		pd.put("goodsState",pd.getString("goodsState"));
		pd.put("topPrice",pd.getString("topPrice"));
		pd.put("advisePrice",pd.getString("advisePrice"));
		pd.put("shangjiaPrice",pd.getString("shangjiaPrice"));
		pd.put("shanghuPrice",pd.getString("shanghuPrice"));
		pd.put("goodsIntroduce",pd.getString("goodsIntroduce"));
		pd.put("Stock",pd.getString("Stock"));
		pd.put("danwei_id",pd.getString("danwei_id"));
		mv.addObject("pds", pd);
		mv.setViewName("information/goods/cropper_add");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行商品新增图片裁剪
	 * @日期:2017-9-26下午6:00:48
	 */
	@RequestMapping(value="/ceshi")
	public ModelAndView upload(HttpServletRequest request,
			@RequestParam(required = false) MultipartFile file,
			@RequestParam(required = false) String dataX,
			@RequestParam(required = false) String dataY,
			@RequestParam(required = false) String dataWidth,
			@RequestParam(required = false) String dataHeight,
			@RequestParam(required = false) String dataRotate,
			@RequestParam(required = false) String boxWidth,
			@RequestParam(required = false) String boxHeigth,
			String goods_id,
			String goodsImg,
			String goodsName,
			String goods_category_fid,
			String goodsState,
			String topPrice,
			String advisePrice,
			String shangjiaPrice,
			String shanghuPrice,
			String goodsIntroduce,
			String Stock,
			String danwei_id
			) throws Exception{
			logBefore(logger, "执行商品新增图片裁剪");
			ModelAndView mv=new ModelAndView();
			PageData pd=new PageData();
			pd=this.getPageData();
			System.out.println("goods_id:"+goods_id);
			System.out.println("goodsName:"+goodsName);
			System.out.println("goods_category_fid:"+goods_category_fid);
			pd.put("goods_id", goods_id);
			List<PageData> spfllist=kehuService.goodsCategoryListSearch(pd);//商品分类列表
			List<PageData> sysManagerList = sysManagerService.sysManagerList(pd);//商品单位列表
			String uuid =this.get32UUID();
			//上传图片
			String  ffile = DateUtil.getDays();
			String folderName = "shangjia/shangpin/"+ffile+"/";//图片上传路径(商家平台商品图片)
			if (null != file && !file.isEmpty()){
				String filePath = CutImageUtil.CutIamgeToCustomSize(file, dataX, dataY, dataWidth, dataHeight, dataRotate, boxWidth, boxHeigth, folderName, uuid);                     
				System.out.println("=======编辑商品图片：======="+BaseController.getPath(request)+filePath);
				pd.put("goodsImg",  filePath);
				mv.addObject("filePath", filePath);
			}
			mv.addObject("list", spfllist);
			mv.addObject("sysManagerList", sysManagerList);
			mv.addObject("goodsName", goodsName);
			mv.addObject("goods_category_fid", goods_category_fid);
			mv.addObject("goodsState", goodsState);
			mv.addObject("topPrice", topPrice);
			mv.addObject("advisePrice", advisePrice);
			mv.addObject("shangjiaPrice", shangjiaPrice);
			mv.addObject("shanghuPrice", shanghuPrice);
			mv.addObject("goodsIntroduce", goodsIntroduce);
			mv.addObject("Stock", Stock);
			mv.addObject("danwei_id", danwei_id);
			mv.addObject("msg", "goodsinsert");
			mv.setViewName("information/goods/goods_add");
			return mv;
	}
	
	/**
	 * 进入修改页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goodstoEdit")
	public ModelAndView goods() throws Exception{
		logBefore(logger, "进入商品修改页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("goods_id", pd.getString("goods_id"));
		pd=kehuService.goodsgetDateByIdorName(pd);
		List<PageData> spfllist=kehuService.goodsCategoryListSearch(pd);//商品分类列表
		List<PageData> sysManagerList = sysManagerService.sysManagerList(pd);//商品单位列表
		mv.addObject("list", spfllist);
		mv.addObject("sysManagerList", sysManagerList);
		mv.addObject("pd", pd);
		mv.addObject("msg", "goodsupdate");
		mv.setViewName("information/goods/goods_edit");
		return mv;
	}
	
	/**
	 * 对指定对象进行修改
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goodsupdate")
	public ModelAndView goodsupdate(
			String goodsName,
			String goodsIntroduce,
			String goodsImg,
			String topPrice,
			String advisePrice,
			String shangjiaPrice,
			String shanghuPrice,
			String goods_category_id,
			String weight,
			String Stock,
			String danwei_id,
			String goodsState,
			String goods_id
			) throws Exception{
		logBefore(logger, "对指定商品进行修改");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		System.out.println(goodsImg);
		pd.put("goods_id", goods_id);
		pd.put("goodsImg", goodsImg);
		pd.put("goodsName", goodsName);
		pd.put("fabuTime", DateUtil.getTime());
		pd.put("topPrice", topPrice);
		pd.put("advisePrice", advisePrice);
		pd.put("goodsState", goodsState);
		pd.put("shangjiaPrice", shangjiaPrice);
		pd.put("shanghuPrice", shanghuPrice);
		pd.put("goodsIntroduce", goodsIntroduce);
		pd.put("goods_category_fid",goods_category_id);
		pd.put("weight",weight);
		pd.put("Stock",Stock);
		pd.put("danwei_fid",danwei_id);
		kehuService.goodsupdate(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		mv.setViewName("redirect:/api/kehu/goodsgetlistPage");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去图片裁剪页面（商品编辑）
	 * @日期:2017-9-26下午6:00:02
	 */
	@RequestMapping(value="/jumpupload")
	public ModelAndView jumpupload() throws Exception{
		logBefore(logger, "--去图片裁剪页面（商品编辑）--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		System.out.println("goods_id:"+pd.getString("goods_id"));
		System.out.println("goodsImg:"+pd.getString("goodsImg"));
		pd.put("goods_id", pd.getString("goods_id"));
		pd.put("goodsName", pd.getString("goodsName"));
		pd.put("goodsImg", pd.getString("goodsImg"));
		pd.put("goods_category_fid",pd.getString("goods_category_id"));
		pd.put("goodsState",pd.getString("goodsState"));
		pd.put("topPrice",pd.getString("topPrice"));
		pd.put("advisePrice",pd.getString("advisePrice"));
		pd.put("shangjiaPrice",pd.getString("shangjiaPrice"));
		pd.put("shanghuPrice",pd.getString("shanghuPrice"));
		pd.put("goodsIntroduce",pd.getString("goodsIntroduce"));
		pd.put("Stock",pd.getString("Stock"));
		pd.put("fabuTime", DateUtil.getTime());
		pd.put("danwei_id",pd.getString("danwei_id"));
		pd.put("danwei_fid",pd.getString("danwei_id"));
		kehuService.goodsupdate(pd);
		mv.addObject("pd", pd);
		mv.setViewName("information/goods/cropper_edit");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行商品编辑图片裁剪
	 * @日期:2017-9-26下午5:58:34
	 */
	@RequestMapping(value="/ceshiupload")
	public ModelAndView ceshiupload(HttpServletRequest request,
			@RequestParam(required = false) MultipartFile file,
			@RequestParam(required = false) String dataX,
			@RequestParam(required = false) String dataY,
			@RequestParam(required = false) String dataWidth,
			@RequestParam(required = false) String dataHeight,
			@RequestParam(required = false) String dataRotate,
			@RequestParam(required = false) String boxWidth,
			@RequestParam(required = false) String boxHeigth,
			String goods_id,
			String goodsImg,
			String goodsName,
			String goods_category_fid,
			String goodsState,
			String topPrice,
			String advisePrice,
			String shangjiaPrice,
			String shanghuPrice,
			String goodsIntroduce,
			String Stock,
			String danwei_id
			) throws Exception{
		logBefore(logger, "--执行商品编辑图片裁剪--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		PageData pds=new PageData();
		pd=this.getPageData();
		System.out.println("goods_id:"+goods_id);
		System.out.println("goodsState:"+goodsState);
		System.out.println("goods_category_fid:"+goods_category_fid);
		pds.put("goods_id", goods_id);
		List<PageData> spfllist=kehuService.goodsCategoryListSearch(pd);//商品分类列表
		List<PageData> sysManagerList = sysManagerService.sysManagerList(pd);//商品单位列表
		String uuid =this.get32UUID();
		//上传图片
		String  ffile = DateUtil.getDays();
		String folderName = "shangjia/shangpin/"+ffile+"/";//图片上传路径(商家平台商品图片)
		if (null != file && !file.isEmpty()){
			String filePath = CutImageUtil.CutIamgeToCustomSize(file, dataX, dataY, dataWidth, dataHeight, dataRotate, boxWidth, boxHeigth, folderName, uuid);                     
			System.out.println("=======编辑商品图片：======="+BaseController.getPath(request)+filePath);
			pds.put("goodsImg",  filePath);
			mv.addObject("filePath", filePath);
		}
		kehuService.goodsupdateImg(pds);
		PageData pdi=kehuService.goodsgetDateByIdorName(pds);
		mv.addObject("pd", pdi);
		mv.addObject("list", spfllist);
		mv.addObject("sysManagerList", sysManagerList);
		mv.addObject("msg", "goodsupdate");
		mv.setViewName("information/goods/goods_edit");
		return mv;
	}
	
	/**
	 * 删除指定的记录
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsdelete")
	public void goodsdelete(PrintWriter writer) throws Exception{
		logBefore(logger, "删除指定商品名称");
		PageData pd=new PageData();
		pd=this.getPageData();
		String str[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < str.length; i++) {
			ids.add(str[i]);
		}
		pd.put("ids", ids);
		//删除对象时，删除图片
		PageData pdPaths=kehuService.getImgPaths(pd);
		String imgPaths[]=pdPaths.getString("imgPaths").split(",");
		for (int i = 0; i < imgPaths.length; i++) {
			File file=new File(PathUtil.getClasspath()+imgPaths[i]);
			if(file.exists()){
				file.delete();
			}
		}
		kehuService.deleteGoods(pd);
		writer.close();
	}
	/**
	 * 修改商品状态
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsstate")
	public void goodsstate(PrintWriter writer) throws Exception{
		logBefore(logger, "修改商品状态");
		PageData pd=new PageData();
		pd=this.getPageData();
		String str[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < str.length; i++) {
			ids.add(str[i]);
		}
		if(pd.getString("state").equals("1")){
			pd.put("goodsState", "1");
		}else{
			pd.put("goodsState", "0");
		}
		pd.put("ids", ids);
		kehuService.goodsstate(pd);
		writer.close();
	}
	/*==============================商品管理（后台结束）====================================*/
	/*==============================商品菜篮分类管理（后台开始）====================================*/
	/**
	 * 获取商品模块列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/mokuailistPage")
	public ModelAndView mokuailistPage(Page page) throws Exception{
		logBefore(logger, "获取商品模块列表");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=mokuaiService.mokuailistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/goodsMokuai/mokuai_list");
		return mv;
	}
	/**
	 * 进入添加页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(Page page) throws Exception{
		logBefore(logger, "进入添加页面");
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "insert");
		mv.setViewName("information/goodsMokuai/mokuai_add");
		return mv;
	}
	/**
	 * 添加信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insert")
	public ModelAndView insert(
//			@RequestParam(required=false) MultipartFile file,
			String file,
			String title,
			String type
			) throws Exception{
		logBefore(logger, "添加信息");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		//保存信息
		pd.put("goods_mokuai_id", this.get32UUID());
		pd.put("title", title);
		pd.put("type", type);
		pd.put("goods_mokuai_Img_url", file);
		mokuaiService.insertMokuai(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		mv.setViewName("redirect:/api/kehu/mokuailistPage");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去图片裁剪页面(菜篮分类新增)
	 * @日期:2017-9-26下午6:02:17
	 */
	@RequestMapping(value="/jumpcailan")
	public ModelAndView jumpcailan() throws Exception{
		logBefore(logger, "--去图片裁剪页面(菜篮分类新增)--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("files", pd.getString("files"));
		pd.put("title", pd.getString("title"));
		pd.put("type",pd.getString("type"));
		pd.put("goods_mokuai_id",pd.getString("goods_mokuai_id"));
		mv.addObject("pd", pd);
		mv.setViewName("information/goodsMokuai/croppercl_add");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行菜篮分类新增裁剪
	 * @日期:2017-9-26下午6:00:48
	 */
	@RequestMapping(value="/ceshicailan")
	public ModelAndView ceshicailan(Page page,HttpServletRequest request,
			@RequestParam(required = false) MultipartFile file,
			@RequestParam(required = false) String dataX,
			@RequestParam(required = false) String dataY,
			@RequestParam(required = false) String dataWidth,
			@RequestParam(required = false) String dataHeight,
			@RequestParam(required = false) String dataRotate,
			@RequestParam(required = false) String boxWidth,
			@RequestParam(required = false) String boxHeigth,
			String files,
			String title,
			String type,
			String goods_mokuai_id
			) throws Exception{
			logBefore(logger, "执行菜篮分类新增裁剪");
			ModelAndView mv=new ModelAndView();
			PageData pd=new PageData();
			pd=this.getPageData();
			List<PageData> spfllist=kehuService.getlistPagespfl(page);//商品分类列表
			List<PageData> sysManagerList = sysManagerService.sysManagerListPage(page);//商品单位列表
			String uuid =this.get32UUID();
			//上传图片
			String  ffile = DateUtil.getDays();
			String folderName = "mokuai/mokuaiImg/"+ffile+"/";//图片上传路径(商家平台商品图片)
			if (null != file && !file.isEmpty()){
				String filePath = CutImageUtil.CutIamgeToCustomSize(file, dataX, dataY, dataWidth, dataHeight, dataRotate, boxWidth, boxHeigth, folderName, uuid);                     
				System.out.println("=======编辑商品图片：======="+BaseController.getPath(request)+filePath);
				pd.put("goods_mokuai_Img_url",  filePath);
				mv.addObject("filePath", filePath);
			}
			System.out.println("执行新增方法");
			mv.addObject("list", spfllist);
			mv.addObject("sysManagerList", sysManagerList);
			mv.addObject("files", files);
			mv.addObject("title", title);
			mv.addObject("type", type);
			mv.addObject("msg", "insert");
			mv.setViewName("information/goodsMokuai/mokuai_add");
			return mv;
	}
	
	/**
	 * 验证是否模块名称存在
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/MokuaiByName")
	@ResponseBody
	public Object MokuaiByName() throws Exception{
		logBefore(logger, "验证是否模块名称存在");
		Map<String, Object> map=new HashMap<String, Object>();
		String result="";
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("title", pd.getString("title"));
		PageData pageDatas = mokuaiService.getDateById(pd);
		if (pageDatas != null) {
			if (pageDatas.getString("title") != null) {
				System.out.println("模块名称不可以重复");
				result="01";
			}
		}
		map.put("result", result);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 验证是否模块序号存在
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getDateBytype")
	@ResponseBody
	public Object getDateBytype() throws Exception{
		logBefore(logger, "验证是否模块序号存在");
		Map<String, Object> map=new HashMap<String, Object>();
		String result="";
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("type", pd.getString("type"));
		PageData pageDatas = mokuaiService.getDateBytype(pd);
		if (pageDatas != null) {
			if (pageDatas.getString("type") != null) {
				System.out.println("模块序号不可以重复");
				result="02";
			}
		}
		map.put("result", result);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 进入修改页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit() throws Exception{
		logBefore(logger, "进入修改页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("goods_mokuai_id", pd.getString("tagID"));
		//获取指定对象信息
		pd=mokuaiService.getDateById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateMokuai");
		mv.setViewName("information/goodsMokuai/mokuai_edit");
		return mv;
	}
	/**
	 * 对指定对象进行修改
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateMokuai")
	public ModelAndView updateMokuai(
			//file,
			String title,
			String type,
			String goods_mokuai_Img_url,
			String goods_mokuai_id
			) throws Exception{
		logBefore(logger, "对指定对象进行修改");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		//更新信息
		pd.put("goods_mokuai_id", goods_mokuai_id);
		pd.put("goods_mokuai_Img_url", goods_mokuai_Img_url);
		pd.put("title", title);
		pd.put("type", type);
		mokuaiService.updateMokuai(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		mv.setViewName("redirect:/api/kehu/mokuailistPage");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去图片裁剪页面(菜篮分类编辑)
	 * @日期:2017-9-26下午6:02:17
	 */
	@RequestMapping(value="/jumpcailanEdit")
	public ModelAndView jumpcailanEdit() throws Exception{
		logBefore(logger, "--去图片裁剪页面(菜篮分类编辑)--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("files", pd.getString("files"));
		pd.put("goods_mokuai_Img_url", pd.getString("files"));
		pd.put("title", pd.getString("title"));
		pd.put("type",pd.getString("type"));
		pd.put("goods_mokuai_id",pd.getString("goods_mokuai_id"));
		mokuaiService.updateMokuai(pd);
		mv.addObject("pd", pd);
		mv.setViewName("information/goodsMokuai/croppercl_edit");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行菜篮分类编辑裁剪
	 * @日期:2017-9-27上午11:02:44
	 */
	@RequestMapping(value="/ceshicailanEdit")
	public ModelAndView ceshicailanEdit(Page page,HttpServletRequest request,
			@RequestParam(required = false) MultipartFile file,
			@RequestParam(required = false) String dataX,
			@RequestParam(required = false) String dataY,
			@RequestParam(required = false) String dataWidth,
			@RequestParam(required = false) String dataHeight,
			@RequestParam(required = false) String dataRotate,
			@RequestParam(required = false) String boxWidth,
			@RequestParam(required = false) String boxHeigth,
			String files,
			String title,
			String type,
			String goods_mokuai_id
			) throws Exception{
		logBefore(logger, "执行菜篮分类编辑裁剪");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		PageData pdi=new PageData();
		pd=this.getPageData();
		List<PageData> spfllist=kehuService.getlistPagespfl(page);//商品分类列表
		List<PageData> sysManagerList = sysManagerService.sysManagerListPage(page);//商品单位列表
		String uuid =this.get32UUID();
		//上传图片
		String  ffile = DateUtil.getDays();
		String folderName = "mokuai/mokuaiImg/"+ffile+"/";//图片上传路径(商家平台商品图片)
		if (null != file && !file.isEmpty()){
			String filePath = CutImageUtil.CutIamgeToCustomSize(file, dataX, dataY, dataWidth, dataHeight, dataRotate, boxWidth, boxHeigth, folderName, uuid);                     
			System.out.println("=======编辑商品图片：======="+BaseController.getPath(request)+filePath);
			pdi.put("goods_mokuai_Img_url",  filePath);
			mv.addObject("filePath", filePath);
		}
		pdi.put("goods_mokuai_id", goods_mokuai_id);
		System.out.println(goods_mokuai_id);
		System.out.println("执行菜篮编辑方法");
		mokuaiService.updateMokuaiImg(pdi);
		mv.addObject("list", spfllist);
		mv.addObject("sysManagerList", sysManagerList);
		PageData pds=mokuaiService.getDateById(pdi);
		mv.addObject("pd", pds);
		mv.addObject("msg", "updateMokuai");
		mv.setViewName("information/goodsMokuai/mokuai_edit");
		return mv;
	}
	
	/**
	 * 根据ID删除指定对象的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteMokuai")
	public void deleteMokuai(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		mokuaiService.deleteMokuai(map);
		writer.close();
	}
	/*=================================商品菜篮分类管理end==========================================*/
	
	
	/**
	 * 提交订单-结算
	 * 功能：结算
	 * 作者：yangym
	 * 日期：2017-9-28
	 * @throws Exception 
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/jiesuan")
	public ModelAndView jiesuan() throws Exception{
		ModelAndView mv = new  ModelAndView();	
		PageData pd=this.getPageData();
		//查出临时表所有数据
		pd.put("user_kehu_id", getSessionUser().getUser_kehu_id());
		String takeout_order_id = this.get32UUID();
		//查出临时表所有数据
		List<PageData> resultList = kehuService.selectTempOrderList(pd);
		for(int i=0;i<resultList.size();i++){
				PageData pdinser = new PageData();
				pdinser.put("order_goods_id", this.get32UUID());
				pdinser.put("goods_fid", resultList.get(i).get("sp_id"));
				pdinser.put("goodsName", resultList.get(i).get("name"));
				pdinser.put("goodsNum", resultList.get(i).get("num"));
				pdinser.put("price", resultList.get(i).get("price"));
				pdinser.put("img", resultList.get(i).get("img"));
				pdinser.put("takeout_order_fid",takeout_order_id);
				pdinser.put("create_time", DateUtil.getTime());
				kehuService.saveOrderGoods(pdinser);
			
		}
		
		double total = Double.parseDouble(pd.getString("total"))-Double.parseDouble(pd.getString("bucha"));
		if(pd.get("payType").equals("货到付款")){
			PageData pds = new PageData();
			pds.put("order_takeou_id", takeout_order_id);
			pds.put("orderTime", DateUtil.getTime());
			pds.put("orderNumber", DateUtil.getTimeStamp());
			pds.put("order_remark", "无");
			pds.put("payState", "1");
			pds.put("payMethod", "无");
			pds.put("payType", "货到付款");
			pds.put("totalSum", total);
			pds.put("paySum", pd.get("total"));
			pds.put("bucha", pd.get("bucha"));
			pds.put("user_kehu_fid", pd.get("user_kehu_id"));
			kehuService.saveOrder(pds);
		}else{
			//后续操作
		}
		
		mv.setViewName("information/xiadanSucceed");
		return mv;
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
