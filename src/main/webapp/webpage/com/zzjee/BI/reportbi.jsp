<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- context path -->
<t:base type="jquery,easyui"></t:base>
<script type="text/javascript" src="plug-in/Highcharts-2.2.5/js/highcharts.src.js"></script>
<script type="text/javascript" src="plug-in/Highcharts-2.2.5/js/modules/exporting.src.js"></script>
	<%--<%@include file="/webpage/mobile/mobile_head.jsp" %>--%>
	<link rel="stylesheet" href="mobile/fonts/themify/themify.css">
	<link rel="stylesheet" href="mobile/css/home.css">
	<link rel="stylesheet" href="mobile/css/custom-mobile.css">
	<link rel="stylesheet" href="mobile/css/examples/pages/home/ecommerce.css">
	<link rel="stylesheet" href="mobile/themes/classic/global/css/bootstrap.css">
	<link rel="stylesheet" href="mobile/themes/classic/base/css/site.css" id="admui-siteStyle">

	<!-- 图标 CSS-->
	<link rel="stylesheet" href="mobile/fonts/font-awesome/font-awesome.css">
	<link rel="stylesheet" href="mobile/fonts/web-icons/web-icons.css">

	<!-- 插件 CSS -->
	<link rel="stylesheet" href="mobile/vendor/animsition/animsition.css">
	<link rel="stylesheet" href="mobile/vendor/toastr/toastr.css">
	<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
	<script type="text/javascript">
        $(function() {
            $(document).ready(function() {
                var chart;
                $.ajax({
                    type : "POST",
                    url : "tKpOrderOneController.do?monthCount&reportType=line",
                    success : function(jsondata) {
                        data = eval(jsondata);
                        var xAxisCategories = new Array();

                        for(var i = 0; i < data[0].data.length; i++){
                            xAxisCategories[i] = data[0].data[i].name;
                        }
                        chart = new Highcharts.Chart({
                            chart : {
                                renderTo : 'containerline',
                                plotBackgroundColor : null,
                                plotBorderWidth : null,
                                plotShadow : false
                            },
                            title : {
                                text : '近一年产品销售额'
                            },
                            xAxis : {
                                categories : xAxisCategories
                            },
                            tooltip : {
                                shadow: false,
                                percentageDecimals : 0,
                                formatter: function() {
                                    return  '<b>'+this.point.name + '</b>:' +  Highcharts.numberFormat(this.y, 0) ;
                                }

                            },
                            exporting:{
                                filename:'pie',
                                url:'${ctxPath}/jeecgListDemoController.do?export'
                            },
                            plotOptions : {
                                pie : {
                                    allowPointSelect : true,
                                    cursor : 'pointer',
                                    showInLegend : true,
                                    dataLabels : {
                                        enabled : true,
                                        color : '#000000',
                                        connectorColor : '#000000',
                                        formatter : function() {
                                            return '<b>' + this.point.name + '</b>: ' + Highcharts.numberFormat(this.percentage, 1)+"%";
                                        }
                                    }
                                }
                            },
                            series : data
                        });
                    }
                });
            });
        });
	</script>
	<script type="text/javascript">
        $(function() {
            $(document).ready(function() {
                var chart;
                $.ajax({
                    type : "POST",
                    url : "tKpOrderOneController.do?dayCount&reportType=line",
                    success : function(jsondata) {
                        data = eval(jsondata);
                        var xAxisCategories = new Array();

                        for(var i = 0; i < data[0].data.length; i++){
                            xAxisCategories[i] = data[0].data[i].name;
                        }
                        chart = new Highcharts.Chart({
                            chart : {
                                renderTo : 'containerdayline',
                                plotBackgroundColor : null,
                                plotBorderWidth : null,
                                plotShadow : false
                            },
                            title : {
                                text : '近七日销售额'
                            },
                            xAxis : {
                                categories : xAxisCategories
                            },
                            tooltip : {
                                shadow: false,
                                percentageDecimals : 0,
                                formatter: function() {
                                    return  '<b>'+this.point.name + '</b>:' +  Highcharts.numberFormat(this.y, 0) ;
                                }

                            },
                            exporting:{
                                filename:'pie',
                                url:'${ctxPath}/jeecgListDemoController.do?export'
                            },
                            plotOptions : {
                                pie : {
                                    allowPointSelect : true,
                                    cursor : 'pointer',
                                    showInLegend : true,
                                    dataLabels : {
                                        enabled : true,
                                        color : '#000000',
                                        connectorColor : '#000000',
                                        formatter : function() {
                                            return '<b>' + this.point.name + '</b>: ' + Highcharts.numberFormat(this.percentage, 1)+"%";
                                        }
                                    }
                                }
                            },
                            series : data
                        });
                    }
                });
            });
        });
	</script>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			var chart;
			$.ajax({
				type : "POST",
				url : "tKpOrderOneController.do?cusNameCount&reportType=column",
				success : function(jsondata) {
					data = eval(jsondata);
                    var xAxisCategories = new Array();

                    for(var i = 0; i < data[0].data.length; i++){
                        xAxisCategories[i] = data[0].data[i].name;
                    }
					//console.log(data);//Highcharts报表插件bug,IE8下不能出现该语句,否则报表不显示					

					chart = new Highcharts.Chart({
						chart : {
							renderTo : 'containerCol',
							plotBackgroundColor : null,
							plotBorderWidth : null,
							plotShadow : false
						},
						title : {
							text : '客户销售额'
						},
						xAxis : {

							categories :xAxisCategories

						},
						tooltip : {
							 percentageDecimals : 0,
							 formatter: function() {
            					return  '<b>'+this.point.name + '</b>:' +  Highcharts.numberFormat(this.y, 0);
         					}

						},
						exporting:{ 
			                filename:'column',  
			                url:'${ctxPath}/jeecgListDemoController.do?export'
			            },
						plotOptions : {
							column : {
								allowPointSelect : true,
								cursor : 'pointer',
								showInLegend : true,
								dataLabels : {
									enabled : true,
									color : '#000000',
									connectorColor : '#000000',
									formatter : function() {

										return  Highcharts.numberFormat(this.percentage, 1)+"%";

									}
								}
							}
						},

						series:data//,IE8不喜欢多余的逗号

					});
				}
			});
		});
	});
