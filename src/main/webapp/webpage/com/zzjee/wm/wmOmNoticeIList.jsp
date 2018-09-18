<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<!-- <h4>分类标题</h4> -->
	    <div class="row">
	      <div class="col-md-12 layout-header">
<!-- 	        <button id="addBtn_WmOmNoticeI" type="button" class="btn btn-default">添加</button> -->
<!-- 	        <button id="delBtn_WmOmNoticeI" type="button" class="btn btn-default">删除</button> -->
	        <button id="sum_WmOmNoticeI" type="button" class="btn btn-default">合计和检查</button>
	        <script type="text/javascript"> 
			$('#addBtn_WmOmNoticeI').bind('click', function(){   
		 		 var tr =  $("#add_wmOmNoticeI_table_template tr").clone();
			 	 $("#add_wmOmNoticeI_table").append(tr);
			 	 resetTrNum('add_wmOmNoticeI_table');
			 	 return false;
		    });  
			$('#delBtn_WmOmNoticeI').bind('click', function(){   
		       $("#add_wmOmNoticeI_table").find("input:checked").parent().parent().remove();   
		        resetTrNum('add_wmOmNoticeI_table');
		        return false;
		    });
			$('#sum_WmOmNoticeI').bind('click', function(){   
				trList = $("#add_wmOmNoticeI_table").children("tr");

				 var heji = 0;
				 var dh = 0;
				 var msghe = "";
				 for (var i=0;i<trList.length;i++) {
				        var tdArr = trList.eq(i).find("td");
				        var goods_code
				        var strs= new Array(); //定义一数组 
				        try{
				        	strs= tdArr.eq(1).find('input').val().split('-');//    合计
						    goods_code = strs[0];
				        }catch(err){
				        	goods_code = tdArr.eq(1).find('input').val();
				        }
				      if(goods_code!=""){
				    	  
				      
				        var dh1 = tdArr.eq(2).find('input').val();//    合计
						var url = "wmOmNoticeHController.do?docheck&goodscode="+goods_code+"&goodsqua="+dh1;
						$.ajax({
							async : false,
							cache : false,
							type : 'POST',
							url : url,// 请求的action路径
							error : function() {// 请求失败处理函数
							},
							success : function(data) {
								 var d = $.parseJSON(data);
								if (d.success) {
   
								}else{		
									msghe = msghe +"/" + d.msg;
								}	
							}
						});
				        dh = dh1;
			             heji = heji*1 + dh*1;
				      }
				    }
				 
				 alert(msghe+"    合计:"+heji);

			    });
		    $(document).ready(function(){
		    	if(location.href.indexOf("load=detail")!=-1){
					$(":input").attr("disabled","true");
					$(".datagrid-toolbar").hide();
				}
		    	resetTrNum('add_wmOmNoticeI_table');
		    });
		</script>
	      </div>
	    </div>
<div style="margin: 0 15px; background-color: white;">    
	    <!-- Table -->
      <table id="wmOmNoticeI_table" class="table table-bordered table-hover" style="margin-bottom: 0;">
		<thead>
	      <tr>
	        <th style="white-space:nowrap;width:50px;">序号</th>
	        <th style="white-space:nowrap;width:50px;">操作</th>
					  <th>
							出货商品
					  </th>
					  <th>
							出货数量
					  </th>
