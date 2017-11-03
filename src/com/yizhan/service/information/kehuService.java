package com.yizhan.service.information;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


/**
 * @类名称： kehuService
 * @作者：lj 
 * @时间： 2017-9-15 上午9:11:02
 */
@Service("kehuService")
public class kehuService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/**
	 * 保存订单
	 * @param pd
	 * @throws Exception 
	 */
	public void saveOrder(PageData pd) throws Exception{
		dao.update("kehuMapper.saveOrder", pd);
	}
	
	
	/**
	 * 保存订单商品表
	 * @param pd
	 * @throws Exception 
	 */
	public void saveOrderGoods(PageData pd) throws Exception{
		dao.update("kehuMapper.saveOrderGoods", pd);
	}
	
	/**
	 * 根据客户id获取客户的所有订单信息
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-9-28
	 */
	 public List<PageData> getOrderListBykehuID(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.getOrderListBykehuID",pd);
	}
	 
	 /**
	  * 根据订单ID查订单商品表数据
	  * 功能：
	  * 作者：yangym
	  * 日期：2017-9-28
	  */
	 public List<PageData> getOrderGoodListByTateOutID(PageData pd) throws Exception {
		 return (List<PageData>) dao.findForList("kehuMapper.getOrderGoodListByTateOutID",pd);
	 }
	
	
	
    /*================================我的(开始)=============================*/
	 
	/**
	 * 收货地址列表
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
   public List<PageData> dizhiListPage(PageData pd) throws Exception {
		
		return (List<PageData>) dao.findForList("kehuMapper.dizhiListPage",pd);
	}
	/**
	 * 新增收货地址
	 * @param pd
	 * @throws Exception
	 */
	public void saveShouhuoAddress(PageData pd) throws Exception {
	        dao.save("kehuMapper.saveShouhuoAddress", pd);
	}
	/**
	 * 根据地址id查询收货地址
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDizhiByID(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("kehuMapper.getDizhiByID", pd);
	}
	
	/**
	 * 修改收货地址
	 * @param pd
	 * @throws Exception 
	 */
	public void saveDizhiEdit(PageData pd) throws Exception {
		dao.update("kehuMapper.saveDizhiEdit",pd);
	}
	
	/**
	 * 据id删除收货地址
	 * @param pd
	 * @throws Exception 
	 */
	public void deleteDizhiByID(PageData pd) throws Exception {
		dao.delete("kehuMapper.deleteDizhiByID", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:设置为默认收货地址
	 * @日期:2017-9-30下午5:48:02
	 */
	public void SetisDefaultAddress(PageData pd) throws Exception {
		dao.update("kehuMapper.SetisDefaultAddress", pd);
	}
	
	/**
	 * 根据id查询客户
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getKehuDataById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("kehuMapper.getKehuDataById", pd);
	}
	/**
	 * 联系我们
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> contactList(PageData pd) throws Exception {
	
		return (List<PageData>) dao.findForList("kehuMapper.contactList",pd);
}

	/**
	 * 保存意见反馈
	 * @param pd
	 * @throws Exception 
	 */
	public void savefeedback(PageData pd) throws Exception {
		
		dao.save("kehuMapper.savefeedback", pd);
	}

	/**
	 * 意见反馈列表
	 * 
	 * @throws Exception
	 */
	public List<PageData> feedbacklistPage(Page page) throws Exception {

		return (List<PageData>) dao.findForList("kehuMapper.feedbacklistPage",page);
	}

	/**
	 * 据id删除意见反馈列表
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void delfeedback(PageData pd) throws Exception {
		dao.delete("kehuMapper.delfeedback", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行意见反馈已处理
	 * @日期:2017-9-29下午5:33:01
	 */
	public void updatechuliStatus(PageData pd) throws Exception {
		dao.update("kehuMapper.updatechuliStatus",pd);
	}
	
	/*==================================我的(结束)=================================*/
	/**
	 * 根据手机号或者用户名去查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByNameOrPhone(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getDataByNameOrPhone", pd);
	}
	
	/**
	 * 根据ID查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserDataByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getUserDataByID", pd);
	}
	
	/**
	 * 保存客户端用户信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd) throws Exception{
		dao.save("kehuMapper.saveKeHuUser", pd);
	}
	
	/**
	 * 根据手机号判断该用户是否已经存在 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserDataByPhone(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getUserDataByPhone", pd);
	}
	
	/**
	 * 根据登录名和密码获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByPhoneAndPassWord(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getDataByPhoneAndPassWord", pd);
	}
	
	/**
	 * 每次登录时,更新登录时间和IP
	 * @param pd
	 * @throws Exception
	 */
	public void updateLoginTimeAndIp(PageData pd) throws Exception{
		dao.update("kehuMapper.updateLoginTimeAndIp", pd);
	}
	
	/**
	 * 根据手机号修改登录密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePasswordByPhone(PageData pd) throws Exception{
		dao.update("kehuMapper.updatePasswordByPhone", pd);
	}
	
	/**
	 * @作者：Lj
	 * @功能:上传与修改保存头像
	 * @日期：2017-8-30上午10:44:00
	 */
	public void touxiang(PageData pd) throws Exception {
		 dao.update("kehuMapper.touxiang", pd);
	}
	
	/**
	 * @作者：Lj
	 * @功能:执行修改用户名
	 * @日期：2017-8-30上午10:45:40
	 */
	public void saveyonghuming(PageData pd) throws Exception {
		dao.save("kehuMapper.saveyonghuming", pd);
	}
	
	/**
	 * 根据id查询一条信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData addressEdit(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.addressEdit", pd);
	}
	
	/**
	 * 确认订单的默认地址
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getByisDefault(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getByisDefault", pd);
	}
	
	/**
	 * 查询电话号码是否重复，即该用户是否注册过
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByPhone(PageData pd)throws Exception{
		return (PageData)dao.findForObject("kehuMapper.findByPhone", pd);
	}
	
	/**
	 * 换绑手机新手机号
	 * @param pd
	 * @throws Exception
	 */
	public void updatephone(PageData pd) throws Exception {
		dao.update("kehuMapper.updatephone", pd);
		
	}
	
	/**
	 * 设置支付密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatepayPassword(PageData pd) throws Exception {
		dao.update("kehuMapper.updatepayPassword", pd);
		
	}
	
	/**
	 * 动态码表类型
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> selectall(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.selectall",pd);
	}
	
	/**
	 * 动态社区列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> selecHuDongSheQuList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.selecHuDongSheQuList",pd);
	}
	
	/**
	 * 根据id查询一条信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryHudongDongtai(PageData pd) throws Exception{
		return (PageData)dao.findForObject("kehuMapper.queryHudongDongtai", pd);
	}
	
	
	/**
	 * 美食外卖商家页面列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> businessList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("kehuMapper.businessList", pd);
	}
	
	/**
	 * 轮播图列表
	 * @作者:lj
	 * 2017-8-24下午5:41:38
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> picturesList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("kehuMapper.picturesList", pd);
	}
	/**
	 * 导航八大模块
	 * @作者:lj
	 * 2017-8-24下午5:41:38
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMoKuaiList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("kehuMapper.getMoKuaiList", pd);
	}
	
	/**
	 * 执行删除外卖订单
	 * @param pd
	 * @throws Exception
	 */
	public void quxiaoOrderDelete(PageData pd) throws Exception {
		dao.delete("kehuMapper.quxiaoOrderDelete", pd);
	}
	
	/**
	 * 执行删除外卖订单
	 * @param pd
	 * @throws Exception
	 */
	public void quxiaoOrderGoodsDelete(PageData pd) throws Exception {
		dao.delete("kehuMapper.quxiaoOrderGoodsDelete", pd);
	}
	
	/**
	 * 客户端详细商家商品列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> kehuOrderGoodsLists(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.kehuOrderGoodsLists",pd);
	}
	
	/**
	 * 客户端正在进行中的订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryOrderTakeouHaveInHand(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.queryOrderTakeouHaveInHand", pd);
	}

	
	/**
	 * 保存临时订单表
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-2
	 */
	public void saveTempOrder(PageData pd) throws Exception {
		dao.update("kehuMapper.saveTempOrder", pd);
		
	}
	
	/**
	 * 删除临时订单 根据客户id
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-2
	 */
	public void delTempOrder(PageData pd) throws Exception {
		dao.delete("kehuMapper.delTempOrder", pd);
		
	}
	/**
	 * 减到0则删除
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-17
	 */
	public void delTempOrderBySpID(PageData pd) throws Exception {
		dao.delete("kehuMapper.delTempOrderBySpID", pd);
		
	}
	
	/**
	 *  修改临时订单表的某件商品的数量 
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-17
	 */
	public void updateNumberbyId(PageData pd) throws Exception {
		dao.delete("kehuMapper.updateNumberbyId", pd);
		
	}
	
	/**
	 * 查询临时订单
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-2
	 */
	public List<PageData> selectTempOrderList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.selectTempOrderList",pd);
	}
	
	/**
	 * 查询总价格
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-2
	 */
	public PageData getTotolByUserKeHuID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getTotolByUserKeHuID", pd);
	}
	
	/**
	 * 差默认地址
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-9-30
	 */
	public PageData selectMoredizhiByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.selectMoredizhiByID", pd);
	}
	
	/**
	 * 获取用户详细信息
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-9-22
	 */
	public PageData getUserDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getUserDetailByID", pd);
	}
	
	/**
	 * 查询最大的取餐号
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-3
	 */
	public PageData selectMaxQucanNumber(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.selectMaxQucanNumber", pd);
	}
	
	/**
	 * 查询商家的起送价格
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-3
	 */
	public PageData getqisonjiagebyID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getqisonjiagebyID", pd);
	}
	
	/**
	 * 查餐盒费
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-8
	 */
	public PageData getCanhefeiSUM(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getCanhefeiSUM", pd);
	}
	
	
	/**
	 * 更新订单编号到订单表中
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-9
	 */
	public void updateOrderNumber(PageData pd) throws Exception {
		dao.update("kehuMapper.updateOrderNumber", pd);
		
	}
	public void updateOrderNumberById(PageData pd) throws Exception {
		dao.update("kehuMapper.updateOrderNumberById", pd);
		
	}
	/**
	 * 根据订单编号获取订单信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOrderInforByOrderNumber(PageData pd) throws Exception {
		return (PageData) dao.findForObject("kehuMapper.getOrderInforByOrderNumber", pd);
		
	}
	
	/**
	 * 更新订单信息
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-9
	 */
	public void updateOrderInfoByOrderNumber(PageData pd) throws Exception {
		dao.update("kehuMapper.updateOrderInfoByOrderNumber", pd);
		
	}
	
	/**
	 * 根据用户id查询一条同城订单是否存在进行中信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getorderTongchengjinxing(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getorderTongchengjinxing", pd);
	}
	
	/**
	 * 根据用户id查询一条同城订单是否存在未付款信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getorderTongcheng(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getorderTongcheng", pd);
	}
	
	/**
	 * 根据用户id查询一条同城订单是否存在已接驾订单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getorderTongyijiejia(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getorderTongyijiejia", pd);
	}
	
	/**
	 * 根据用户id查询一条长途订单是否存在未付款信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getorderChangtu(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getorderChangtu", pd);
	}
	
	/**
	 * 根据外卖订单编号获取查询商家的id
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData geuserShangjiaFid(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.geuserShangjiaFid", pd);
	}
	
	/**
	 * 根据同城信息ID获取查询司机id
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserSijiFid(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getUserSijiFid", pd);
	}
	
	/**
	 * 获取指定司机设备ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryRegistrationID(PageData pd) throws Exception{
		return (PageData)dao.findForObject("kehuMapper.queryRegistrationID", pd);
	}
	
	
	/**
	 * 满减优惠列表
	 * 功能：
	 * 作者：yangym
	 * 日期：2017-8-31
	 */
	public List<PageData> getMjyhList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.getMjyhList",pd);
	}
	/**
	 * 满减配送费列表
	 */
	public List<PageData> getMjpsfList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.getMjpsfList",pd);
	}
	
	/**
     * @作者:Lj
     * @功能:评价标签码列表以及包括每个标签的评价次数
     * @日期:2017-8-31下午6:27:48
     */
    public List<PageData> sysLabelList(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("kehuMapper.sysLabelList",pd);
    }
    /**
     * 获取商家的评论列表
     * @param pd
     * @return
     * @throws Exception
     */
    public List<PageData> getEvaluateListOfShangJia(PageData pd) throws Exception {
    	return (List<PageData>) dao.findForList("kehuMapper.getEvaluateListOfShangJia",pd);
    }
    
    /**
     * @作者:Lj
     * @功能:执行保存订单评价
     * @日期:2017-9-1上午8:47:57
     */
    public void savemyeval(PageData pd) throws Exception {
        dao.save("kehuMapper.savemyeval", pd);
    }
    
    /**
     * @作者:Lj
     * @功能:执行保存评价标签关系表
     * @日期:2017-9-1下午2:09:56
     */
    public void saveEvaluateLabel(PageData pd) throws Exception {
    	dao.save("kehuMapper.saveEvaluateLabel", pd);
    }
    
    /**
     * @作者:Lj
     * @功能:我的评价列表
     * @日期:2017-9-1下午3:26:21
     */
    public List<PageData> getEvaluateList(PageData pd) throws Exception {
    	return (List<PageData>) dao.findForList("kehuMapper.getEvaluateList",pd);
    }
    
    /**
     * @作者:Lj
     * @功能:查询对商家的评价总数
     * @日期:2017-9-4上午10:34:35
     */
    public PageData queryPingLunSum(PageData pd) throws Exception{
    	return (PageData)dao.findForObject("kehuMapper.queryPingLunSum", pd);
    }
    
    /**
     * @作者:Lj
     * @功能:查询商家的商品出售后的，各类评价的总数
     * @日期:2017-9-5下午2:10:50
     */
    public PageData queryGeLeiPJSum(PageData pd) throws Exception{
    	return (PageData)dao.findForObject("kehuMapper.queryGeLeiPJSum", pd);
    }
    
    /**
     * @作者:Lj
     * @功能:根据id查询追评的评价
     * @日期:2017-9-4上午10:34:35
     */
	public PageData queryByevaluateId(PageData pd) throws Exception{
		return (PageData)dao.findForObject("kehuMapper.queryByevaluateId", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:我的收藏列表
	 * @日期:2017-9-4下午2:56:00
	 */
	public List<PageData> getShouCangList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.getShouCangList",pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:查询是否已被收藏过了
	 * @日期:2017-9-6上午9:14:38
	 */
	public PageData selectShouCang(PageData pd) throws Exception {
		return (PageData) dao.findForObject("kehuMapper.selectShouCang",pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行收藏商家店铺
	 * @日期:2017-9-6上午9:14:54
	 */
	public void insertShouCang(PageData pd) throws Exception {
		dao.save("kehuMapper.insertShouCang",pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:执行删除收藏商家店铺（执行取消收藏）
	 * @日期:2017-9-6上午11:52:13
	 */
	public void deletelShouCang(PageData pd) throws Exception {
		dao.delete("kehuMapper.deletelShouCang", pd);
	}
	
	/**
	 * 查看商品详情
	 */
	public PageData getGoodDetailByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("kehuMapper.getGoodDetailByID",pd);
	}
	/**
	 * 根据ID获取商家信息 
	 */
	public PageData getShangJiaDataByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("kehuMapper.getShangJiaDataByID",pd);
	}
	
	/**
	  * 会员列表
	  */
	 public List<PageData> memberlistPage(Page page) throws Exception{
		 return (List<PageData>) dao.findForList("kehuMapper.memberlistPage", page);
	 }
	  /**
		 * 根据id查询会员列表
	     * @return 
	 */
		public PageData getMemberDataByID(PageData pd) throws Exception{
			return (PageData) dao.findForObject("kehuMapper.getMemberDataByID", pd);
			
		}
	/**
	 * 删除会员
	 */
	public void deleteMember(PageData pd) throws Exception {
		
		dao.delete("kehuMapper.deleteMember", pd);
	}
	/**
	 * 查询端口
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> duankoulist(Page page) throws Exception {
		return (List<PageData>) dao.findForList("kehuMapper.duankoulist", page);
	}
	/**
	 * 保存为会员分配的端口 
	 * @throws Exception 
	 */
	public void updateDuankou(PageData pd) throws Exception {
		dao.update("kehuMapper.updateDuankou", pd);	
	}
	/**
	 * 保存修改的分配端口
	 */
	public void saveDuankouedit(PageData pd)  throws Exception{
	       dao.update("kehuMapper.updateDuankou", pd);
	}
	/*========================================商品管理（后台开始）===========================================================*/
	/**
	 * 查询所有的信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> goodsgetlistPage(Page page) throws Exception{
		
		return (List<PageData>)dao.findForList("goodsMapper.getlistPage", page);
	}
	/**
	 * 获取指定商家指定分类的所有商品
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> goodsgetlistAll(PageData pd) throws Exception{
		
		return (List<PageData>)dao.findForList("goodsMapper.getlistAll", pd);
	}
	/**
	 * 根据ID或者name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData goodsgetDateByIdorName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("goodsMapper.getDateByIdorName", pd);
	}
	/**
	 * 添加信息
	 * @throws Exception 
	 */
	public void goodsinsert(PageData pd) throws Exception{
		dao.save("goodsMapper.goodsinsert", pd);
	}
	/**
	 * 更新
	 * @param pd
	 * @throws Exception
	 */
	public void goodsupdate(PageData pd) throws Exception{
		dao.update("goodsMapper.goodsupdate", pd);
	}
	/**
	 * 更新商品图片
	 * @param pd
	 * @throws Exception
	 */
	public void goodsupdateImg(PageData pd) throws Exception{
		dao.update("goodsMapper.goodsupdateImg", pd);
	}
	/**
	 * 修改商品状态
	 * @param pd
	 * @throws Exception
	 */
	public void goodsChangeState(PageData pd) throws Exception{
		dao.update("goodsMapper.updatestateOne", pd);
	}
	/**
	 * 修改商品状态
	 * @param pd
	 * @throws Exception
	 */
	public void goodsstate(PageData pd) throws Exception{
		dao.update("goodsMapper.updatestate", pd);
	}
	/**
	 * 获取图片地址路径(删除商品的时候使用)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getImgPaths(PageData pd) throws Exception{
		return (PageData) dao.findForObject("goodsMapper.getImgPaths", pd);
	}
	/**
	 * 删除指定信息
	 * @param pd
	 * @throws Exception 
	 */
	public void goodsdelete(PageData pd) throws Exception{
		dao.delete("goodsMapper.goodsdelete", pd);
	}
	
	/**
	 * 删除商品
	 * @param pd
	 * @throws Exception 
	 */
	public void deleteGoods(PageData pd) throws Exception{
		dao.delete("goodsMapper.deleteGoods", pd);
	}
	
	/*========================================商品管理（后台结束）===========================================================*/
	
	/*========================================商品分类管理(后台开始)=======================================================*/
	/**
	 * 查询所有的信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getlistPagespfl(Page page) throws Exception{
		return (List<PageData>)dao.findForList("goodsCategoryMapper.getlistPage", page);
	}
	/**
	 * 添加信息
	 * @param pd
	 * @throws Exception
	 */
	public void spflinsert(PageData pd) throws Exception{
		dao.save("goodsCategoryMapper.spflinsert", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:商家商品分类码表类型
	 * @日期:2017-9-15下午4:58:38
	 */
	public List<PageData> goodsCategoryList(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("goodsCategoryMapper.goodsCategoryList", pd);
	}
	
	/**
	 * @作者:Lj
	 * @功能:商家商品分类码表类型
	 * @日期:2017-9-15下午4:58:38
	 */
	public List<PageData> goodsCategoryListSearch(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("goodsCategoryMapper.goodsCategoryListSearch", pd);
	}
	
	/**
	 * 根据ID或者名称获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData spflgetDateByIdorName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("goodsCategoryMapper.spflgetDateByIdorName", pd);
	}
	/**
	 * 修改商品分类名称
	 * @param pd
	 * @throws Exception 
	 */
	public void spflupdate(PageData pd) throws Exception{
		dao.update("goodsCategoryMapper.spflupdate", pd);
	}
	/**
	 * 删除指定信息
	 * @param pd
	 * @throws Exception
	 */
	public void spfldeleteOne(PageData pd) throws Exception{
		dao.delete("goodsCategoryMapper.deleteOne", pd);
	}
	/**
	 * 删除指定信息
	 * @param pd
	 * @throws Exception
	 */
	public void spfldelete(PageData pd) throws Exception{
		dao.delete("goodsCategoryMapper.delete", pd);
	}
	

	
	/*========================================商品分类管理(后台结束)=======================================================*/
	
	 /**
	   * 页面初始化 根据商品分类名字和商家id查出列表数据
	   * @param pd
	   * @return
	   * @throws Exception
	   */
	  public List<PageData> getDataByCategoryNameAndId(PageData pd) throws Exception {
	    return (List<PageData>) dao.findForList("kehuMapper.getDataByCategoryNameAndId",pd);
	  }
	  
	  /**
	   * @作者:Lj
	   * @功能:商品汇总列表
	   * @日期:2017-10-10上午9:57:51
	   */
	  public List<PageData> getgoodsSummarylistPage(Page page) throws Exception {
		  return (List<PageData>) dao.findForList("kehuMapper.getgoodsSummarylistPage",page);
	  }
	  
	  /**
	   * @作者:Lj
	   * @功能:导出订单商品汇总明细列表到EXCEL
	   * @日期:2017-10-10下午5:08:22
	   */
	  public List<PageData> getgoodsSummaryListExcel(PageData pd) throws Exception {
		  return (List<PageData>) dao.findForList("kehuMapper.getgoodsSummaryListExcel",pd);
	  }
	
	  /**
	   * @作者:Lj
	   * @功能:汇总总金额
	   * @日期:2017-10-10下午5:12:06
	   */
	  public PageData gethuizongSum(PageData pd) throws Exception{
		  return (PageData) dao.findForObject("kehuMapper.gethuizongSum", pd);
	  }
}

