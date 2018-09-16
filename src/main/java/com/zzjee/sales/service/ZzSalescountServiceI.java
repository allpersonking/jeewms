package com.zzjee.sales.service;
import com.zzjee.sales.entity.ZzSalescountEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface ZzSalescountServiceI extends CommonService{
	
 	public void delete(ZzSalescountEntity entity) throws Exception;
 	
 	public Serializable save(ZzSalescountEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ZzSalescountEntity entity) throws Exception;
 	
}
