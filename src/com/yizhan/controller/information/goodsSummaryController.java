package com.yizhan.controller.information;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.service.information.kehuService;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.ObjectExcelViews;
import com.yizhan.util.PageData;
/**
 * 商品汇总列表（后台）
 * @类名称： goodsSummaryController
 * @作者：lj 
 * @时间： 2017-10-10 上午9:55:12
 *
 */
@Controller
@RequestMapping(value="/goodsSummary")
public class goodsSummaryController extends BaseController {

	@Resource(name="kehuService")
	private kehuService kehuService;
	
	/**
	 * @作者:Lj
	 * @功能:商品汇总列表
	 * @日期:2017-10-10上午10:04:49
	 */
	@RequestMapping(value="/getgoodsSummarylist")
	public ModelAndView getgoodsSummarylistPage(Page page) throws Exception{
		logBefore(logger, "----商品汇总列表---");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(pd.getString("create_time") != null && !"".equals(pd.getString("create_time")) && pd.getString("searchDateEnd") != null && !"".equals(pd.getString("searchDateEnd"))){
			pd.put("create_time", pd.getString("create_time"));
			pd.put("searchDateEnd", pd.getString("searchDateEnd"));
		}else {
			pd.put("screate_time", pd.getString("create_time"));
		}
		PageData sum=kehuService.gethuizongSum(pd);
		if(sum!=null){
			mv.addObject("Totals", sum.get("Totals"));
		}
		page.setPd(pd);
		List<PageData> goodsSummaryList = kehuService.getgoodsSummarylistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("goodsSummaryList", goodsSummaryList);
		mv.setViewName("information/goodsSummary/goodsSummary_list");
		return mv;
	}
	
	/**
	 * @作者:Lj
	 * @功能:导出订单商品汇总明细列表到EXCEL
	 * @日期:2017-10-10上午11:18:16
	 */
	@RequestMapping(value="/getgoodsSummaryExcel")
	public ModelAndView getgoodsSummaryExcel(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("商品名称");
			titles.add("商品汇总数");
			titles.add("商品单价");
			titles.add("时间");
			dataMap.put("titles", titles);
			if(pd.getString("create_time") != null && !"".equals(pd.getString("create_time")) && pd.getString("searchDateEnd") != null && !"".equals(pd.getString("searchDateEnd"))){
				pd.put("create_time", pd.getString("create_time"));
				pd.put("searchDateEnd", pd.getString("searchDateEnd"));
			}else {
				pd.put("screate_time", pd.getString("create_time"));
			}
			List<PageData> goodsSummaryListExcel = kehuService.getgoodsSummaryListExcel(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<goodsSummaryListExcel.size();i++){
				PageData vpd = new PageData();
				vpd.put("商品名称", goodsSummaryListExcel.get(i).getString("goodsName"));
				vpd.put("商品汇总数", goodsSummaryListExcel.get(i).get("zongshu").toString());
				vpd.put("商品单价", goodsSummaryListExcel.get(i).getString("name"));	
				vpd.put("时间", goodsSummaryListExcel.get(i).getString("create_time"));
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelViews erv = new ObjectExcelViews();	//执行excel操作
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
}
