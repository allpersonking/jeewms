<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!-- <h4>分类标题</h4> -->
	    <div class="row">
	      <div class="col-md-12 layout-header">
<!-- 	        <button id="addBtn_WmImNoticeI" type="button" class="btn btn-default">添加</button> -->
<!-- 	        <button id="delBtn_WmImNoticeI" type="button" class="btn btn-default">删除</button> -->
	        <button id="sum_WmImNoticeI" type="button" class="btn btn-default">合计</button>
	        <script type="text/javascript"> 
	        
// 			$('#addBtn_WmImNoticeI').bind('click', function(){   
// 		 		 var tr =  $("#add_wmImNoticeI_table_template tr").clone();
// 			 	 $("#add_wmImNoticeI_table").append(tr);
// 			 	 resetTrNum('add_wmImNoticeI_table');
// 			 	 return false;
// 		    });  
			$('#delBtn_WmImNoticeI').bind('click', function(){   
		       $("#add_wmImNoticeI_table").find("input:checked").parent().parent().remove();   
		        resetTrNum('add_wmImNoticeI_table');
		        return false;
		    });
			$('#sum_WmImNoticeI').bind('click', function(){   
				trList = $("#add_wmImNoticeI_table").children("tr");

				 var heji = 0;
				 var dh = 0;
				 for (var i=0;i<trList.length;i++) {
				        var tdArr = trList.eq(i).find("td");
				 
				        var history_income_remark = tdArr.eq(2).find('input').val();//    合计
				        dh = history_income_remark;
			             heji = heji*1 + dh*1;
				    }
				 alert("合计"+heji);

			    });
		    $(document).ready(function(){
		    	if(location.href.indexOf("load=detail")!=-1){
					$(":input").attr("disabled","true");
					$(".datagrid-toolbar").hide();
				}
		    	resetTrNum('add_wmImNoticeI_table');
		    });
		
		</script>

	      </div>
	    </div>

<div style="margin: 0 15px; background-color: white;">    
	    <!-- Table -->
      <table id="wmImNoticeI_table" class="table table-bordered table-hover" style="margin-bottom: 0;">
		<thead>
	      <tr>
	        <th style="white-space:nowrap;width:50px;">序号</th>
	        <th style="white-space:nowrap;width:50px;">操作</th>
					  <th>
							商品编码 
					  </th>
					  <th>
							数量
					  </th>
<!-- 					  	<th> -->
<!-- 							单位 -->
<!-- 					  </th> -->
<!-- 					  <th> -->
<!-- 							生产日期 -->
<!-- 					  </th> -->
					  <th>
							收货完成
					  </th>