</script>


<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			var chart;
			$.ajax({
				type : "POST",
				url : "tKpOrderOneController.do?cpNameCount&reportType=pie",
				success : function(jsondata) {
					data = eval(jsondata);
                    var xAxisCategories = new Array();

                    for(var i = 0; i < data[0].data.length; i++){
                        xAxisCategories[i] = data[0].data[i].name;
                    }
					chart = new Highcharts.Chart({
						chart : {
							renderTo : 'containerPie',
							plotBackgroundColor : null,
							plotBorderWidth : null,
							plotShadow : false
						},
						title : {
							text : '产品销售额'
						},
						xAxis : {
							categories : xAxisCategories
						},
						tooltip : {
							shadow: false,
							percentageDecimals : 0,
							formatter: function() {
            					return  '<b>'+this.point.name + '</b>:' +  Highcharts.numberFormat(this.y, 0) ;
         					}

						},
						exporting:{  
			                filename:'pie',  
			                 url:'${ctxPath}/jeecgListDemoController.do?export'  
			            },  
						plotOptions : {
							pie : {
								allowPointSelect : true,
								cursor : 'pointer',
								showInLegend : true,
								dataLabels : {
									enabled : true,
									color : '#000000',
									connectorColor : '#000000',
									formatter : function() {
										return   Highcharts.numberFormat(this.percentage, 1)+"%";
									}
								}
							}
						},
						series : data
					});
				}
			});
		});
	});
</script>
</head>
<%--<div class="row">--%>
	<%--<div class="col-sm-4">--%>
	<%--</div>--%>
	<%--<div class="col-sm-4">--%>
	<%--</div>--%>
	<%--<div class="col-sm-4">--%>
	<%--</div>--%>
<%--</div>--%>
<%--<div class="row">--%>
	<%--<div class="col-sm-12">--%>
	<%--</div>--%>
	<%----%>
<%--</div>--%>

<span id="containerPie" style="float: left; width: 36%; height:350px;"></span>

<span id="containerdayline" style="float: left; width: 33%; height:350px;"></span>
<span id="containerCol" style="float: left; width: 30%;height:350px;"></span>
<!--update-begin--Author:xuelin  Date:20170804 for：TASK #2246 【IE兼容问题】两个报表，不兼容IE8，代码优化     固定高度,否则部分浏览器下(chrome,IE8),数据表不显示------------------- -->
<%--<div id="containerline" style="width: 99%; height: 240px;">--%>

<div style="width: 100%; height: 350px;background-color: #fffffc">

