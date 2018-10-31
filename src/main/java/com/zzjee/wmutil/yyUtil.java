package com.zzjee.wmutil;

import com.alibaba.fastjson.JSONObject;
import com.xiaoleilu.hutool.http.HttpUtil;
import com.zzjee.ba.entity.BaGoodsTypeEntity;
import com.zzjee.ba.entity.BaUnitEntity;
import com.zzjee.md.entity.MdGoodsEntity;
import com.zzjee.md.entity.MdSupEntity;
import com.zzjee.md.entity.MvGoodsEntity;
import com.zzjee.wm.entity.WmImNoticeHEntity;
import com.zzjee.wm.entity.WmImNoticeIEntity;
import com.zzjee.wm.service.WmImNoticeHServiceI;
import com.zzjee.yongyoubase.openapi4j.exception.OpenAPIException;
import com.zzjee.yongyoubase.openapi4j.service.*;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.jeecgframework.core.util.*;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.util.DigestUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.charset.Charset;
import java.util.*;

public class yyUtil {
    /**
     * User: caoez
     * Date: 18-09-01
     * Time: 下午2:07
     */

    public static void    getProduct() {

        String dbKey=  ResourceUtil.getConfigByName("yydbkey");
        List<Map<String, Object>> result=null;
        List<Map<String, Object>> resultdw=null;
        List<Map<String, Object>> resultgt=null;
        String querySql = "select * from Inventory";
        Map queryparams =  new LinkedHashMap<String,Object>();
        SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);


        if(StringUtils.isNotBlank(dbKey)) {
            result = DynamicDBUtil.findList(dbKey, SqlUtil.jeecgCreatePageSql(dbKey, querySql, queryparams, 1, 1000000));
        }


        querySql = "select * from ComputationUnit";

        if(StringUtils.isNotBlank(dbKey)) {
            resultdw = DynamicDBUtil.findList(dbKey, SqlUtil.jeecgCreatePageSql(dbKey, querySql, queryparams, 1, 1000000));
        }

        querySql = "select * from InventoryClass";
        if(StringUtils.isNotBlank(dbKey)) {
            resultgt = DynamicDBUtil.findList(dbKey, SqlUtil.jeecgCreatePageSql(dbKey, querySql, queryparams, 1, 1000000));
        }
        if (resultgt!=null&&resultgt.size()>0) {
            for (int i = 0; i < resultgt.size(); i++) {
                Map<String, Object> prodbo = resultgt.get(i);
                BaGoodsTypeEntity mdn = new BaGoodsTypeEntity();
                mdn.setGoodsTypeCode(prodbo.get("cInvCCode").toString());
                mdn.setGoodsTypeName(prodbo.get("cInvCName").toString());
                try {
                    BaGoodsTypeEntity bagoodsType = systemService.findUniqueByProperty(
                            BaGoodsTypeEntity.class, "goodsTypeCode", mdn.getGoodsTypeCode());
                    if(bagoodsType==null){
                        bagoodsType = new BaGoodsTypeEntity();
                        MyBeanUtils.copyBeanNotNull2Bean(mdn,bagoodsType);
                        systemService.save(bagoodsType);
                    }else{
                        MyBeanUtils.copyBeanNotNull2Bean(mdn,bagoodsType);
                        systemService.updateEntitie(bagoodsType);
                    }
                }catch (Exception e){
                }
            }
        }


