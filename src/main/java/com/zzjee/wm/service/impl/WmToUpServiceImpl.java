package com.zzjee.wm.service.impl;
import com.zzjee.wm.service.WmToUpServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import com.zzjee.wm.entity.WmToUpEntity;
import com.zzjee.wm.entity.WmToUpGoodsEntity;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import java.util.ArrayList;
import java.util.UUID;
import java.io.Serializable;


@Service("wmToUpService")
@Transactional
public class WmToUpServiceImpl extends CommonServiceImpl implements WmToUpServiceI {
	
 	public <T> void delete(T entity) {
 		super.delete(entity);
 		//执行删除操作配置的sql增强
		this.doDelSql((WmToUpEntity)entity);
 	}
	
	public void addMain(WmToUpEntity wmToUp,
	        List<WmToUpGoodsEntity> wmToUpGoodsList){
			//保存主信息
			this.save(wmToUp);
		
			/**保存-上架商品明细*/
			for(WmToUpGoodsEntity wmToUpGoods:wmToUpGoodsList){
				//外键设置
				wmToUpGoods.setCusCode(wmToUp.getCusCode());
				wmToUpGoods.setKuWeiBianMa(wmToUp.getKuWeiBianMa());
				wmToUpGoods.setBinId(wmToUp.getBinId());
				wmToUpGoods.setActTypeCode(wmToUp.getActTypeCode());
				wmToUpGoods.setWmToUpId(wmToUp.getId());
				this.save(wmToUpGoods);
			}
			//执行新增操作配置的sql增强
 			this.doAddSql(wmToUp);
	}

	
	public void updateMain(WmToUpEntity wmToUp,
	        List<WmToUpGoodsEntity> wmToUpGoodsList) {
		//保存主表信息
		this.saveOrUpdate(wmToUp);
		//===================================================================================
		//获取参数
		Object id0 = wmToUp.getId();
		//===================================================================================
		//1.查询出数据库的明细数据-上架商品明细
	    String hql0 = "from WmToUpGoodsEntity where 1 = 1 AND wM_TO_UP_ID = ? ";
	    List<WmToUpGoodsEntity> wmToUpGoodsOldList = this.findHql(hql0,id0);
		//2.筛选更新明细数据-上架商品明细
		if(wmToUpGoodsList!=null&&wmToUpGoodsList.size()>0){
		for(WmToUpGoodsEntity oldE:wmToUpGoodsOldList){
			boolean isUpdate = false;
				for(WmToUpGoodsEntity sendE:wmToUpGoodsList){
					//需要更新的明细数据-上架商品明细
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-上架商品明细
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-上架商品明细
			for(WmToUpGoodsEntity wmToUpGoods:wmToUpGoodsList){
				if(oConvertUtils.isEmpty(wmToUpGoods.getId())){
					//外键设置
					wmToUpGoods.setWmToUpId(wmToUp.getId());
					this.save(wmToUpGoods);
				}
			}
		}
		//执行更新操作配置的sql增强
 		this.doUpdateSql(wmToUp);
	}

	
	public void delMain(WmToUpEntity wmToUp) {
		//删除主表信息
		this.delete(wmToUp);
		//===================================================================================
		//获取参数
		Object id0 = wmToUp.getId();
		//===================================================================================
		//删除-上架商品明细
	    String hql0 = "from WmToUpGoodsEntity where 1 = 1 AND wM_TO_UP_ID = ? ";
	    List<WmToUpGoodsEntity> wmToUpGoodsOldList = this.findHql(hql0,id0);
		this.deleteAllEntitie(wmToUpGoodsOldList);
	}
	
 	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(WmToUpEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(WmToUpEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(WmToUpEntity t){
	 	return true;
 	}
 	
 	/**
	 * 替换sql中的变量
	 * @param sql
	 * @return
	 */
 	public String replaceVal(String sql,WmToUpEntity t){
 		sql  = sql.replace("#{id}",String.valueOf(t.getId()));
 		sql  = sql.replace("#{create_name}",String.valueOf(t.getCreateName()));
 		sql  = sql.replace("#{create_by}",String.valueOf(t.getCreateBy()));
 		sql  = sql.replace("#{create_date}",String.valueOf(t.getCreateDate()));
 		sql  = sql.replace("#{update_name}",String.valueOf(t.getUpdateName()));
 		sql  = sql.replace("#{update_by}",String.valueOf(t.getUpdateBy()));
 		sql  = sql.replace("#{update_date}",String.valueOf(t.getUpdateDate()));
 		sql  = sql.replace("#{sys_org_code}",String.valueOf(t.getSysOrgCode()));
 		sql  = sql.replace("#{sys_company_code}",String.valueOf(t.getSysCompanyCode()));
 		sql  = sql.replace("#{bin_id}",String.valueOf(t.getBinId()));
 		sql  = sql.replace("#{ku_wei_bian_ma}",String.valueOf(t.getKuWeiBianMa()));
 		sql  = sql.replace("#{act_type_code}",String.valueOf(t.getActTypeCode()));
 		sql  = sql.replace("#{cus_code}",String.valueOf(t.getCusCode()));
 		sql  = sql.replace("#{UUID}",UUID.randomUUID().toString());
 		return sql;
 	}
}