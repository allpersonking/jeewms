package com.zzjee.bireport.controller;
import com.zzjee.bireport.entity.RpPeriodInOutEntity;
import com.zzjee.bireport.service.RpPeriodInOutServiceI;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zzjee.wmutil.wmUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.common.TreeChildCount;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import java.io.OutputStream;
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.TemplateExportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.vo.TemplateExcelConstants;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jeecgframework.core.util.ResourceUtil;
import java.io.IOException;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Map;
import java.util.HashMap;
import org.jeecgframework.core.util.ExceptionUtil;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.jeecgframework.core.beanvalidator.BeanValidators;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.net.URI;
import org.springframework.http.MediaType;
import org.springframework.web.util.UriComponentsBuilder;

/**   
 * @Title: Controller  
 * @Description: 期间出货统计
 * @author onlineGenerator
 * @date 2019-01-17 12:55:46
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/rpPeriodInOutController")
public class RpPeriodInOutController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(RpPeriodInOutController.class);

	@Autowired
	private RpPeriodInOutServiceI rpPeriodInOutService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Validator validator;
	


	/**
	 * 期间出货统计列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/zzjee/bireport/rpPeriodInOutList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(RpPeriodInOutEntity rpPeriodInOut,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(RpPeriodInOutEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, rpPeriodInOut, request.getParameterMap());
		try{
		//自定义追加查询条件
		String query_datePeriod_begin = request.getParameter("datePeriod_begin");
		String query_datePeriod_end = request.getParameter("datePeriod_end");
		try{
            if(!StringUtil.isNotEmpty(query_datePeriod_begin)){
                query_datePeriod_begin = "2018-01-01";
            }
            if(!StringUtil.isNotEmpty(query_datePeriod_end)){
                query_datePeriod_end = "2099-01-01";
            }
			wmUtil.genrp(query_datePeriod_begin,query_datePeriod_end,ResourceUtil.getSessionUserName().getUserName());
		}catch (Exception e){
		}
		if(StringUtil.isNotEmpty(query_datePeriod_begin)){
			cq.ge("datePeriod", Integer.parseInt(query_datePeriod_begin));
		}
		if(StringUtil.isNotEmpty(query_datePeriod_end)){
			cq.le("datePeriod", Integer.parseInt(query_datePeriod_end));
		}
            cq.eq("username",ResourceUtil.getSessionUserName().getUserName());
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.rpPeriodInOutService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	


	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(RpPeriodInOutEntity rpPeriodInOut,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
			//自定义追加查询条件
//			String query_datePeriod_begin = request.getParameter("datePeriod_begin");
//			String query_datePeriod_end = request.getParameter("datePeriod_end");
//			try{
//                if(!StringUtil.isNotEmpty(query_datePeriod_begin)){
//                    query_datePeriod_begin = "2018-01-01";
//                }
//                if(!StringUtil.isNotEmpty(query_datePeriod_end)){
//                    query_datePeriod_end = "2099-01-01";
//                }
//				wmUtil.genrp(query_datePeriod_begin,query_datePeriod_end,ResourceUtil.getSessionUserName().getUserName());
//			}catch (Exception e){
//			}
        rpPeriodInOut.setUsername(ResourceUtil.getSessionUserName().getUserName());
		CriteriaQuery cq = new CriteriaQuery(RpPeriodInOutEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, rpPeriodInOut, request.getParameterMap());

		List<RpPeriodInOutEntity> rpPeriodInOuts = this.rpPeriodInOutService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"期间出货统计");
		modelMap.put(NormalExcelConstants.CLASS,RpPeriodInOutEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("期间出货统计列表", "导出人:"+ResourceUtil.getSessionUserName().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,rpPeriodInOuts);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}


	



}