<!-- 					  <th> -->
<!-- 							单位 -->
<!-- 					  </th> -->
	      </tr>
	    </thead>
        
	<tbody id="add_wmImNoticeI_table">	
	<c:if test="${fn:length(wmImNoticeIList)  <= 0 }">
			<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[0].goodsCode"  name="wmImNoticeIList[0].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[0].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[0].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"  >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[0].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[1].goodsCode"  name="wmImNoticeIList[1].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[1].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[1].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"  >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[1].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[2].goodsCode"  name="wmImNoticeIList[2].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[2].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[2].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[2].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[3].goodsCode"  name="wmImNoticeIList[3].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[3].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[3].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[3].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[4].goodsCode"  name="wmImNoticeIList[4].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[4].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[4].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"  >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[4].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[5].goodsCode"  name="wmImNoticeIList[5].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[5].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[5].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[5].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[6].goodsCode"  name="wmImNoticeIList[6].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[6].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[6].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[6].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[7].goodsCode"  name="wmImNoticeIList[7].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[7].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[7].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[7].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[8].goodsCode"  name="wmImNoticeIList[8].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[8].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[8].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[8].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[9].goodsCode"  name="wmImNoticeIList[9].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[9].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[9].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[9].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[10].goodsCode"  name="wmImNoticeIList[10].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[10].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[10].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"  >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[10].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[11].goodsCode"  name="wmImNoticeIList[11].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[11].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[11].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[11].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[12].goodsCode"  name="wmImNoticeIList[12].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[12].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[12].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[12].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[13].goodsCode"  name="wmImNoticeIList[13].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[13].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[13].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[13].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[14].goodsCode"  name="wmImNoticeIList[14].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[14].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[14].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[14].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[15].goodsCode"  name="wmImNoticeIList[15].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[15].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[15].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[15].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[16].goodsCode"  name="wmImNoticeIList[16].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[16].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[16].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[16].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[17].goodsCode"  name="wmImNoticeIList[17].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[17].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[17].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[17].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[18].goodsCode"  name="wmImNoticeIList[18].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[18].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[18].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[18].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[19].goodsCode"  name="wmImNoticeIList[19].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[19].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[19].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[19].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   			   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[20].goodsCode"  name="wmImNoticeIList[20].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[20].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[20].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[20].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>
   				   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>

				  <td>
					   	<input id="wmImNoticeIList[21].goodsCode"  name="wmImNoticeIList[21].goodsCode"    maxlength="32" 
							  		type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[21].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
					</td>
						
				  <td>
					  	<input name="wmImNoticeIList[21].goodsCount" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;text-align: right"   >
					  <label class="Validform_label" style="display: none;">数量</label>
					
					</td>

				  <td>
							<t:dictSelect field="wmImNoticeIList[21].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
					</td>

   			</tr>

		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[22].goodsCode"  name="wmImNoticeIList[22].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[22].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[22].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[22].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[23].goodsCode"  name="wmImNoticeIList[23].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[23].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[23].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[23].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>

		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[24].goodsCode"  name="wmImNoticeIList[24].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[24].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[24].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[24].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[25].goodsCode"  name="wmImNoticeIList[25].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[25].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[25].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[25].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[26].goodsCode"  name="wmImNoticeIList[26].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[26].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[26].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[26].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>

		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[27].goodsCode"  name="wmImNoticeIList[27].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[27].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[27].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[27].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[28].goodsCode"  name="wmImNoticeIList[28].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[28].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[28].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[28].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>

		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[29].goodsCode"  name="wmImNoticeIList[29].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[29].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[29].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[29].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[30].goodsCode"  name="wmImNoticeIList[30].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[30].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[30].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[30].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[31].goodsCode"  name="wmImNoticeIList[31].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[31].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[31].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[31].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[32].goodsCode"  name="wmImNoticeIList[32].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[32].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[32].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[32].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[33].goodsCode"  name="wmImNoticeIList[33].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[33].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[33].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[33].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[34].goodsCode"  name="wmImNoticeIList[34].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[34].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[34].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[34].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[35].goodsCode"  name="wmImNoticeIList[35].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[35].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[35].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[35].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[36].goodsCode"  name="wmImNoticeIList[36].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[36].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[36].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[36].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[37].goodsCode"  name="wmImNoticeIList[37].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[37].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[37].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[37].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[38].goodsCode"  name="wmImNoticeIList[38].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[38].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[38].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[38].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[39].goodsCode"  name="wmImNoticeIList[39].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[39].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[39].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[39].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[40].goodsCode"  name="wmImNoticeIList[40].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[40].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[40].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[40].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[41].goodsCode"  name="wmImNoticeIList[41].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[41].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[41].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[41].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[42].goodsCode"  name="wmImNoticeIList[42].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[42].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[42].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[42].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[43].goodsCode"  name="wmImNoticeIList[43].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[43].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[43].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[43].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[44].goodsCode"  name="wmImNoticeIList[44].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[44].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[44].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[44].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[45].goodsCode"  name="wmImNoticeIList[45].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[45].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[45].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[45].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[46].goodsCode"  name="wmImNoticeIList[46].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[46].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[46].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[46].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[47].goodsCode"  name="wmImNoticeIList[47].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[47].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[47].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[47].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[48].goodsCode"  name="wmImNoticeIList[48].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[48].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[48].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[48].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[49].goodsCode"  name="wmImNoticeIList[49].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[49].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[49].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[49].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[50].goodsCode"  name="wmImNoticeIList[50].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[50].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[50].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[50].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[51].goodsCode"  name="wmImNoticeIList[51].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[51].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[51].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[51].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[52].goodsCode"  name="wmImNoticeIList[52].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[52].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[52].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[52].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[53].goodsCode"  name="wmImNoticeIList[53].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[53].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[53].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[53].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[54].goodsCode"  name="wmImNoticeIList[54].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[54].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[54].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[54].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>
		<tr>
			<th scope="row"><div name="xh"></div></th>
			<td><input style="width:20px;" type="checkbox" name="ck"/></td>

			<td>
				<input id="wmImNoticeIList[55].goodsCode"  name="wmImNoticeIList[55].goodsCode"    maxlength="32"
					   type="text"    style="width:420px;text-align: left" >
				<t:choose  hiddenName="wmImNoticeIList[55].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="460" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
			</td>

			<td>
				<input name="wmImNoticeIList[55].goodsCount" maxlength="32"
					   type="text" class="form-control"  style="width:120px;text-align: right"   >
				<label class="Validform_label" style="display: none;">数量</label>

			</td>

			<td>
				<t:dictSelect field="wmImNoticeIList[55].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"
							  typeGroupCode="sf_yn" defaultVal="N" hasLabel="false"  title="收货完成"></t:dictSelect>
				<label class="Validform_label" style="display: none;">收货完成</label>
			</td>

		</tr>

	</c:if>
	<c:if test="${fn:length(wmImNoticeIList)  > 0 }">
		<c:forEach items="${wmImNoticeIList}" var="poVal" varStatus="stuts">
			<tr>
				<th scope="row"><div name="xh">${stuts.index+1 }</div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
					<input name="wmImNoticeIList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
					<input name="wmImNoticeIList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
					<input name="wmImNoticeIList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
					<input name="wmImNoticeIList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
					<input name="wmImNoticeIList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
					<input name="wmImNoticeIList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
					<input name="wmImNoticeIList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
					<input name="wmImNoticeIList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
					<input name="wmImNoticeIList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
					<input name="wmImNoticeIList[${stuts.index }].imNoticeId" type="hidden" value="${poVal.imNoticeId }"/>
					<input name="wmImNoticeIList[${stuts.index }].imNoticeItem" type="hidden" value="${poVal.imNoticeItem }"/>
					<input name="wmImNoticeIList[${stuts.index }].goodsBatch" type="hidden" value="${poVal.goodsBatch }"/>
					<input name="wmImNoticeIList[${stuts.index }].goodsFvol" type="hidden" value="${poVal.goodsFvol }"/>
					<input name="wmImNoticeIList[${stuts.index }].goodsWeight" type="hidden" value="${poVal.goodsWeight }"/>
					<input name="wmImNoticeIList[${stuts.index }].binPlan" type="hidden" value="${poVal.binPlan }"/>
					<input name="wmImNoticeIList[${stuts.index }].goodsQmCount" type="hidden" value="${poVal.goodsQmCount }"/>
					<input name="wmImNoticeIList[${stuts.index }].goodsWqmCount" type="hidden" value="${poVal.goodsWqmCount }"/>
					<input name="wmImNoticeIList[${stuts.index }].baseUnit" type="hidden" value="${poVal.baseUnit }"/>
					<input name="wmImNoticeIList[${stuts.index }].baseGoodscount" type="hidden" value="${poVal.baseGoodscount }"/>

				<input name="wmImNoticeIList[${stuts.index }].goodsCode" type="hidden" value="${poVal.goodsCode }"/>

			<%-- 					<input name="wmImNoticeIList[${stuts.index }].goodsUnit" type="hidden" value="${poVal.goodsUnit }"/> --%>
				   <td align="left">


					   <input id="wmOmNoticeIList[${stuts.index }].goodsName"    value="${poVal.goodsName }" readonly="readonly"  name="wmOmNoticeIList[${stuts.index }].goodsName" maxlength="32"
							  ignore="ignore"
							  type="text"    style="width:420px;text-align: left" >

							<%--<t:dictSelect field="wmImNoticeIList[${stuts.index }].goodsCode" type="list" extendJson="{class:'form-control',style:'width:350px'}"  --%>
								<%--dictCondition="${wmImNoticeHPage.wherecon}"				dictTable="mv_goods" dictField="goods_code" dictText="goods_name" defaultVal="${poVal.goodsCode }" hasLabel="false"  title="商品编码"></t:dictSelect>      --%>
					  <label class="Validform_label" style="display: none;">商品编码</label>
