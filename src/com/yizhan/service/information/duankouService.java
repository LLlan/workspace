package com.yizhan.service.information;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("duankouService")
public class duankouService {

	 @Resource(name="daoSupport")
	 private DaoSupport dao;
	 /**
		 * 查询端口的列表
		 * @param page
		 * @return
		 * @throws Exception 
		 */
		public List<PageData> duankoulistPage(Page page) throws Exception {
			return (List<PageData>) dao.findForList("duankouMapper.duankoulistPage", page);
		}
		 /**
		  * 保存新增端口
		  */
	   public void saveduankou(PageData pd) throws Exception{
	        dao.save("duankouMapper.saveduankou", pd);
	   }
	 
	   /**
		 * 根据id查询端口列表，用于修改
		 * @return 
		 */
		public PageData getDataByID(PageData pd) throws Exception{
			return (PageData) dao.findForObject("duankouMapper.getDataByID", pd);
			
		}
	/**
	 * 保存修改的端口
	 */
	public void updateduankou(PageData pd)  throws Exception{
	       dao.update("duankouMapper.updateduankou", pd);
	}
	
	/**
	 * 删除端口
	 * @param pd
	 * @throws Exception 
	 */
	public void deleteDuankou(PageData pd) throws Exception {
		dao.delete("duankouMapper.deleteDuankou", pd);
	}

	
}
