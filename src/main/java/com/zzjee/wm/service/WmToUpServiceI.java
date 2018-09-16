package com.zzjee.wm.service;
import com.zzjee.wm.entity.WmToUpEntity;
import com.zzjee.wm.entity.WmToUpGoodsEntity;

import java.util.List;
import org.jeecgframework.core.common.service.CommonService;
import java.io.Serializable;

public interface WmToUpServiceI extends CommonService{
	
 	public <T> void delete(T entity);
	/**
	 * 添加一对多
	 * 
	 */
	public void addMain(WmToUpEntity wmToUp,
	        List<WmToUpGoodsEntity> wmToUpGoodsList) ;
	/**
	 * 修改一对多
	 * 
	 */
	public void updateMain(WmToUpEntity wmToUp,
	        List<WmToUpGoodsEntity> wmToUpGoodsList);
	public void delMain (WmToUpEntity wmToUp);
	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(WmToUpEntity t);
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(WmToUpEntity t);
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(WmToUpEntity t);
}