<%-- 				   	<input id="wmImNoticeIList[${stuts.index }].goodsCode"  name="wmImNoticeIList[${stuts.index }].goodsCode"    maxlength="32"  --%>
									   
<%-- 						value="${poVal.goodsCode }"	  		type="text"    style="width:420px;text-align: left" > --%>
				  
<%-- 				  				<t:choose  hiddenName="wmImNoticeIList[${stuts.index }].goodsCode" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="900"  height="610" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose> --%>
				  
				  
				   </td>
				   <td align="left">
					  	<input name="wmImNoticeIList[${stuts.index }].goodsCount" maxlength="32"  datatype="*"  
					  		type="text" class="form-control"  style="width:120px;text-align: right"  value="${poVal.goodsCount }">
					  <label class="Validform_label" style="display: none;">数量</label>
				   </td>
				   
<!-- 				   				   <td align="left"> -->
<%-- 							<t:dictSelect field="wmImNoticeIList[${stuts.index }].goodsUnit" type="list" extendJson="{class:'form-control',style:'width:250px'}"   --%>
<%-- 											dictTable="ba_unit" dictField="unit_code" dictText="unit_zh_name" defaultVal="${poVal.goodsUnit }" hasLabel="false"  title="单位"></t:dictSelect>      --%>
<!-- 					  <label class="Validform_label" style="display: none;">单位</label> -->
<!-- 				   </td> -->
				   
<!-- 				   <td align="left"> -->
<%-- 							<input name="wmImNoticeIList[${stuts.index }].goodsPrdData" maxlength="32"  --%>
<%-- 					  		type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"    value="<fmt:formatDate value='${poVal.goodsPrdData}' type="date" pattern="yyyy-MM-dd"/>"> --%>
<!-- 					  <label class="Validform_label" style="display: none;">生产日期</label> -->
<!-- 				   </td> -->
				   <td align="left">
							<t:dictSelect field="wmImNoticeIList[${stuts.index }].binPre" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${poVal.binPre }" hasLabel="false"  title="收货完成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">收货完成</label>
				   </td>
<!-- 				   <td align="left"> -->
<%-- 					  	<input name="wmImNoticeIList[${stuts.index }].goodsUnit" maxlength="32"  --%>
<%-- 					  		type="text" class="form-control"  style="width:120px;"  value="${poVal.goodsUnit }"> --%>
<!-- 					  <label class="Validform_label" style="display: none;">单位</label> -->
<!-- 				   </td> -->
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
