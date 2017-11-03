package com.yizhan.controller.information;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.service.information.kehuService;
import com.yizhan.service.information.orderTakeouService;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.util.Const;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.PageData;
/**
 * 后台菜篮订单管理列表
 * @类名称： orderTakeouController
 * @作者：lj 
 * @时间： 2017-9-28 下午4:40:42
 */
@Controller
@RequestMapping(value="/orderTakeout")
public class orderTakeoutController extends BaseController {
	
	@Resource(name="orderTakeouService")
	private orderTakeouService orderTakeouService;
	
	@Resource(name="kehuService")
	private kehuService kehuService;
	
	/**
	 * @作者:Lj
	 * @功能:菜篮订单管理列表
	 * @日期:2017-9-28下午4:43:43
	 */
	@RequestMapping(value="/getOrderTakeoulistPage")
	public ModelAndView getOrderTakeoulistPage(Page page) throws Exception{
		logBefore(logger, "----菜篮订单管理列表---");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> orderTakeouList=orderTakeouService.getOrderTakeoulistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("orderTakeouList", orderTakeouList);
		mv.setViewName("information/orderTakeou/orderTakeou_list");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:导出订单信息到EXCEL
	 * @日期:2017-9-30上午10:20:19
	 */
	@RequestMapping(value="/orderExcel")
	public ModelAndView orderExcel(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			//检索条件===
			String searchName = pd.getString("searchName");
			if(null != searchName && !"".equals(searchName)){
				searchName = searchName.trim();
				pd.put("searchName", searchName);
			}
			String orderTime = pd.getString("orderTime");
			if(orderTime != null && !"".equals(orderTime)){
				orderTime = orderTime+" 00:00:00";
				pd.put("orderTime", orderTime);
			}else {
				System.out.println("进支付判断");
				pd.put("payState", pd.getString("payState"));
			}
			//检索条件===
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("姓名");  	//1
			titles.add("联系电话");		//2
			titles.add("商户名称");	//3
			titles.add("店址");		//4
			titles.add("下单时间");		//5
			titles.add("订单号");	//6
			titles.add("支付状态");		//7
			titles.add("支付方式");	    //8
			titles.add("昨日补差");	    //9
			titles.add("商品价格");	    //10
			titles.add("商品总价");	    //11
			dataMap.put("titles", titles);
			List<PageData> Orderlist = orderTakeouService.getOrderTakeouExcelList(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<Orderlist.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", Orderlist.get(i).getString("userName"));			//1
				vpd.put("var2", Orderlist.get(i).getString("phone"));			//2
				vpd.put("var3", Orderlist.get(i).getString("shanghuName"));				//3
				vpd.put("var4", Orderlist.get(i).getString("address")+"("+Orderlist.get(i).getString("detailAddress")+")");
				vpd.put("var5", Orderlist.get(i).get("orderTime").toString().substring(0, 19));
				vpd.put("var6", Orderlist.get(i).getString("orderNumber"));
				if (Orderlist.get(i).getString("payState").equals("1")) {
					vpd.put("var7", "未支付");
				}else if (Orderlist.get(i).getString("payState").equals("4")) {
					vpd.put("var7", "已支付");
					
				}
				vpd.put("var8", Orderlist.get(i).getString("payType"));
				vpd.put("var9", Orderlist.get(i).get("bucha").toString());
				vpd.put("var11", Orderlist.get(i).get("totalSum").toString());
				vpd.put("var10", Orderlist.get(i).get("paySum").toString());
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();	//执行excel操作
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:菜篮订单明细列表
	 * @日期:2017-9-28下午4:43:43
	 */
	@RequestMapping(value="/ordermingxilist")
	public ModelAndView ordermingxilist(Page page) throws Exception{
		logBefore(logger, "----菜篮订单明细列表---");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("order_takeou_id", pd.getString("order_takeou_id"));
		page.setPd(pd);
		List<PageData> ordermingxiList=orderTakeouService.ordermingxiList(pd);
		mv.addObject("pd", pd);
		mv.addObject("ordermingxiList", ordermingxiList);
		mv.setViewName("information/orderTakeou/ordermingxi_list");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:导出订单明细列表到EXCEL
	 * @日期:2017-9-30上午11:24:22
	 */
	@RequestMapping(value="/ordermingxiExcel")
	public ModelAndView ordermingxiExcel(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			/*titles.add("");
			titles.add("");
			titles.add("");
			titles.add("");
			titles.add("");
			titles.add("");
			titles.add("");
			titles.add("");
			titles.add("");*/
			titles.add("订单号");
			titles.add("客户姓名");
			titles.add("手机号");
			titles.add("地址");
			titles.add("商品名称");
			titles.add("商品类别");
			titles.add("商品单价");
			titles.add("购买数量");
			titles.add("总计");
			dataMap.put("titles", titles);
			pd.put("order_takeou_id", pd.getString("order_takeou_id"));
			List<PageData> Ordermingxilist = orderTakeouService.ordermingxiList(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<Ordermingxilist.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", Ordermingxilist.get(i).getString("orderNumber"));
				vpd.put("var2", Ordermingxilist.get(i).getString("userName"));
				vpd.put("var3", Ordermingxilist.get(i).getString("phone"));	
				vpd.put("var4", Ordermingxilist.get(i).getString("address")+"("+Ordermingxilist.get(i).getString("detailAddress")+")");
				vpd.put("var5", Ordermingxilist.get(i).getString("goodsName"));
				vpd.put("var6", Ordermingxilist.get(i).getString("title")+"("+Ordermingxilist.get(i).getString("categoryName")+")");
				vpd.put("var7", Ordermingxilist.get(i).getString("price")+"/"+Ordermingxilist.get(i).getString("name"));
				vpd.put("var8", Ordermingxilist.get(i).getString("goodsNum"));
				vpd.put("var9", Ordermingxilist.get(i).get("Total").toString());
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();	//执行excel操作
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:去昨日补差页面
	 * @日期:2017-9-29下午3:21:45
	 */
	@RequestMapping(value = "/tozuoribuchaEdit")
	public ModelAndView tozuoribucha() throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("user_kehu_id", pd.getString("tagID"));
		pd = kehuService.getKehuDataById(pd);
		mv.addObject("msg", "zuoribuchatoUpdate");
		mv.addObject("pd", pd);
		mv.setViewName("information/orderTakeou/bucha_edit");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行订单昨日补差
	 * @日期:2017-9-29下午3:19:57
	 */
	@RequestMapping(value = "/zuoribuchatoUpdate")
	public ModelAndView zuoribuchatoUpdate() throws Exception {
		logBefore(logger, "----执行订单昨日补差---");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("user_kehu_id", pd.get("user_kehu_fid"));
		orderTakeouService.updatezuoribucha(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行订单确认支付
	 * @日期:2017-9-29下午4:27:51
	 */
	@RequestMapping(value = "/updatePayState")
	public ModelAndView updatePayState() throws Exception {
		logBefore(logger, "----执行订单确认支付---");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("payState", 4);
		orderTakeouService.updatePayState(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
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