<!--update-end--Author:xuelin  Date:20170804 for：TASK #2246 【IE兼容问题】两个报表，不兼容IE8，代码优化     固定高度,否则部分浏览器下(chrome,IE8),数据表不显示------------------- -->
	<%--<t:datagrid name="tKpOrderOneListbi" pageSize="10" pagination="true"   sortName="id" sortOrder="desc"    title="销售明细" actionUrl="tKpOrderOneController.do?datagrid" idField="id" fitColumns="false" fit="true"  >--%>
		<%--<t:dgCol title="订单号"  field="id"  hidden="true"   queryMode="single"  width="100"></t:dgCol>--%>

		<%--<t:dgCol title="订单号"  field="by6"    queryMode="single"  width="100"></t:dgCol>--%>
		<%--<t:dgCol title="订单日期"  field="docDate"  formatter="yyyy-MM-dd"    queryMode="group"  width="80"></t:dgCol>--%>
		<%--<t:dgCol title="订单状态"  field="orStatus"   queryMode="single"  width="80"></t:dgCol>--%>
		<%--<t:dgCol title="订单类型"  field="orderType"   queryMode="single"  width="80"></t:dgCol>--%>
		<%--&lt;%&ndash;<t:dgCol title="客户编码"  field="cusCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>&ndash;%&gt;--%>
		<%--<t:dgCol title="客户名称"  field="cusName"   queryMode="single"  width="80"></t:dgCol>--%>
		<%--&lt;%&ndash;<t:dgCol title="客户类型"  field="cusType"  queryMode="single"  width="60"></t:dgCol>&ndash;%&gt;--%>
		<%--&lt;%&ndash;<t:dgCol title="工地编码"  field="gdCode"  hidden="true"  queryMode="single"  width="120"></t:dgCol>&ndash;%&gt;--%>
		<%--<t:dgCol title="工地名称"  field="gdName"    queryMode="single"  width="240"></t:dgCol>--%>
		<%--&lt;%&ndash;<t:dgCol title="产品编码"  field="cpCode"  hidden="true"  queryMode="single"  width="60"></t:dgCol>&ndash;%&gt;--%>
		<%--<t:dgCol title="产品名称"  field="cpName"     queryMode="single"    width="60"></t:dgCol>--%>
		<%--<t:dgCol title="规格"  field="cpGuige"  queryMode="single"  width="110"></t:dgCol>--%>
		<%--<t:dgCol title="等级"  field="cpDengji"    queryMode="single"  width="80"></t:dgCol>--%>
		<%--<t:dgCol title="单位"  field="cpJifei"  queryMode="single"  width="60"></t:dgCol>--%>
		<%--<t:dgCol title="方量"  field="orQty"  queryMode="single"  width="60"></t:dgCol>--%>
		<%--<t:dgCol title="单价"  field="cpJiage"  queryMode="single"  width="60"></t:dgCol>--%>
		<%--<t:dgCol title="总价值"  field="orAmount"   queryMode="single"  width="80"></t:dgCol>--%>
		<%--<t:dgCol title="备注"  field="orRemark"     queryMode="single"  width="120"></t:dgCol>--%>
		<%--&lt;%&ndash;<t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>&ndash;%&gt;--%>

	<%--</t:datagrid>--%>
	<table   width="100%" style="background-color: white">
		<tr style="height: 60px"> <td  style="font-size: 26px;text-align: center;" colspan="10"> </td></tr>
	</table>
	<div  style="background-color: white">

	<div class="col-lg-4 col-sm-4 col-xs-12">
		<div class="widget widget-shadow">
			<div class="widget-content bg-white padding-20">
				<button type="button" class="btn btn-floating btn-sm btn-warning">
					<i class="icon wb-graph-up"></i>
				</button>
				<span class="margin-left-15 font-weight-800">当年统计</span>
				<div class="content-text text-center margin-bottom-0">
					<%--<i class="text-danger icon wb-triangle-up font-size-20"> </i>--%>
					<%--<span class="font-size-30 font-weight-100">${dnyf}</span>--%>
					<%--<p class="blue-grey-400 font-weight-100 margin-0">当年累计应发</p>--%>
						<table   width="100%" style="background-color: white">

						<tr style="height: 35px">
						<td></td>
						<td style="font-size: 14px;text-align: right"    >
						加气
						</td>
						<td style="font-size: 14px;text-align: right"    >
						标砖
						</td>
						<td style="font-size: 14px;text-align: right"   >
						配套
						</td>
						</tr>

					<tr style="height: 35px">
						<td  style="font-size: 12px;text-align: center"   >
						数量
						</td>
						<td style="font-size: 12px;text-align: right"  >
						${year2}
						</td>
						<td style="font-size: 12px;text-align: right"  >
						${year1}
						</td>

						<td style="font-size: 12px;text-align: right"  >
						${year3}
						</td>

						</tr>

						<tr style="height: 35px">
						<td style="font-size: 14px;text-align: center"    >
						金额
						</td>
						<td  style="color:#F2A654;font-size: 14px;text-align: right" >
						${year5}

						</td>
						<td  style="color:#F2A654;font-size: 14px;text-align: right" >
						${year4}
						</td>

						<td style="color:#F2A654;font-size: 14px;text-align: right" >
						${year6}
							</tr>
						</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-sm-4 col-xs-12 info-panel">
		<div class="widget widget-shadow">
			<div class="widget-content bg-white padding-20">
				<button type="button" class="btn btn-floating btn-sm btn-danger">
					<i class="icon wb-calendar"></i>
				</button>
				<span class="margin-left-15 font-weight-800">当月统计</span>
				<div class="content-text text-center margin-bottom-0">
					<%--<i class="text-success icon wb-triangle-up font-size-20"> </i>--%>
					<%--<span class="font-size-30 font-weight-100">${dnsf}</span>--%>
					<%--<p class="blue-grey-400 font-weight-100 margin-0">当年累计实发</p>--%>

						<table   width="100%" style="background-color: white">

							<tr style="height: 35px">
								<td></td>
								<td style="font-size: 14px;text-align: right"    >
									加气
								</td>
								<td style="font-size: 14px;text-align: right"    >
									标砖
								</td>
								<td style="font-size: 14px;text-align: right"   >
									配套
								</td>
							</tr>

							<tr style="height: 35px">
								<td  style="font-size: 12px;text-align: center"   >
									数量
								</td>
								<td style="font-size: 12px;text-align: right"  >
									${month2}
								</td>
								<td style="font-size: 12px;text-align: right"  >
									${month1}
								</td>

								<td style="font-size: 12px;text-align: right"  >
									${month3}
								</td>

							</tr>


							<tr style="height: 35px">
								<td style="font-size: 14px;text-align: center"    >
									金额
								</td>
								<td  style="color:#F96868;font-size: 14px;text-align: right" >
									${month5}

								</td>
								<td  style="color:#F96868;font-size: 14px;text-align: right" >
									${month4}
								</td>

								<td style="color:#F96868;font-size: 14px;text-align: right" >
									${month6}
							</tr>
						</table>


				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-sm-4 col-xs-12 info-panel">
		<div class="widget widget-shadow">
			<div class="widget-content bg-white padding-20">
				<button type="button" class="btn btn-floating btn-sm btn-success">
					<i class="icon wb-time"></i>
				</button>
				<span class="margin-left-15 font-weight-800">当日统计</span>
				<div class="content-text text-center margin-bottom-0">
					<%--<i class="text-danger icon wb-triangle-up font-size-20"> </i>--%>
					<%--<span class="font-size-30 font-weight-100">${byyf}</span>--%>
					<%--<p class="blue-grey-400 font-weight-100 margin-0">应发工资总计</p>--%>
						<table   width="100%" style="background-color: white">

							<tr style="height: 35px">
								<td></td>
								<td style="font-size: 14px;text-align: right"    >
									加气
								</td>
								<td style="font-size: 14px;text-align: right"    >
									标砖
								</td>
								<td style="font-size: 14px;text-align: right"   >
									配套
								</td>
							</tr>

							<tr style="height: 35px">
								<td  style="font-size: 12px;text-align: center"   >
									数量
								</td>
								<td style="font-size: 12px;text-align: right"  >
									${day2}
								</td>
								<td style="font-size: 12px;text-align: right"  >
									${day1}
								</td>

								<td style="font-size: 12px;text-align: right"  >
									${day3}
								</td>




							</tr>


							<tr style="height: 35px">
								<td style="font-size: 14px;text-align: center"    >
									金额
								</td>
								<td  style="color:#46BE8A;font-size: 14px;text-align: right" >
									${day5}

								</td>
								<td  style="color:#46BE8A;font-size: 14px;text-align: right" >
									${day4}
								</td>

								<td style="color:#46BE8A;font-size: 14px;text-align: right" >
									${day6}
							</tr>
						</table>

				</div>
			</div>
		</div>
	</div>

		</div>


</div>
<script type="text/javascript">
	$(function(){
		$(document.body).css("width","99.3%");
        // $(document.body).css("height","120px");

    });
</script>
<!-- add-update--Author:jg_renjie  Date:20150613 for：页面自适应页面，不会出现左右滚动条 -->

</html>