package com.zzjee.wmutil;

import com.zzjee.md.entity.MdGoodsEntity;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.system.pojo.base.TSIcon;
import org.jeecgframework.web.system.pojo.base.TSRole;
import org.jeecgframework.web.system.pojo.base.TSRoleUser;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.sms.service.TSSmsSqlServiceI;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.StringUtil;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * User: caoez
 * Date: 13-7-26
 * Time: 下午2:07
 */


public class wmUtil {

	public   static   List  removeDuplicate(List list)  {
		for  ( int  i  =   0 ; i  <  list.size()  -   1 ; i ++ )  {
			for  ( int  j  =  list.size()  -   1 ; j  >  i; j -- )  {
				if  (list.get(j).equals(list.get(i)))  {
					list.remove(j);
				}
			}
		}
		return list;
	}
//通过客户商品编码，或者WMS商品编码和单位找到WMS编码
	public static Map<String,String> getGoodsId(String cusgoodsid,String goodsUnit){
		Map<String,String> resultmap = new HashMap<>();
		String goodsCode= null;
		String cusCode= null;
		SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);
		String  tsql = "select cus_code,chailing, goods_id,goods_code,shp_bian_makh,shl_dan_wei,baseunit" +
				" from  mv_goods where goods_id = ? or shp_bian_makh = ? order by chailing desc";
		List<Map<String, Object>> result=  systemService.findForJdbc(tsql, cusgoodsid,cusgoodsid);
		if(result.size() > 0) {
          try{
          	for(int i = 0; i < result.size(); i++){
				if(goodsUnit.equals(result.get(i).get("baseunit").toString())){
					goodsCode = result.get(i).get("goods_code").toString();
					cusCode = result.get(i).get("cus_code").toString();
					resultmap.put("goodsCode",goodsCode);
					resultmap.put("cusCode",cusCode);
					break;
				}
				if(goodsUnit.equals(result.get(i).get("shl_dan_wei").toString())){
					goodsCode = result.get(i).get("goods_id").toString();
					cusCode = result.get(i).get("cus_code").toString();
					resultmap.put("goodsCode",goodsCode);
					resultmap.put("cusCode",cusCode);
					break;
				}

			}

		  }catch (Exception e){

		  }
		}
		return resultmap;
	}

	public static String getCusCode(){
		SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);
		String cusCode = "";
		try{
			TSUser user = ResourceUtil.getSessionUserName();
			String roles = "";
			if (user != null) {
				List<TSRoleUser> rUsers = systemService.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
				for (TSRoleUser ru : rUsers) {
					TSRole role = ru.getTSRole();
					roles += role.getRoleCode() + ",";
				}
				if (roles.length() > 0) {
					roles = roles.substring(0, roles.length() - 1);
				}
				if(roles.equals("CUS")){
					cusCode =  user.getUserName();

				}
			}
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		return  cusCode;
	}





	public static String gettuopanma(){
		String tuopanma = "";
		if(ResourceUtil.getConfigByName("usetuopan").equals("no")){
			try{
				if (StringUtil.isNotEmpty(ResourceUtil.getConfigByName("tuopanma"))){
					tuopanma = ResourceUtil.getConfigByName("tuopanma");
				}else{
					tuopanma = DateUtils.getDataString(DateUtils.yyyymmddhhmmss);
				}
			}catch (Exception e){

			}

		}
 		 return tuopanma;
	}
    /**
     * 删除指定文件夹下所有文件
     * @param
     * @return
     */
    public static boolean checkstcok(String binid,String tinid,String goodsid,String prodate,String basecount) {
        boolean flag = false;
        try {
			String goods = null;
			if(!StringUtil.isEmpty(goodsid)){
				if(goodsid.endsWith("l")){
					goods = goodsid.substring(0,goodsid.length() - 1);
					System.out.print("11111111I"+goods);
				}else{
					goods = goodsid;
					System.out.print("22222"+goods);

				}

			}
			SystemService systemService =ApplicationContextUtil.getContext().getBean(SystemService.class);
			String  tsql = "select ws.base_unit,ws.zhong_wen_qch, ws.ku_wei_bian_ma,ws.bin_id,ws.shp_ming_cheng,cast(sum(ws.base_goodscount) as signed) as goods_qua, mb.qu_huo_ci_xu, ws.goods_pro_data"
					+ "  from wv_stock ws, md_bin mb  where "
					+ "   ws.ku_wei_bian_ma = mb.ku_wei_bian_ma and mb.ting_yong <> 'Y' and (ws.kuctype = '库存' or ws.kuctype = '待下架')"
					+ "   and ws.ku_wei_bian_ma = ? "
					+ "   and ws.bin_id =  ? "
					+ "   and ws.goods_id =  ? "
					+ "   and ws.goods_pro_data =  ? "
					+ "   group by ws.ku_wei_bian_ma,ws.bin_id,ws.goods_id,mb.qu_huo_ci_xu, ws.goods_pro_data order by ws.goods_pro_data , ws.goods_qua ,mb.qu_huo_ci_xu,ws.create_date desc";
			List<Map<String, Object>> result=  systemService.findForJdbc(tsql, binid,tinid,goods,prodate);
			if(result.size() > 0) {
				if(Long.parseLong(result.get(0).get("goods_qua").toString())>=Long.parseLong(basecount)){
					flag = true;
				}
			}
		}catch (Exception e){

		}

       return flag;
    }
    
    public static boolean checkstcoka(String binid,String tinid,String goodsid,String prodate,String basecount) {
        boolean flag = false;
		try {
			String goods = null;
			if (!StringUtil.isEmpty(goodsid)) {
				if (goodsid.endsWith("l")) {
					goods = goodsid.substring(0, goodsid.length() - 1);
					System.out.print("11111111I" + goods);
				} else {
					goods = goodsid;
					System.out.print("22222" + goods);

				}

			}
			SystemService systemService = ApplicationContextUtil.getContext().getBean(SystemService.class);
			String tsql = "select ws.base_unit,ws.zhong_wen_qch, ws.ku_wei_bian_ma,ws.bin_id,ws.shp_ming_cheng,cast(sum(ws.base_goodscount) as signed) as goods_qua, mb.qu_huo_ci_xu, ws.goods_pro_data"
					+ "  from wv_stock ws, md_bin mb  where "
					+ "   ws.ku_wei_bian_ma = mb.ku_wei_bian_ma and mb.ting_yong <> 'Y' and (ws.kuctype = '库存' )"
					+ "   and ws.ku_wei_bian_ma = ? "
					+ "   and ws.bin_id =  ? "
					+ "   and ws.goods_id =  ? "
					+ "   and ws.goods_pro_data =  ? "
					+ "   group by ws.ku_wei_bian_ma,ws.bin_id,ws.goods_id,mb.qu_huo_ci_xu, ws.goods_pro_data order by ws.goods_pro_data , ws.goods_qua ,mb.qu_huo_ci_xu,ws.create_date desc";

			List<Map<String, Object>> result = systemService.findForJdbc(tsql, binid, tinid, goods, prodate);
			if (result.size() > 0) {
				if (Long.parseLong(result.get(0).get("goods_qua").toString()) >= Long.parseLong(basecount)) {
					flag = true;
				}

			}
		}catch (Exception e){

		}
       return flag;
    }


    public  static String getscrp(){
		if("no".equals(ResourceUtil.getConfigByName("scrqon"))){
			if(StringUtil.isNotEmpty(ResourceUtil.getConfigByName("scrq"))){
				return  ResourceUtil.getConfigByName("scrq");
			}else {
				return null;
			}
		}else {
			return null;
		}
	}

	public  static String getmdgoodsbytiaoma(String tiaoma){
        if("yes".equals(ResourceUtil.getConfigByName("sptmon"))){
            try{
                SystemService systemService = ApplicationContextUtil.getContext().getBean(SystemService.class);
                MdGoodsEntity t = systemService.findByProperty(MdGoodsEntity.class,"shpTiaoMa",tiaoma).get(0);
                return t.getShpBianMa();
            }catch (Exception e){
                return  null;
            }
        }else{
            return  null;
        }
    }
	public static boolean checkstcokk(String cuscode,String binid,String tinid,String goodsid,String prodate,String basecount) {
		boolean flag = false;
		try {
			String goods = null;
			if (!StringUtil.isEmpty(goodsid)) {
				if (goodsid.endsWith("l")) {
					goods = goodsid.substring(0, goodsid.length() - 1);
					System.out.print("11111111I" + goods);
				} else {
					goods = goodsid;
					System.out.print("22222" + goods);

				}

			}
			SystemService systemService = ApplicationContextUtil.getContext().getBean(SystemService.class);
			String tsql = "select ws.base_unit,ws.zhong_wen_qch, ws.ku_wei_bian_ma,ws.bin_id,ws.shp_ming_cheng,cast(sum(ws.base_goodscount) as signed) as goods_qua, mb.qu_huo_ci_xu, ws.goods_pro_data"
					+ "  from wv_stock ws, md_bin mb  where "
					+ "   ws.ku_wei_bian_ma = mb.ku_wei_bian_ma and mb.ting_yong <> 'Y' and (ws.kuctype = '库存' )"
					+ "   and ws.ku_wei_bian_ma = ? "
					+ "   and ws.bin_id =  ? "
					+ "   and ws.goods_id =  ? "
					+ "   and ws.goods_pro_data =  ? "
					+ "   and ws.cus_code = ?   "
					+ "   group by ws.ku_wei_bian_ma,ws.bin_id,ws.goods_id,mb.qu_huo_ci_xu, ws.goods_pro_data order by ws.goods_pro_data , ws.goods_qua ,mb.qu_huo_ci_xu,ws.create_date desc";

			List<Map<String, Object>> result = systemService.findForJdbc(tsql, binid, tinid, goods, prodate,cuscode);
			if (result.size() > 0) {
				if (Long.parseLong(result.get(0).get("goods_qua").toString()) >= Long.parseLong(basecount)) {
					flag = true;
				}

			}
		}catch (Exception e){

		}
		return flag;
	}

}