<!-- 					  <th> -->
<!-- 							已经出货数量 -->
<!-- 					  </th> -->
<!-- 					  <th> -->
<!-- 							生产日期 -->
<!-- 					  </th> -->
					  <th>
							下架任务是否已生成
					  </th>
					  <th>
						  出货托盘
					  </th>
			  <th>
				  生产日期
			  </th>
	      </tr>
	    </thead>
        
	<tbody id="add_wmOmNoticeI_table">	
	<c:if test="${fn:length(wmOmNoticeIList)  <= 0 }">
			<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[0].goodsId"  name="wmOmNoticeIList[0].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[0].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[0].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[0].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
				<td>
					<input name="wmOmNoticeIList[0].binId" maxlength="32"
						   type="text" class="form-control"  style="width:120px;" >
					<label class="Validform_label" style="display: none;">出货托盘</label>
				</td>
				<td align="left">
					<input name="wmOmNoticeIList[0].goodsProData" maxlength="32"
						   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
					<label class="Validform_label" style="display: none;">生产日期</label>
				</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[1].goodsId"  name="wmOmNoticeIList[1].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[1].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[1].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[1].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[1].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[1].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[2].goodsId"  name="wmOmNoticeIList[2].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[2].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[2].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[2].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[2].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[2].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[3].goodsId"  name="wmOmNoticeIList[3].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[3].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[3].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[3].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[3].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[3].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[4].goodsId"  name="wmOmNoticeIList[4].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[4].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[4].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[4].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[4].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[4].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[5].goodsId"  name="wmOmNoticeIList[5].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[5].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[5].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[5].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[5].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[5].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[6].goodsId"  name="wmOmNoticeIList[6].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[6].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[6].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[6].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[6].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[6].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[7].goodsId"  name="wmOmNoticeIList[7].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[7].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[7].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[7].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[7].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[7].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[8].goodsId"  name="wmOmNoticeIList[8].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[8].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[8].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[8].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[8].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[8].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[9].goodsId"  name="wmOmNoticeIList[9].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[9].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[9].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[9].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[9].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[9].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[10].goodsId"  name="wmOmNoticeIList[10].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[10].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[10].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[10].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[10].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[10].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[11].goodsId"  name="wmOmNoticeIList[11].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[11].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[11].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[11].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[11].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[11].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[12].goodsId"  name="wmOmNoticeIList[12].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[12].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[12].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[12].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[12].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[12].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[13].goodsId"  name="wmOmNoticeIList[13].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[13].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[13].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[13].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[13].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[13].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[14].goodsId"  name="wmOmNoticeIList[14].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[14].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[14].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[14].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[14].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[14].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[15].goodsId"  name="wmOmNoticeIList[15].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[15].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[15].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[15].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[15].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[15].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[16].goodsId"  name="wmOmNoticeIList[16].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[16].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[16].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[16].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[16].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[16].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[17].goodsId"  name="wmOmNoticeIList[17].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[17].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[17].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[17].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[17].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[17].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[18].goodsId"  name="wmOmNoticeIList[18].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[18].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[18].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[18].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[18].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[18].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[19].goodsId"  name="wmOmNoticeIList[19].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[19].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[19].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[19].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[19].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[19].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[20].goodsId"  name="wmOmNoticeIList[20].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[20].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[20].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[20].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[20].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[20].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   						<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td>
							  			  	<input id="wmOmNoticeIList[21].goodsId"  name="wmOmNoticeIList[21].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
							  <t:choose  hiddenName="wmOmNoticeIList[21].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>
							  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				  <td>
					  	<input name="wmOmNoticeIList[21].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
									  <td>
							<t:dictSelect field="wmOmNoticeIList[21].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
							<td>
								<input name="wmOmNoticeIList[21].binId" maxlength="32"
									   type="text" class="form-control"  style="width:120px;" >
								<label class="Validform_label" style="display: none;">出货托盘</label>
							</td>
							<td align="left">
								<input name="wmOmNoticeIList[21].goodsProData" maxlength="32"
									   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
								<label class="Validform_label" style="display: none;">生产日期</label>
							</td>
   			</tr>
   			
   			<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[22].goodsId"  name="wmOmNoticeIList[22].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[22].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[22].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[22].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
				<td>
					<input name="wmOmNoticeIList[22].binId" maxlength="32"
						   type="text" class="form-control"  style="width:120px;" >
					<label class="Validform_label" style="display: none;">出货托盘</label>
				</td>
				<td align="left">
					<input name="wmOmNoticeIList[22].goodsProData" maxlength="32"
						   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
					<label class="Validform_label" style="display: none;">生产日期</label>
				</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[23].goodsId"  name="wmOmNoticeIList[23].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[23].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[23].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[23].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[23].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[23].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
   		<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[24].goodsId"  name="wmOmNoticeIList[24].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[24].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[24].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[24].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
			<td>
				<input name="wmOmNoticeIList[24].binId" maxlength="32"
					   type="text" class="form-control"  style="width:120px;" >
				<label class="Validform_label" style="display: none;">出货托盘</label>
			</td>
			<td align="left">
				<input name="wmOmNoticeIList[24].goodsProData" maxlength="32"
					   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
				<label class="Validform_label" style="display: none;">生产日期</label>
			</td>
