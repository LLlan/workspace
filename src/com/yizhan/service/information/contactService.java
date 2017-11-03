package com.yizhan.service.information;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("contactService")
public class contactService {

	 @Resource(name="daoSupport")
	 private DaoSupport dao;
	 /**
	  * 联系我们列表
	  */
	 public List<PageData> contactlistPage(Page page) throws Exception{
		 return (List<PageData>) dao.findForList("contactMapper.contactlistPage", page);
	 }
	 
	 /**
	  *  保存联系我们新增数据
	  */
	public void saveContactwm(PageData pd) throws Exception{
	        dao.save("contactMapper.saveContactwm", pd);
	}
	 
	/**
	 * 根据id查询联系我们记录
	 * @return 
	 */
	public PageData getDataByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("contactMapper.getDataByID", pd);
		
	}

	
	
	/**
	 * 保存修改的联系我们信息
	 */
	public void updateContactwm(PageData pd)  throws Exception{
	       dao.update("contactMapper.updateContactwm", pd);
	}

	/**
	 * 删除联系我们信息
	 */
	public void deleteContactwm(PageData pd) throws Exception {
		
		dao.delete("contactMapper.deleteContactwm", pd);
	}
	 
}
