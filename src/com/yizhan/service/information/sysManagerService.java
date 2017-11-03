package com.yizhan.service.information;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("sysManagerService")
public class sysManagerService {

	 @Resource(name="daoSupport")
	 private DaoSupport dao;
	 /**
	  * 商品单位列表
	  */
	 public List<PageData> sysManagerListPage(Page page) throws Exception{
		 return (List<PageData>) dao.findForList("sysManagerMapper.sysManagerlistPage", page);
	 }
	 
	 /**
	  * 商品单位列表2
	  */
	 public List<PageData> sysManagerList(PageData pd) throws Exception{
		 return (List<PageData>) dao.findForList("sysManagerMapper.sysManagerList", pd);
	 }
	 
	 /**
	  * 保存商品单位
	  */
	public void savegooddanwei(PageData pd) throws Exception{
	        dao.save("sysManagerMapper.savegooddanwei", pd);
	}
	 
	/**
	 * 根据id查询商品单位列表，用于修改
	 * @return 
	 */
	public PageData getDataByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("sysManagerMapper.getDataByID", pd);
		
	}

	
	
	/**
	 * 保存修改商品单位
	 */
	public void updateGoodDanwei(PageData pd)  throws Exception{
	       dao.update("sysManagerMapper.updateGoodDanwei", pd);
	}

	/**
	 * 删除订单
	 */
	public void deleteGooddanwei(PageData pd) throws Exception {
		
		dao.delete("sysManagerMapper.deleteGooddanwei", pd);
	}
	 
}
