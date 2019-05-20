package com.zzjee.wmutil.sql;

import org.jeecgframework.core.util.StringUtil;

import java.util.Map;

public class wmsqlUtil {
    public String queryReSalePlanComDifList(Map params){
        String sql ="SELECT RP.*,ROW_NUMBER() over (ORDER BY RP.X13,RP.X2,RP.X3,RP.X4,X12,X15,X17) as ROWNUM \n" +
                "\t  FROM RE_SALE_PLAN_COMPARE_DIF RP\n" +
                "\t WHERE 1=1 \n";
        sql = sqlUtils.getBatchAndEqual(sql, "RP.X3,RP.X4,RP.X15,RP.X12,RP.X13",
                "area,pq,cn,salefw,years", params);
        sql = sqlUtils.getBatchIn(sql, "RP.X3,RP.X4,RP.X12,RP.X15", "areaList,pqList,fws,cnList", params);
        sql = sqlUtils.getBatchAndLike(sql,"RP.X15","x15",params);

        return sql;
    }
}
