package com.yizhan.service.information;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;
/**
 * @类名称： MokuaiService
 * @作者：lj 
 * @时间： 2017-9-15 上午10:35:40
 */
@Service("mokuaiService")
public class MokuaiService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> mokuailistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("mokuaiMapper.mokuailistPage", page);
	}
	
	/**
	 * 获取首页顶部的模块列表
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-10-11
	 */
	public List<PageData> getMokuaiList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("mokuaiMapper.getMokuaiList", pd);
	}
	/**
	 * 保存
	 * @param pd
	 * @throws Exception
	 */
	public void insertMokuai(PageData pd) throws Exception{
		dao.save("mokuaiMapper.insertMokuai", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDateById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("mokuaiMapper.getDateById", pd);
	}
	/**
	 * 验证是否模块序号存在
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDateBytype(PageData pd) throws Exception{
		return (PageData) dao.findForObject("mokuaiMapper.getDateBytype", pd);
	}
	/**
	 * 更新指定对象的信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateMokuai(PageData pd) throws Exception{
		dao.update("mokuaiMapper.updateMokuai", pd);
	}
	
	/**
	 * 更新菜篮分类图片
	 * @param pd
	 * @throws Exception
	 */
	public void updateMokuaiImg(PageData pd) throws Exception{
		dao.update("mokuaiMapper.updateMokuaiImg", pd);
	}
	
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteMokuai(Map<String, Object> map) throws Exception{
		dao.delete("mokuaiMapper.deleteMokuai", map);
	}
	/**
	 * 获取集合列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListOfMokuai(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("mokuaiMapper.getListOfMokuai", pd);
	}
}