</tr>	
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[25].goodsId"  name="wmOmNoticeIList[25].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[25].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[25].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[25].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[25].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[25].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[26].goodsId"  name="wmOmNoticeIList[26].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[26].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[26].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[26].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[26].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[26].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[27].goodsId"  name="wmOmNoticeIList[27].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[27].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[27].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[27].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[27].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[27].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[28].goodsId"  name="wmOmNoticeIList[28].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[28].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[28].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[28].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[28].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[28].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[29].goodsId"  name="wmOmNoticeIList[29].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[29].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[29].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[29].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[29].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[29].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[30].goodsId"  name="wmOmNoticeIList[30].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[30].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[30].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[30].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[30].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[30].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[31].goodsId"  name="wmOmNoticeIList[31].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[31].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[31].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[31].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[31].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[31].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[32].goodsId"  name="wmOmNoticeIList[32].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[32].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[32].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[32].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[32].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[32].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[33].goodsId"  name="wmOmNoticeIList[33].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[33].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[33].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[33].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[33].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[33].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[34].goodsId"  name="wmOmNoticeIList[34].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[34].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[34].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[34].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[34].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[34].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[35].goodsId"  name="wmOmNoticeIList[35].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[35].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[35].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[35].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[35].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[35].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[36].goodsId"  name="wmOmNoticeIList[36].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[36].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[36].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[36].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[36].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[36].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[37].goodsId"  name="wmOmNoticeIList[37].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[37].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[37].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[37].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[37].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[37].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[38].goodsId"  name="wmOmNoticeIList[38].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[38].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[38].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[38].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[38].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[38].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[39].goodsId"  name="wmOmNoticeIList[39].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[39].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[39].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[39].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[39].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[39].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[40].goodsId"  name="wmOmNoticeIList[40].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[40].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[40].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[40].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[40].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[40].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[41].goodsId"  name="wmOmNoticeIList[41].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[41].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[41].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[41].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[41].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[41].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[42].goodsId"  name="wmOmNoticeIList[42].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[42].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[42].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[42].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[42].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[42].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[43].goodsId"  name="wmOmNoticeIList[43].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[43].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[43].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[43].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[43].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[43].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[44].goodsId"  name="wmOmNoticeIList[44].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[44].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[44].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[44].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[44].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[44].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[45].goodsId"  name="wmOmNoticeIList[45].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[45].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[45].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[45].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[45].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[45].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[46].goodsId"  name="wmOmNoticeIList[46].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[46].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[46].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[46].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[46].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[46].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[47].goodsId"  name="wmOmNoticeIList[47].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[47].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[47].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[47].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[47].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[47].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[48].goodsId"  name="wmOmNoticeIList[48].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[48].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[48].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[48].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[48].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>
	<td align="left">
		<input name="wmOmNoticeIList[48].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
<tr>
				<th scope="row"><div name="xh"></div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
				   <td>
					<input id="wmOmNoticeIList[49].goodsId"  name="wmOmNoticeIList[49].goodsId" maxlength="32" 
									ignore="ignore"  
							  		type="text"    style="width:420px;text-align: left" >
					<t:choose  hiddenName="wmOmNoticeIList[49].goodsId" hiddenid="goodsName" url="mvGoodsController.do?list" name="mvGoodsList" width="600"  height="410" icon="icon-search" title="选择" textname="goodsName"  isInit="true"></t:choose>	  
					  <label class="Validform_label" style="display: none;">出货商品</label>
					</td>
				        <td>
					  	<input name="wmOmNoticeIList[49].goodsQua" maxlength="32" 
					  		type="text" class="form-control"  style="width:120px;" >
					  <label class="Validform_label" style="display: none;">出货数量</label>
					</td>
					<td>
							<t:dictSelect field="wmOmNoticeIList[49].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${wmOmNoticeHPage.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
	<td>
		<input name="wmOmNoticeIList[49].binId" maxlength="32"
			   type="text" class="form-control"  style="width:120px;" >
		<label class="Validform_label" style="display: none;">出货托盘</label>
	</td>

	<td align="left">
		<input name="wmOmNoticeIList[49].goodsProData" maxlength="32"
			   type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"     >
		<label class="Validform_label" style="display: none;">生产日期</label>
	</td>
</tr>
   			
	</c:if>
	<c:if test="${fn:length(wmOmNoticeIList)  > 0 }">
		<c:forEach items="${wmOmNoticeIList}" var="poVal" varStatus="stuts">
			<tr>
				<th scope="row"><div name="xh">${stuts.index+1 }</div></th>
				<td><input style="width:20px;" type="checkbox" name="ck"/></td>
					<input name="wmOmNoticeIList[${stuts.index }].id" type="hidden" value="${poVal.id }"/>
					<input name="wmOmNoticeIList[${stuts.index }].createName" type="hidden" value="${poVal.createName }"/>
					<input name="wmOmNoticeIList[${stuts.index }].createBy" type="hidden" value="${poVal.createBy }"/>
					<input name="wmOmNoticeIList[${stuts.index }].createDate" type="hidden" value="${poVal.createDate }"/>
					<input name="wmOmNoticeIList[${stuts.index }].updateName" type="hidden" value="${poVal.updateName }"/>
					<input name="wmOmNoticeIList[${stuts.index }].updateBy" type="hidden" value="${poVal.updateBy }"/>
					<input name="wmOmNoticeIList[${stuts.index }].updateDate" type="hidden" value="${poVal.updateDate }"/>
					<input name="wmOmNoticeIList[${stuts.index }].sysOrgCode" type="hidden" value="${poVal.sysOrgCode }"/>
					<input name="wmOmNoticeIList[${stuts.index }].sysCompanyCode" type="hidden" value="${poVal.sysCompanyCode }"/>
					<input name="wmOmNoticeIList[${stuts.index }].omNoticeId" type="hidden" value="${poVal.omNoticeId }"/>
					<input name="wmOmNoticeIList[${stuts.index }].goodsBatch" type="hidden" value="${poVal.goodsBatch }"/>
					<input name="wmOmNoticeIList[${stuts.index }].goodsUnit" type="hidden" value="${poVal.goodsUnit }"/>
					<input name="wmOmNoticeIList[${stuts.index }].goodsQuaok" type="hidden" value="${poVal.goodsQuaok }"/>
					
					<input name="wmOmNoticeIList[${stuts.index }].cusCode" type="hidden" value="${poVal.cusCode }"/>
					<input name="wmOmNoticeIList[${stuts.index }].waveId" type="hidden" value="${poVal.waveId }"/>
					<input name="wmOmNoticeIList[${stuts.index }].omSta" type="hidden" value="${poVal.omSta }"/>
					<input name="wmOmNoticeIList[${stuts.index }].baseUnit" type="hidden" value="${poVal.baseUnit }"/>
					<input name="wmOmNoticeIList[${stuts.index }].baseGoodscount" type="hidden" value="${poVal.baseGoodscount }"/>
				   <input name="wmOmNoticeIList[${stuts.index }].goodsId" type="hidden" value="${poVal.goodsId }"/>


					<%--
