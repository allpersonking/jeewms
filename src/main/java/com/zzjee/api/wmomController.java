package com.zzjee.api;


import com.alibaba.fastjson.JSONArray;
import com.zzjee.conf.entity.FxjOtherLoginEntity;
import com.zzjee.conf.entity.WxConfigEntity;
import com.zzjee.wm.entity.WmNoticeConfEntity;
import com.zzjee.wm.entity.WmOmNoticeHEntity;
import com.zzjee.wm.entity.WmOmNoticeIEntity;
import com.zzjee.wm.entity.WmToDownGoodsEntity;
import com.zzjee.wm.page.WmOmNoticeHPage;
import com.zzjee.wmutil.wmUtil;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.beanvalidator.BeanValidators;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.jwt.util.ResponseMessage;
import org.jeecgframework.jwt.util.Result;
import org.jeecgframework.web.system.pojo.base.TSFunction;
import org.jeecgframework.web.system.pojo.base.TSNotice;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.service.UserService;
import org.jeecgframework.web.system.sms.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.xiaoleilu.hutool.date.DateTime.now;

/**
 * 获取和删除token的请求地址， 
 * 在Restful设计中其实就对应着登录和退出登录的资源映射
 * 
 * @author scott
 * @date 2015/7/30.
 */
@Controller
@RequestMapping("/wmom")
public class wmomController {
	private static final Logger logger = Logger.getLogger(wmomController.class);
	@Autowired
	private UserService userService;

	@Autowired
	SystemService systemService;


	@RequestMapping(value = "/alllist/{username}", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "获取全部订单列表信息", produces = "application/json", httpMethod = "GET")
	public ResponseMessage<List<WmOmNoticeHPage>> alllist(@PathVariable("username") String username, @RequestParam int pageNumber, @RequestParam int pageSize, HttpServletRequest request) {
		CriteriaQuery query = new CriteriaQuery(WmOmNoticeHEntity.class);
		try {

			if(StringUtil.isNotEmpty(request.getParameter("omNoticeId"))){
				query.like("omNoticeId","%"+request.getParameter("omNoticeId")+"%");
			}
			if(StringUtil.isNotEmpty(request.getParameter("delvMobile"))){
				query.like("delvMobile","%"+request.getParameter("delvMobile")+"%");
			}
			if(StringUtil.isNotEmpty(request.getParameter("delvMember"))){
				query.like("delvMember","%"+request.getParameter("delvMember")+"%");
			}
			if(StringUtil.isNotEmpty(request.getParameter("delvAddr"))){
				query.like("delvAddr","%"+request.getParameter("delvAddr")+"%");
			}
			String orgcode = "";
			TSUser task = wmUtil.getsysorgcode(username);
			if (task != null) {
				query.like("reCarno", "%" + task.getUserName() + "%");
			}
		} catch (Exception e) {
		}
		query.add();
		List<WmOmNoticeHPage> listsize = this.systemService.getListByCriteriaQuery(query, false);
		query.setCurPage(pageNumber <= 0 ? 1 : pageNumber);
		query.setPageSize(pageSize < 1 ? 1 : pageSize);
		query.add();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("createDate", "desc");
		query.setOrder(map);
		List<WmOmNoticeHPage> list = this.systemService.getListByCriteriaQuery(query, true);
		return Result.success(list, (long) listsize.size());
	}


