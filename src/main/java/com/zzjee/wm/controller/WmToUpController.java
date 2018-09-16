package com.zzjee.wm.controller;
import com.sun.org.apache.bcel.internal.generic.NEWARRAY;
import com.zzjee.md.entity.MdCusEntity;
import com.zzjee.md.entity.MdGoodsEntity;
import com.zzjee.wm.entity.WmImNoticeHEntity;
import com.zzjee.wm.entity.WmImNoticeIEntity;
import com.zzjee.wm.entity.WmInQmIEntity;
import com.zzjee.wm.entity.WmToUpEntity;
import com.zzjee.wm.service.WmToUpServiceI;
import com.zzjee.wm.page.WmToUpPage;
import com.zzjee.wm.entity.WmToUpGoodsEntity;

import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ExceptionUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.Map;

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
 * @Description: 上架明细
 * @author erzhongxmu
 * @date 2017-08-15 23:18:14
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/wmToUpController")
public class WmToUpController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(WmToUpController.class);

	@Autowired
	private WmToUpServiceI wmToUpService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Validator validator;

	/**
	 * 上架明细列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/zzjee/wm/wmToUpList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "listgoods")
	public ModelAndView listgoods(HttpServletRequest request) {
		return new ModelAndView("com/zzjee/wm/wminupList");
	}
	@RequestMapping(params = "datagridgoods")
	public void datagridgoods(WmToUpGoodsEntity wmToUpGoods,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(WmToUpGoodsEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, wmToUpGoods);
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.wmToUpService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	@RequestMapping(params = "datagrid")
	public void datagrid(WmToUpEntity wmToUp,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(WmToUpEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, wmToUp);
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.wmToUpService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除上架明细
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(WmToUpEntity wmToUp, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		wmToUp = systemService.getEntity(WmToUpEntity.class, wmToUp.getId());
		String message = "上架明细删除成功";
		try{
			wmToUpService.delMain(wmToUp);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "上架明细删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 批量删除上架明细
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		String message = "上架明细删除成功";
		try{
			for(String id:ids.split(",")){
				WmToUpEntity wmToUp = systemService.getEntity(WmToUpEntity.class,
				id
				);
				wmToUpService.delMain(wmToUp);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "上架明细删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	 
	@RequestMapping(params = "doGetbinid", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public AjaxJson doGetbinid(HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String hql0 = "from WmInQmIEntity where binSta = 'N' AND tinId = ? ";
		System.out.println(oConvertUtils.getString(request
				.getParameter("binid")));
		List<WmInQmIEntity> WmInQmIEntityList = systemService.findHql(hql0,
				oConvertUtils.getString(request.getParameter("binid")));// 获取行项目
		List<WmInQmIEntity> WmInQmIEntityListout = new ArrayList<WmInQmIEntity>();
		if (WmInQmIEntityList.size() > 0) {
			for (WmInQmIEntity wmInQmIEntity : WmInQmIEntityList) {
				MdGoodsEntity mdgoods = systemService.findUniqueByProperty(
						MdGoodsEntity.class, "shpBianMa",
						wmInQmIEntity.getGoodsId());
				if (mdgoods != null) {
					wmInQmIEntity.setGoodsUnit(mdgoods.getShpMingCheng());
				}
				WmInQmIEntityListout.add(wmInQmIEntity);
			}
			j.setObj(WmInQmIEntityListout);
			MdCusEntity md = systemService.findUniqueByProperty(
					MdCusEntity.class, "keHuBianMa", WmInQmIEntityListout.get(0)
							.getCusCode());
			j.setMsg(md.getZhongWenQch());
		} else {
			j.setSuccess(false);
			j.setMsg("此托盘无需要上架数据");
		}
		return j;
	}
	 
	/**
	 * 添加上架明细
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(WmToUpEntity wmToUp,WmToUpPage wmToUpPage, HttpServletRequest request) {
		List<WmToUpGoodsEntity> wmToUpGoodsList = new ArrayList<WmToUpGoodsEntity>();
		String hql0 = "from WmInQmIEntity where binSta = 'N' AND tinId = ? and binId = ?";
		List<WmInQmIEntity> WmInQmIEntityList = systemService
				.findHql(hql0, wmToUp.getBinId(),wmToUp.getKuWeiBianMa());//获取行项目
		for (WmInQmIEntity wmInQmIEntity : WmInQmIEntityList) {
			WmToUpGoodsEntity wmToUpGoodsEntity = new WmToUpGoodsEntity();
			wmToUpGoodsEntity.setGoodsId(wmInQmIEntity.getGoodsId());
			wmToUpGoodsEntity.setGoodsProData(wmInQmIEntity.getProData());
			wmToUpGoodsEntity.setGoodsBatch(wmInQmIEntity.getGoodsBatch());
			wmToUpGoodsEntity.setGoodsQua(wmInQmIEntity.getQmOkQuat());
			wmToUpGoodsEntity.setGoodsUnit(wmInQmIEntity.getGoodsUnit());
			wmToUpGoodsEntity.setOrderIdI(wmInQmIEntity.getId());
			wmToUpGoodsEntity.setOrderId(wmInQmIEntity.getImNoticeId());
			wmInQmIEntity.setBinSta("Y");
			wmToUpGoodsList.add(wmToUpGoodsEntity);
			wmToUp.setCusCode(wmInQmIEntity.getCusCode());
			systemService.save(wmInQmIEntity);
		}
		AjaxJson j = new AjaxJson();
		String message = "添加成功";
		try{
			wmToUpService.addMain(wmToUp, wmToUpGoodsList);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "上架明细添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	/**
	 * 更新上架明细
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(WmToUpEntity wmToUp,WmToUpPage wmToUpPage, HttpServletRequest request) {
		List<WmToUpGoodsEntity> wmToUpGoodsList =  wmToUpPage.getWmToUpGoodsList();
		AjaxJson j = new AjaxJson();
		String message = "更新成功";
		try{
			wmToUpService.updateMain(wmToUp, wmToUpGoodsList);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "更新上架明细失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 上架明细新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(WmToUpEntity wmToUp, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(wmToUp.getId())) {
			wmToUp = wmToUpService.getEntity(WmToUpEntity.class, wmToUp.getId());
			req.setAttribute("wmToUpPage", wmToUp);
		}
		return new ModelAndView("com/zzjee/wm/wmToUp-add");
	}
	
	/**
	 * 上架明细编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(WmToUpEntity wmToUp, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(wmToUp.getId())) {
			wmToUp = wmToUpService.getEntity(WmToUpEntity.class, wmToUp.getId());
			req.setAttribute("wmToUpPage", wmToUp);
		}
		return new ModelAndView("com/zzjee/wm/wmToUp-update");
	}
	
	
	/**
	 * 加载明细列表[上架商品明细]
	 * 
	 * @return
	 */
	@RequestMapping(params = "wmToUpGoodsList")
	public ModelAndView wmToUpGoodsList(WmToUpEntity wmToUp, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id0 = wmToUp.getId();
		//===================================================================================
		//查询-上架商品明细
	    String hql0 = "from WmToUpGoodsEntity where 1 = 1 AND wmToUpId = ? ";
	    try{
	    	List<WmToUpGoodsEntity> wmToUpGoodsEntityList = systemService.findHql(hql0,id0);
			req.setAttribute("wmToUpGoodsList", wmToUpGoodsEntityList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		return new ModelAndView("com/zzjee/wm/wmToUpGoodsList");
	}

    /**
    * 导出excel
    *
    * @param request
    * @param response
    */
    @RequestMapping(params = "exportXls")
    public String exportXls(WmToUpEntity wmToUp,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid,ModelMap map) {
    	CriteriaQuery cq = new CriteriaQuery(WmToUpEntity.class, dataGrid);
    	//查询条件组装器
    	org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, wmToUp);
    	try{
    	//自定义追加查询条件
    	}catch (Exception e) {
    		throw new BusinessException(e.getMessage());
    	}
    	cq.add();
    	List<WmToUpEntity> list=this.wmToUpService.getListByCriteriaQuery(cq, false);
    	List<WmToUpPage> pageList=new ArrayList<WmToUpPage>();
        if(list!=null&&list.size()>0){
        	for(WmToUpEntity entity:list){
        		try{
        		WmToUpPage page=new WmToUpPage();
        		   MyBeanUtils.copyBeanNotNull2Bean(entity,page);
            	    Object id0 = entity.getId();
				    String hql0 = "from WmToUpGoodsEntity where 1 = 1 AND wmToUpId = ? ";
        	        List<WmToUpGoodsEntity> wmToUpGoodsEntityList = systemService.findHql(hql0,id0);
            		page.setWmToUpGoodsList(wmToUpGoodsEntityList);
            		pageList.add(page);
            	}catch(Exception e){
            		logger.info(e.getMessage());
            	}
            }
        }
        map.put(NormalExcelConstants.FILE_NAME,"上架明细");
        map.put(NormalExcelConstants.CLASS,WmToUpPage.class);
        map.put(NormalExcelConstants.PARAMS,new ExportParams("上架明细列表", "导出人:Jeecg",
            "导出信息"));
        map.put(NormalExcelConstants.DATA_LIST,pageList);
        return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}

    /**
	 * 通过excel导入数据
	 * @param request
	 * @param
	 * @return
	 */
	@RequestMapping(params = "importExcel", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile file = entity.getValue();// 获取上传文件对象
			ImportParams params = new ImportParams();
			params.setTitleRows(2);
			params.setHeadRows(2);
			params.setNeedSave(true);
			try {
				List<WmToUpPage> list =  ExcelImportUtil.importExcel(file.getInputStream(), WmToUpPage.class, params);
				WmToUpEntity entity1=null;
				for (WmToUpPage page : list) {
					entity1=new WmToUpEntity();
					MyBeanUtils.copyBeanNotNull2Bean(page,entity1);
		            wmToUpService.addMain(entity1, page.getWmToUpGoodsList());
				}
				j.setMsg("文件导入成功！");
			} catch (Exception e) {
				j.setMsg("文件导入失败！");
				logger.error(ExceptionUtil.getExceptionMessage(e));
			}finally{
				try {
					file.getInputStream().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			}
			return j;
	}
	/**
	* 导出excel 使模板
	*/
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(ModelMap map) {
		map.put(NormalExcelConstants.FILE_NAME,"上架明细");
		map.put(NormalExcelConstants.CLASS,WmToUpPage.class);
		map.put(NormalExcelConstants.PARAMS,new ExportParams("上架明细列表", "导出人:"+ ResourceUtil.getSessionUserName().getRealName(),
		"导出信息"));
		map.put(NormalExcelConstants.DATA_LIST,new ArrayList());
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	* 导入功能跳转
	*
	* @return
	*/
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name", "wmToUpController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}

 	
 	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public List<WmToUpEntity> list() {
		List<WmToUpEntity> listWmToUps=wmToUpService.getList(WmToUpEntity.class);
		return listWmToUps;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<?> get(@PathVariable("id") String id) {
		WmToUpEntity task = wmToUpService.get(WmToUpEntity.class, id);
		if (task == null) {
			return new ResponseEntity(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(task, HttpStatus.OK);
	}
 	
 	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> create(@RequestBody WmToUpPage wmToUpPage, UriComponentsBuilder uriBuilder) {
		//调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
		Set<ConstraintViolation<WmToUpPage>> failures = validator.validate(wmToUpPage);
		if (!failures.isEmpty()) {
			return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
		}

		//保存
		List<WmToUpGoodsEntity> wmToUpGoodsList =  wmToUpPage.getWmToUpGoodsList();
		
		WmToUpEntity wmToUp = new WmToUpEntity();
		try{
			MyBeanUtils.copyBeanNotNull2Bean(wmToUp,wmToUpPage);
		}catch(Exception e){
            logger.info(e.getMessage());
        }
		wmToUpService.addMain(wmToUp, wmToUpGoodsList);

		//按照Restful风格约定，创建指向新任务的url, 也可以直接返回id或对象.
		String id = wmToUpPage.getId();
		URI uri = uriBuilder.path("/rest/wmToUpController/" + id).build().toUri();
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(uri);

		return new ResponseEntity(headers, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> update(@RequestBody WmToUpPage wmToUpPage) {
		//调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
		Set<ConstraintViolation<WmToUpPage>> failures = validator.validate(wmToUpPage);
		if (!failures.isEmpty()) {
			return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
		}

		//保存
		List<WmToUpGoodsEntity> wmToUpGoodsList =  wmToUpPage.getWmToUpGoodsList();
		
		WmToUpEntity wmToUp = new WmToUpEntity();
		try{
			MyBeanUtils.copyBeanNotNull2Bean(wmToUp,wmToUpPage);
		}catch(Exception e){
            logger.info(e.getMessage());
        }
		wmToUpService.updateMain(wmToUp, wmToUpGoodsList);

		//按Restful约定，返回204状态码, 无内容. 也可以返回200状态码.
		return new ResponseEntity(HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void delete(@PathVariable("id") String id) {
		WmToUpEntity wmToUp = wmToUpService.get(WmToUpEntity.class, id);
		wmToUpService.delMain(wmToUp);
	}
}