        if (resultdw!=null&&resultdw.size()>0) {
            for (int i = 0; i < resultdw.size(); i++) {
                Map<String, Object> prodbo = resultdw.get(i);
                BaUnitEntity mdn = new BaUnitEntity();
                mdn.setUnitCode(prodbo.get("cComunitCode").toString());
                mdn.setUnitZhName(prodbo.get("cComUnitName").toString());
                try {
                    BaUnitEntity baunit = systemService.findUniqueByProperty(
                            BaUnitEntity.class, "unitCode", mdn.getUnitCode());
                    if(baunit==null){
                        baunit = new BaUnitEntity();
                        MyBeanUtils.copyBeanNotNull2Bean(mdn,baunit);
                        systemService.save(baunit);
                    }else{
                        MyBeanUtils.copyBeanNotNull2Bean(mdn,baunit);
                        systemService.updateEntitie(baunit);
                    }
                }catch (Exception e){
                }
            }
        }
        if (result!=null&&result.size()>0){
            for(int i = 0;i<result.size();i++){
                Map<String, Object> prodbo = result.get(i);
                String ShpBianMa =  prodbo.get("cInvCode").toString();
                MdGoodsEntity mdn = new MdGoodsEntity();
                mdn.setShpBianMa(ShpBianMa);
                mdn.setChlShl("1");
                mdn.setSuoShuKeHu("hwm");
                mdn.setShpMingCheng(prodbo.get("cInvName").toString());
                mdn.setBzhiQi("360");
                mdn.setChpShuXing(prodbo.get("cInvCCode").toString());
//                mdn.setChpShuXing("其他");
                mdn.setJshDanWei(prodbo.get("cComUnitCode").toString());
                BaUnitEntity baunit = systemService.findUniqueByProperty(
                        BaUnitEntity.class, "unitCode", mdn.getJshDanWei());
                if (baunit !=null){
                    mdn.setJshDanWei(baunit.getUnitZhName());
                    mdn.setShlDanWei(baunit.getUnitZhName());
                }

                try {
                    mdn.setShpTiaoMa(prodbo.get("cBarCode").toString());

                }catch (Exception e){
                }
                mdn.setCfWenCeng("低温");
                mdn.setJiZhunwendu("1");
                mdn.setTiJiCm("1");
                mdn.setZhlKg("1");
                mdn.setChlKongZhi("N");
                mdn.setJfShpLei("10");
                mdn.setMpCengGao("99");
                mdn.setMpDanCeng("99");

            try {
                MdGoodsEntity mdGoods = systemService.findUniqueByProperty(
                        MdGoodsEntity.class, "shpBianMa", ShpBianMa);
                if(mdGoods==null){
                    mdGoods = new MdGoodsEntity();
                    MyBeanUtils.copyBeanNotNull2Bean(mdn,mdGoods);
                    systemService.save(mdGoods);
                }else{
                    MyBeanUtils.copyBeanNotNull2Bean(mdn,mdGoods);
                    systemService.updateEntitie(mdGoods);
                }
            }catch (Exception e){
            }
            }
        }
    }
    public static  void  getPo(String indate) {
//        PO_Pomain  采购订单主表
//        PO_Podetails  采购订单子表
        String dbKey=  ResourceUtil.getConfigByName("yydbkey");
        List<Map<String, Object>> result=null;
        List<Map<String, Object>> resultdetail=null;
        String querySql = "select * from PO_Pomain where dpodate = '"+indate+"'";
        Map queryparams =  new LinkedHashMap<String,Object>();

        SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);
        WmImNoticeHServiceI wmImNoticeHService =ApplicationContextUtil.getContext().getBean(WmImNoticeHServiceI.class);

        if(StringUtils.isNotBlank(dbKey)) {
            result = DynamicDBUtil.findList(dbKey, SqlUtil.jeecgCreatePageSql(dbKey, querySql, queryparams, 1, 1000000));
        }
        if (result!=null&&result.size()>0) {
            for (int i = 0; i < result.size(); i++) {
                Map<String, Object> prodbo = result.get(i);
                String poid =  prodbo.get("poid").toString();

                if (StringUtil.isNotEmpty(poid)) {
                    WmImNoticeHEntity wmimh = systemService.findUniqueByProperty(WmImNoticeHEntity.class, "imCusCode", poid);
                    if (wmimh == null) {
                        WmImNoticeHEntity wmImNoticeH = new WmImNoticeHEntity();
                        List<WmImNoticeIEntity> wmImNoticeIListnew = new ArrayList<WmImNoticeIEntity>();

                        wmImNoticeH.setOrderTypeCode("01");
                        String noticeid = yyUtil.getNextNoticeid(wmImNoticeH.getOrderTypeCode());

                        wmImNoticeH.setCusCode(ResourceUtil.getConfigByName("yy.cuscode"));
                        wmImNoticeH.setNoticeId(noticeid);
//                        wmImNoticeH.setPlatformCode(Integer.toString(billResult.getData().get(s).getPiId()));
//                        wmImNoticeH.setPiClass(billResult.getData().get(s).getPiClass());
//                        wmImNoticeH.setPiMaster(master);
//                        wmImNoticeH.setSupCode(billResult.getData().get(s).getPiCardcode());
//                        MdSupEntity mdsup = systemService.findUniqueByProperty(MdSupEntity.class, "gysBianMa", wmImNoticeH.getSupCode());
//                        if (mdsup != null) {
//                            wmImNoticeH.setSupName(mdsup.getZhongWenQch());
//                        }
                        try{
                            wmImNoticeH.setImBeizhu(prodbo.get("cMemo").toString());
                        }catch (Exception e){

                        }
                        wmImNoticeH.setImCusCode(poid);
                        String querySqldetail = "select * from PO_Podetails where poid = '"+poid+"'";
                        if (resultdetail!=null){
                            resultdetail.clear();
                        }
                        resultdetail = DynamicDBUtil.findList(dbKey, SqlUtil.jeecgCreatePageSql(dbKey, querySqldetail, queryparams, 1, 1000000));

                        for (int k = 0; k < resultdetail.size(); k++) {
                            WmImNoticeIEntity wmi = new WmImNoticeIEntity();
                            Map<String, Object> proddet = resultdetail.get(k);
                            wmi.setGoodsCode(proddet.get("cInvCode").toString());
                            MvGoodsEntity mvgoods = systemService.findUniqueByProperty(
                                    MvGoodsEntity.class, "goodsCode", wmi.getGoodsCode());
                            if (mvgoods != null) {
                                wmi.setGoodsName(mvgoods.getGoodsName());
                                wmi.setGoodsUnit(mvgoods.getShlDanWei());
                            }
                            wmi.setGoodsCount(Double.toString(new BigDecimal(proddet.get("iQuantity").toString()).setScale(2, RoundingMode.UP).doubleValue()));
//                               wmi.setGoodsPrdData(billResult.getData().get(s).getDetail().get(k).getPdProdmadedate2User());
//                            wmi.setOtherId();
                            wmImNoticeIListnew.add(wmi);
                        }
                        wmImNoticeHService.addMain(wmImNoticeH, wmImNoticeIListnew);
                    }
                } else {
                    continue;
                }
            }
            }
    }


    private  static  String getNextNoticeid(String orderType){
        String noticeid=null;
        SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);

        Map<String, Object> countMap = systemService
                .findOneForJdbc("SELECT count(*)+1 as count FROM wm_im_notice_h  t where  TO_DAYS(t.create_date) = TO_DAYS(NOW());");
        if (StringUtil.isEmpty(orderType)){
            orderType = "01";
        }
        if (countMap != null) {
            if(orderType.equals("03")){
                noticeid = "TH"
                        + DateUtils.date2Str(new Date(), DateUtils.yyyyMMdd)
                        + "-"
                        + StringUtil.leftPad(
                        ((Long) countMap.get("count")).intValue(), 4,
                        '0');
            }else if(orderType.equals("01")){
                noticeid = "RK"
                        + DateUtils.date2Str(new Date(), DateUtils.yyyyMMdd)
                        + "-"
                        + StringUtil.leftPad(
                        ((Long) countMap.get("count")).intValue(), 4,
                        '0');
            }else if(orderType.equals("04")){
                noticeid = "YK"
                        + DateUtils.date2Str(new Date(), DateUtils.yyyyMMdd)
                        + "-"
                        + StringUtil.leftPad(
                        ((Long) countMap.get("count")).intValue(), 4,
                        '0');
            }else if(orderType.equals("09")){
                noticeid = "QT"
                        + DateUtils.date2Str(new Date(), DateUtils.yyyyMMdd)
                        + "-"
                        + StringUtil.leftPad(
                        ((Long) countMap.get("count")).intValue(), 4,
                        '0');
            }

        }
        return  noticeid;
    }


    private static String getNextomNoticeId(String orderType){
        SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);
        Map<String, Object> countMap = systemService
                .findOneForJdbc("SELECT count(*)+1 as count FROM wm_om_notice_h  t where  TO_DAYS(t.create_date) = TO_DAYS(NOW());");
        String noticeid = null;
        if (StringUtil.isEmpty(orderType)){
            orderType = "11";
        }
        if(orderType.equals("19")){
            noticeid = "QT"
                    + DateUtils.date2Str(new Date(), DateUtils.yyyyMMdd)
                    + "-"
                    + StringUtil.leftPad(
                    ((Long) countMap.get("count")).intValue(), 4,
                    '0');
        }else {
            noticeid = "CK"
                    + DateUtils.date2Str(new Date(), DateUtils.yyyyMMdd)
                    + "-"
                    + StringUtil.leftPad(
                    ((Long) countMap.get("count")).intValue(), 4,
                    '0');
        }
        return  noticeid;
    }
    public static  void getSdvl(String indate) {
//  /        PO_Pomain  采购订单主表
//        PO_Podetails  采购订单子表
        String dbKey=  ResourceUtil.getConfigByName("yydbkey");
        List<Map<String, Object>> result=null;
        List<Map<String, Object>> resultdetail=null;
        String querySql = "select * from PO_Pomain where dpodate = '"+indate+"'";
        Map queryparams =  new LinkedHashMap<String,Object>();

        SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);
        WmImNoticeHServiceI wmImNoticeHService =ApplicationContextUtil.getContext().getBean(WmImNoticeHServiceI.class);

        if(StringUtils.isNotBlank(dbKey)) {
            result = DynamicDBUtil.findList(dbKey, SqlUtil.jeecgCreatePageSql(dbKey, querySql, queryparams, 1, 1000000));
        }
        if (result!=null&&result.size()>0) {
            for (int i = 0; i < result.size(); i++) {
                Map<String, Object> prodbo = result.get(i);
                String poid =  prodbo.get("poid").toString();

                if (StringUtil.isNotEmpty(poid)) {
                    WmImNoticeHEntity wmimh = systemService.findUniqueByProperty(WmImNoticeHEntity.class, "imCusCode", poid);
                    if (wmimh == null) {
                        WmImNoticeHEntity wmImNoticeH = new WmImNoticeHEntity();
                        List<WmImNoticeIEntity> wmImNoticeIListnew = new ArrayList<WmImNoticeIEntity>();

                        wmImNoticeH.setOrderTypeCode("01");
                        String noticeid = yyUtil.getNextNoticeid(wmImNoticeH.getOrderTypeCode());

                        wmImNoticeH.setCusCode(ResourceUtil.getConfigByName("yy.cuscode"));
                        wmImNoticeH.setNoticeId(noticeid);
//                        wmImNoticeH.setPlatformCode(Integer.toString(billResult.getData().get(s).getPiId()));
//                        wmImNoticeH.setPiClass(billResult.getData().get(s).getPiClass());
//                        wmImNoticeH.setPiMaster(master);
//                        wmImNoticeH.setSupCode(billResult.getData().get(s).getPiCardcode());
//                        MdSupEntity mdsup = systemService.findUniqueByProperty(MdSupEntity.class, "gysBianMa", wmImNoticeH.getSupCode());
//                        if (mdsup != null) {
//                            wmImNoticeH.setSupName(mdsup.getZhongWenQch());
//                        }
                        wmImNoticeH.setImCusCode(poid);
                        String querySqldetail = "select * from PO_Podetails where poid = '"+poid+"'";
                        resultdetail = DynamicDBUtil.findList(dbKey, SqlUtil.jeecgCreatePageSql(dbKey, querySqldetail, queryparams, 1, 1000000));

                        for (int k = 0; k < resultdetail.size(); k++) {
                            WmImNoticeIEntity wmi = new WmImNoticeIEntity();
                            Map<String, Object> proddet = result.get(i);
                            wmi.setGoodsCode(proddet.get("cInvCode").toString());
                            MvGoodsEntity mvgoods = systemService.findUniqueByProperty(
                                    MvGoodsEntity.class, "goodsCode", wmi.getGoodsCode());
                            if (mvgoods != null) {
                                wmi.setGoodsName(mvgoods.getGoodsName());
                                wmi.setGoodsUnit(mvgoods.getShlDanWei());
                            }
                            wmi.setGoodsCount(proddet.get("iQuantity").toString());
//                               wmi.setGoodsPrdData(billResult.getData().get(s).getDetail().get(k).getPdProdmadedate2User());
//                            wmi.setOtherId();
                            wmImNoticeIListnew.add(wmi);
                        }
                        wmImNoticeHService.addMain(wmImNoticeH, wmImNoticeIListnew);
                    }
                } else {
                    continue;
                }
            }
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