	@RequestMapping(value = "/list/{username}", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "获取未完成订单列表信息", produces = "application/json", httpMethod = "GET")
	public ResponseMessage<List<WmOmNoticeHPage>> list(@PathVariable("username") String username, @RequestParam int pageNumber, @RequestParam int pageSize, HttpServletRequest request) {
		CriteriaQuery query = new CriteriaQuery(WmOmNoticeHEntity.class);
		try {
			query.eq("omSta", Constants.wm_sta6);

			if(StringUtil.isNotEmpty(request.getParameter("omNoticeId"))){
				query.like("omNoticeId","%"+request.getParameter("omNoticeId")+"%");
			}
			if(StringUtil.isNotEmpty(request.getParameter("delvMobile"))){
				query.like("delvMobile","%"+request.getParameter("delvMobile")+"%");
			}
			if(StringUtil.isNotEmpty(request.getParameter("delvMember"))){
				query.like("delvMember","%"+request.getParameter("delvMember")+"%");
			}
			if(StringUtil.isNotEmpty(request.getParameter("delvAddr"))){
				query.like("delvAddr","%"+request.getParameter("delvAddr")+"%");
			}
			String orgcode = "";
			TSUser task = wmUtil.getsysorgcode(username);
			if (task != null) {
				query.like("reCarno", "%" + task.getUserName() + "%");
			}
		} catch (Exception e) {
		}
		query.add();
		List<WmOmNoticeHPage> listsize = this.systemService.getListByCriteriaQuery(query, false);
		query.setCurPage(pageNumber <= 0 ? 1 : pageNumber);
		query.setPageSize(pageSize < 1 ? 1 : pageSize);
		query.add();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("createDate", "desc");
		query.setOrder(map);
		List<WmOmNoticeHPage> list = this.systemService.getListByCriteriaQuery(query, true);
		return Result.success(list, (long) listsize.size());
	}


	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "根据ID获取订单信息", notes = "根据ID获取订单信息", httpMethod = "GET", produces = "application/json")
	public ResponseMessage<?> get(@ApiParam(required = true, name = "id", value = "ID") @PathVariable("id") String id) {
		WmOmNoticeHEntity task = null;
		try {
			task = systemService.get(WmOmNoticeHEntity.class, id);

		} catch (Exception e) {

		}
		if (task == null) {
			try {
				task = systemService.findUniqueByProperty(WmOmNoticeHEntity.class, "omNoticeId", id);

			} catch (Exception e) {

			}
			if (task == null) {
				return Result.error("根据ID获取订单信息为空");
			}
		}
		WmOmNoticeHPage page = new WmOmNoticeHPage();
		try {
			MyBeanUtils.copyBeanNotNull2Bean(task, page);
			Object orderNo0 = task.getOmNoticeId();
			String hql0 = "from WmOmNoticeIEntity where 1 = 1 AND omNoticeId = ? ";
			List<WmOmNoticeIEntity> WmOmNoticeIEntityList = this.systemService.findHql(hql0, orderNo0);
			page.setWmOmNoticeIList(WmOmNoticeIEntityList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Result.success(page);
	}

	@RequestMapping(value = "/goodsdownlist/{orderNo}", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "订单出库商品信息", produces = "application/json", httpMethod = "GET")
	public ResponseMessage<List<WmToDownGoodsEntity>> filelist(@PathVariable("orderNo") String orderNo, HttpServletRequest request) {
		String hql0 = "from WmToDownGoodsEntity where 1 = 1 AND orderId = ? ";
		List<WmToDownGoodsEntity> wmToDownGoodsEntitiesList = this.systemService.findHql(hql0, orderNo);
		return Result.success(wmToDownGoodsEntitiesList);
	}


	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ApiOperation(value = "回单订单", notes = "回单订单")
	public ResponseMessage<?> update(@RequestBody WmOmNoticeHPage wmOmNoticeHPage) {
		//调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
		WmOmNoticeHEntity t = systemService.get(WmOmNoticeHEntity.class, wmOmNoticeHPage.getId());
		WmNoticeConfEntity confe = new WmNoticeConfEntity();
		confe.setBeizhu(wmOmNoticeHPage.getOmBeizhu());
		confe.setCreateBy(wmOmNoticeHPage.getCreateBy());
		confe.setHdData(now());
		confe.setCusCode(t.getCusCode());
		confe.setWmNoticeId(t.getOmNoticeId());
		systemService.save(confe);
		return Result.success("回单成功");
	}

	@RequestMapping(value="/getNotice/{username}", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value="获取公告",produces="application/json",httpMethod="GET")
	public ResponseMessage<List<TSNotice>> getNotice(@PathVariable("username") String username, HttpServletRequest request) {

		List<TSNotice> list = new ArrayList<>();
		TSUser task = wmUtil.getsysorgcode(username);
		List<Map<String, Object>> resultList2 = null;
		String orgcode = "";
		Integer isRead = null;
		if (task != null) {
			try {

				String sql = "SELECT notice.*,noticeRead.is_read as is_read FROM t_s_notice notice "
						+ "LEFT JOIN t_s_notice_read_user noticeRead ON  notice.id = noticeRead.notice_id "
						+ "WHERE noticeRead.del_flag = 0 and noticeRead.user_id = ? ";
				sql += " and noticeRead.is_read = ? ";
				sql += " ORDER BY noticeRead.create_time DESC ";
				if (isRead == null || !(isRead == 1 || isRead == 0)) {
					isRead = 0;
				}
				List<Map<String, Object>> noticeList = systemService.findForJdbcParam(sql, 1, 10, task.getId(), isRead.intValue());

				//将List转换成JSON存储
				net.sf.json.JSONArray result = new net.sf.json.JSONArray();
				if (noticeList != null && noticeList.size() > 0) {
					for (int i = 0; i < noticeList.size(); i++) {
						TSNotice tsNotice = new TSNotice();
						tsNotice.setId(noticeList.get(i).get("id").toString());
						tsNotice.setNoticeTitle(noticeList.get(i).get("notice_title").toString());
						tsNotice.setNoticeContent(noticeList.get(i).get("notice_content").toString());
						list.add(tsNotice);
					}
				}
				//获取通知公告总数
				String sql2 = "SELECT count(notice.id) as count FROM t_s_notice notice "
						+ "LEFT JOIN t_s_notice_read_user noticeRead ON  notice.id = noticeRead.notice_id "
						+ "WHERE noticeRead.del_flag = 0 and noticeRead.user_id = ? "
						+ "and noticeRead.is_read = 0";
				resultList2 = systemService.findForJdbc(sql2, task.getId());


			}
			catch (Exception e){

			}
		}
		return Result.success(list, Long.parseLong(resultList2.get(0).get("count").toString()));

	}
}
