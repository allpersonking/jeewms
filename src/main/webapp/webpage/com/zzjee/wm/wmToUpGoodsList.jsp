<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="wmToUpGoodsList" checkbox="true" pagination="true" fitColumns="false" title="上架列表" actionUrl="wmToUpGoodsController.do?datagrid" idField="id" fit="true" queryMode="group">
    <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="创建人登录名称"  field="createBy"   query="true" queryMode="single"  width="120"></t:dgCol>
    <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd"  query="true" queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="更新人登录名称"  field="updateBy"    queryMode="single"  width="120"></t:dgCol>
    <t:dgCol title="更新日期"  field="updateDate" formatter="yyyy-MM-dd"   queryMode="single"  width="120"></t:dgCol>
    <t:dgCol title="所属部门"  field="sysOrgCode"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="所属公司"  field="sysCompanyCode"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="商品编码"  field="goodsId"   query="true" queryMode="single"  width="100"></t:dgCol>
      <t:dgCol title="商品名称"  field="goodsName"   query="true" queryMode="single"  width="100"></t:dgCol>
      <t:dgCol title="数量"  field="goodsQua"    queryMode="group"  width="60"></t:dgCol>
    <t:dgCol title="原始单据类型"  field="orderTypeCode"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="原始单据编码"  field="orderId"   query="true" queryMode="single"  width="80"></t:dgCol>
    <t:dgCol title="原始单据行项目"  field="orderIdI"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="上架ID"  field="wmToUpId"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="单位"  field="goodsUnit"    queryMode="group"  width="60"></t:dgCol>
    <t:dgCol title="批次"  field="goodsBatch"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="生产日期"  field="goodsProData"    queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="作业类型"  field="actTypeCode"  hidden="true"  queryMode="group"  width="120"></t:dgCol>
    <t:dgCol title="库位编码"  field="kuWeiBianMa"   query="true" queryMode="single"  width="60"></t:dgCol>
    <t:dgCol title="托盘码"  field="binId"   query="true" queryMode="single"  width="60"></t:dgCol>
    <t:dgCol title="货主"  field="cusCode"   query="true" dictionary="mv_cus,cus_code,cus_name" queryMode="single"  width="60"></t:dgCol>
    <t:dgCol title="基本单位"  field="baseUnit"    queryMode="group"  width="60"></t:dgCol>
    <t:dgCol title="基本单位数量"  field="baseGoodscount"    queryMode="group"  width="80"></t:dgCol>
<%--    <t:dgCol title="操作" field="opt" width="100"></t:dgCol> --%>
<%--    <t:dgDelOpt title="删除" url="wmToUpGoodsController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/> --%>
   <t:dgToolBar title="录入" icon="icon-add" url="wmToUpGoodsController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="wmToUpGoodsController.do?goUpdate" funname="update"></t:dgToolBar>
<%--    <t:dgToolBar title="批量删除"  icon="icon-remove" url="wmToUpGoodsController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar> --%>
   <t:dgToolBar title="查看" icon="icon-search" url="wmToUpGoodsController.do?goUpdate" funname="detail"></t:dgToolBar>
    <t:dgToolBar title="导入库存" icon="icon-put" funname="ImportXls"></t:dgToolBar>
    <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
    <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/com/zzjee/wm/wmToUpGoodsList.js"></script>		
 <script type="text/javascript">
 $(document).ready(function(){
 });
 
   
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'wmToUpGoodsController.do?upload', "wmToUpGoodsList");
}

//导出
function ExportXls() {
	JeecgExcelExport("wmToUpGoodsController.do?exportXls","wmToUpGoodsList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("wmToUpGoodsController.do?exportXlsByT","wmToUpGoodsList");
}

 </script>