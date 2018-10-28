package com.zzjee.wmutil;

import com.alibaba.fastjson.JSONObject;
import com.xiaoleilu.hutool.http.HttpUtil;
import com.zzjee.yongyoubase.openapi4j.exception.OpenAPIException;
import com.zzjee.yongyoubase.openapi4j.service.*;
import com.alibaba.fastjson.JSONArray;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.util.DigestUtils;

import java.nio.charset.Charset;
import java.util.*;

public class yyUtil {
    /**
     * User: caoez
     * Date: 18-09-01
     * Time: 下午2:07
     */

    public static JSONObject   getProduct(Map<String, Object> params) {
        String to_account = params.get("to_account").toString();	//提供方id
//        String page_index = args[1];	//	页号
//        String rows_per_page = args[2];	//	每页行数
//        String code_begin = args[3];	//	起始编码
//        String code_end = args[4];		//	结束编码
//        String name = args[5];			//	名称关键字
//        String sort_code = args[6];		//	分类编码
//        String sort_name = args[7];		//分类名称关键字

        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("to_account", to_account);
        paramMap.put("page_index", "1");
        paramMap.put("rows_per_page", "20000000");
//        paramMap.put("code_begin", code_begin);
//        paramMap.put("code_end", code_end);
//        paramMap.put("name", name);
//        paramMap.put("sort_code", sort_code);
//        paramMap.put("sort_name", sort_name);

        InventoryService ds = new InventoryService();
        try {
            JSONObject record = ds.batchGet(paramMap);
            return  record;
        } catch (OpenAPIException e) {
            return  null;
        }
    }
    public static  Map<String, Object>  getPo(Map<String, Object> params) {
        String to_account = params.get("to_account").toString();	//提供方id        String page_index = args[1];// 页号
//        String rows_per_page = args[2];// 每页行数
//        String code_begin = args[3];// 起始订单编号
//        String code_end = args[4];// 结束订单编号
//        String state = args[5];// 订单状态
//        String date_begin = args[6];// 起始订单日期，格式:yyyy-MM-dd
//        String date_end = args[7];// 结束订单日期，格式:yyyy-MM-dd
//
//        String vendorcode = args[8];// 供应商编码，可以通过 api/vendor 获取
//        String vendorname = args[9];// 供应商名称关键字，可以通过 api/vendor 获取
//        String personcode = args[10];// 业务员编码，可以通过 api/person 获取
//        String personname = args[11];// 业务员名称关键字，可以通过 api/person 获取
//        String deptcode = args[12];// 部门编码，可以通过 api/department 获取
//        String deptname = args[13];// 部门名称关键字，可以通过 api/department 获取
//        String remark = args[14];// 备注关键字
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("to_account", to_account);
        paramMap.put("page_index", "1");
        paramMap.put("rows_per_page", "200000");
//        paramMap.put("code_begin", code_begin);
//        paramMap.put("code_end", code_end);
        paramMap.put("date_begin", DateUtils.date2Str(DateUtils.date_sdf));
        paramMap.put("date_end", DateUtils.date2Str(DateUtils.date_sdf));
//        paramMap.put("state", state);
//        paramMap.put("vendorcode", vendorcode);
//        paramMap.put("vendorname", vendorname);
//        paramMap.put("personcode", personcode);
//        paramMap.put("personname", personname);
//        paramMap.put("deptcode", deptcode);
//        paramMap.put("deptname", deptname);
//        paramMap.put("remark", remark);
        PurchaseOrderService purchaseOrderService = new PurchaseOrderService();
        Map<String, Object>   resmap = new HashMap<String, Object>();
        try {
            JSONObject record = purchaseOrderService.batchGet(paramMap);
            JSONArray jsonarray = JSONArray.parseArray(record.get("purchaseorderlist").toString());
            for(int i=0;i<jsonarray.size();i++){
                JSONObject jspo = jsonarray.getJSONObject(i); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
               String poid =  jspo.get("code").toString();
           try {
                    JSONObject recordone = purchaseOrderService.get(poid, to_account);
                    resmap.put(Integer.toString(i),recordone);
                } catch (OpenAPIException e) {
                    e.printStackTrace();
                }
            }
            return  resmap;
        } catch (OpenAPIException e) {
            return  null;
        }
    }
    public static  Map<String, Object>  getSdvl(Map<String, Object> params) {
        String to_account = params.get("to_account").toString();	//提供方id        String page_index = args[1];// 页号
//        String page_index = args[1];// 页号
//        String rows_per_page = args[2];// 每页行数
//        String code_begin = args[3];// 起始单据编号
//        String code_end = args[4];// 结束单据编号
//        String state = args[5];// 订单状态
//        String date_begin = args[6];// 起始制单日期，格式:yyyy-MM-dd
//        String date_end = args[7];// 结束制单日期，格式:yyyy-MM-dd
//        String custcode = args[8];// 客户编码，可以通过 api/customer 获取
//        String cusname = args[9];// 客户名称关键字，可以通过 api/customer 获取
//        String personcode = args[10];// 业务员编码，可以通过 api/person 获取
//        String personname = args[11];// 业务员名称关键字，可以通过 api/person 获取
//        String deptcode = args[12];// 部门编码，可以通过 api/department 获取
//        String deptname = args[13];// 部门名称关键字，可以通过 api/department 获取
//        String remark = args[14];// 备注关键字
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("to_account", to_account);
        paramMap.put("page_index", "1");
        paramMap.put("rows_per_page", "200000");
//        paramMap.put("code_begin", code_begin);
//        paramMap.put("code_end", code_end);
        paramMap.put("date_begin", DateUtils.date2Str(DateUtils.date_sdf));
        paramMap.put("date_end", DateUtils.date2Str(DateUtils.date_sdf));
//        paramMap.put("state", state);
//        paramMap.put("custcode", custcode);
//        paramMap.put("cusname", cusname);
//        paramMap.put("personcode", personcode);
//        paramMap.put("personname", personname);
//        paramMap.put("deptcode", deptcode);
//        paramMap.put("deptname", deptname);
//        paramMap.put("remark", remark);
        ConsignmentService consignmentService = new ConsignmentService();
        Map<String, Object>   resmap = new HashMap<String, Object>();

        try {
            JSONObject record = consignmentService.batchGet(paramMap);
            JSONArray jsonarray = JSONArray.parseArray(record.get("consignmentlist").toString());
            for(int i=0;i<jsonarray.size();i++){
                JSONObject sdpo = jsonarray.getJSONObject(i); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                String sdid =  sdpo.get("code").toString();
                try {
                    JSONObject recordone = consignmentService.get(sdid, to_account);
                    resmap.put(Integer.toString(i),recordone);
                } catch (OpenAPIException e) {
                    e.printStackTrace();
                }
            }
             return  resmap;
        } catch (OpenAPIException e) {
            return  null;
        }
    }

 public  static void addOtherOut(Map<String, Object> params){
     String to_account = params.get("to_account").toString();	//提供方id        String page_index = args[1];// 页号

     String jsonBody = params.get("jsonBody").toString();
     OtherOutService otherOutService = new OtherOutService();
     try {
         JSONObject record = otherOutService.add(jsonBody, to_account);
     } catch (OpenAPIException e) {
         e.printStackTrace();
     }
 }
    public  static void addOtherIn(Map<String, Object> params){
        String to_account = params.get("to_account").toString();	//提供方id        String page_index = args[1];// 页号

        String jsonBody = params.get("jsonBody").toString();
        OtherInService otherInService = new OtherInService();
        try {
            JSONObject record = otherInService.add(jsonBody, to_account);
        } catch (OpenAPIException e) {
            e.printStackTrace();
        }
    }

}