wmOmNoticeIList[${stuts.index }].goodsId<input name="wmOmNoticeIList[${stuts.index }].planSta" type="hidden" value="${poVal.planSta }"/> --%>

					
				   <td align="left">


					   <input id="wmOmNoticeIList[${stuts.index }].goodsName" value="${poVal.goodsName }" readonly="readonly"  name="wmOmNoticeIList[${stuts.index }].goodsName" maxlength="32"
							  ignore="ignore"
							  type="text"    style="width:420px;text-align: left" >
<%-- 					  	<input name="wmOmNoticeIList[${stuts.index }].goodsId" maxlength="32"  --%>
<%-- 					  		type="text" class="form-control"  style="width:120px;"  value="${poVal.goodsId }"> --%>
					  		<%--<t:dictSelect field="wmOmNoticeIList[${stuts.index }].goodsId" type="list" extendJson="{class:'form-control',style:'width:350px'}"--%>
														<%--dictTable="mv_goods" dictField="goods_code" dictText="goods_name" defaultVal="${poVal.goodsId }" hasLabel="false"  title="商品编码"></t:dictSelect>--%>
					  		
					  <label class="Validform_label" style="display: none;">出货商品</label>
				   </td>
				   <td align="left">
					  	<input name="wmOmNoticeIList[${stuts.index }].goodsQua" maxlength="32"
					  		type="text" class="form-control"  style="width:120px;"  value="${poVal.goodsQua }">
					  <label class="Validform_label" style="display: none;">出货数量</label>
				   </td>
				   <td>
							<t:dictSelect field="wmOmNoticeIList[${stuts.index }].planSta" type="radio" extendJson="{class:'form-control',style:'width:150px'}"  
										typeGroupCode="sf_yn" defaultVal="${poVal.planSta}" hasLabel="false"  title="下架任务是否已生成"></t:dictSelect>     
					  <label class="Validform_label" style="display: none;">下架任务是否已生成</label>
					</td>
				<td align="left">
					<input name="wmOmNoticeIList[${stuts.index }].binId" maxlength="32"
						   type="text" class="form-control"  style="width:120px;"  value="${poVal.binId }">
					<label class="Validform_label" style="display: none;">出货托盘</label>
				</td>
<!-- 				   <td align="left"> -->
<%-- 					  	<input name="wmOmNoticeIList[${stuts.index }].goodsQuaok" maxlength="32"  --%>
<%-- 					  		type="text" class="form-control"  style="width:120px;"   value="${poVal.goodsQuaok }"> --%>
<!-- 					  <label class="Validform_label" style="display: none;">已经出货数量</label> -->
<!-- 				   </td> -->
				   <td align="left">
							<input name="wmOmNoticeIList[${stuts.index }].goodsProData" maxlength="32"
					  		type="text" class="form-control" onClick="WdatePicker()"  style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;width:160px;"    value="<fmt:formatDate value='${poVal.goodsProData}' type="date" pattern="yyyy-MM-dd"/>">
					  <label class="Validform_label" style="display: none;">生产日期</label>
				   </td>
<!-- 				   <td align="left"> -->
<%-- 					  	<input name="wmOmNoticeIList[${stuts.index }].binOm" maxlength="32"  --%>
<%-- 					  		type="text" class="form-control"  style="width:120px;"  value="${poVal.binOm }"> --%>
<!-- 					  <label class="Validform_label" style="display: none;">出货托盘</label> -->
<!-- 				   </td> -->
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
