package com.yizhan.service.information;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

/**
 * 后台菜篮订单管理列表
 * @类名称： orderTakeouService
 * @作者：lj 
 * @时间： 2017-9-28 下午4:48:41
 */
@Service("orderTakeouService")
public class orderTakeouService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * @作者:Lj
	 * @功能:订单管理列表
	 * @日期:2017-9-28下午4:48:19
	 */
	public List<PageData> getOrderTakeoulistPage(Page page) throws Exception{
		return (List<PageData>)dao.findForList("orderTakeouMapper.getOrderTakeoulistPage", page);
	}
	
	/**
	 * @作者:Lj
	 * @功能:导出订单信息到EXCEL
	 * @日期:2017-9-28下午4:48:19
	 */
	public List<PageData> getOrderTakeouExcelList(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("orderTakeouMapper.getOrderTakeouExcelList", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:订单管理列表
	 * @日期:2017-9-28下午4:48:19
	 */
	public List<PageData> ordermingxilistPage(Page page) throws Exception{
		return (List<PageData>)dao.findForList("orderTakeouMapper.ordermingxilistPage", page);
	}
	
	/**
	 * @作者:Lj
	 * @功能:导出订单明细列表到EXCEL
	 * @日期:2017-9-30上午11:25:41
	 */
	public List<PageData> ordermingxiList(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("orderTakeouMapper.ordermingxiList", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:昨日补差
	 * @日期:2017-9-29下午3:26:52
	 */
	public void updatezuoribucha(PageData pd)  throws Exception{
	       dao.update("orderTakeouMapper.updatezuoribucha", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行订单确认支付
	 * @日期:2017-9-29下午4:28:43
	 */
	public void updatePayState(PageData pd)  throws Exception{
		dao.update("orderTakeouMapper.updatePayState", pd);
	}
	
}

