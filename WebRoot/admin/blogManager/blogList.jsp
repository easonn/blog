<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="cn.ithought.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int i = 0;
	String defaultClass = "";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>搜索表单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath}/admin/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/admin/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/admin/assets/css/page-min.css" rel="stylesheet" type="text/css" />
<!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
<link href="${basePath}/admin/assets/css/prettify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
code {
	padding: 0px 4px;
	color: #d14;
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
}
</style>
<script type="text/javascript">
function del(id){
	$.ajax({
		url:"${basePath}/admin_essay/del/"+id,
		type:"POST",
		success:function(data){
			alert(data);
			$("#ess"+id).remove();
		}
	})
}
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<form id="searchForm" class="form-horizontal span24">
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">文章标题：</label>
						<div class="controls">
							<input type="text" class="control-text" name="id">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">文章标签：</label>
						<div class="controls">
							<input type="text" class="control-text" name="stuName">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">文章类型：</label>
						<div class="controls">
							<select name="" id="" name="sex">
								<option value="">心路历程</option>
								<option value="">学无止境</option>
								<option value="">精品收藏</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span9">
						<label class="control-label">收录时间：</label>
						<div class="controls">
							<input type="text" class=" calendar" name="startDate"><span>
								- </span><input name="endDate" type="text" class=" calendar">
						</div>
					</div>
					<div class="span3 offset2">
						<button type="button" id="btnSearch" class="button button-primary">搜索</button>
					</div>
				</div>
			</form>
		</div>
		<div class="search-grid-container">
			<div id="grid">
				<div
					class="bui-grid bui-simple-list bui-grid-width bui-grid-border bui-grid-strip"
					style="width: 1046px;" aria-disabled="false" aria-pressed="false">
					<div class="bui-grid-header-container">
						<div class="bui-grid-header" style="width: 1044px;"
							aria-disabled="false" aria-pressed="false">
							<table cellspacing="0" cellpadding="0" class="bui-grid-table">
								<thead>
									<tr>

										<th class="bui-grid-hd" style="width: 300px;"
											aria-disabled="false" aria-pressed="false"><div
												class="bui-grid-hd-inner">
												<span class="bui-grid-hd-title">博客标题</span><span
													class="bui-grid-sort-icon">&nbsp;</span>
											</div></th>
										<th class="bui-grid-hd" style="width: 100px;"
											aria-disabled="false" aria-pressed="false"><div
												class="bui-grid-hd-inner">
												<span class="bui-grid-hd-title">作者姓名</span><span
													class="bui-grid-sort-icon">&nbsp;</span>
											</div></th>
										<th class="bui-grid-hd" style="width: 100px;"
											aria-disabled="false" aria-pressed="false"><div
												class="bui-grid-hd-inner">
												<span class="bui-grid-hd-title">博客类型</span><span
													class="bui-grid-sort-icon">&nbsp;</span>
											</div></th>
										<th class="bui-grid-hd" style="width: 60px;"
											aria-disabled="false" aria-pressed="false"><div
												class="bui-grid-hd-inner">
												<span class="bui-grid-hd-title">博客标签</span><span
													class="bui-grid-sort-icon">&nbsp;</span>
											</div></th>
										<th class="bui-grid-hd" style="width: 100px;"
											aria-disabled="false" aria-pressed="false"><div
												class="bui-grid-hd-inner">
												<span class="bui-grid-hd-title">pv</span><span
													class="bui-grid-sort-icon">&nbsp;</span>
											</div></th>
										<th class="bui-grid-hd" style="width: 120px;"
											aria-disabled="false" aria-pressed="false"><div
												class="bui-grid-hd-inner">
												<span class="bui-grid-hd-title">发表时间</span><span
													class="bui-grid-sort-icon">&nbsp;</span>
											</div></th>
										<th class="bui-grid-hd" style="width: 200px;"
											aria-disabled="false" aria-pressed="false"><div
												class="bui-grid-hd-inner">
												<span class="bui-grid-hd-title">操作</span><span
													class="bui-grid-sort-icon">&nbsp;</span>
											</div></th>
										<th class="bui-grid-hd-empty bui-grid-hd"
											aria-disabled="false"><div class="bui-grid-hd-inner"></div></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="bui-grid-body" style="width: 1044px;">
						<table cellspacing="0" cellpadding="0" class="bui-grid-table"
							style="width: 1044px;">
							<tbody>
								<tr class="bui-grid-header-row">
									<td width="300" style="height: 0" class=" grid-td-col2"></td>
									<td width="100" style="height: 0" class=" grid-td-col3"></td>
									<td width="100" style="height: 0" class=" grid-td-col4"></td>
									<td width="60" style="height: 0" class=" grid-td-col5"></td>
									<td width="100" style="height: 0" class=" grid-td-col6"></td>
									<td width="120" style="height: 0" class=" grid-td-col1"></td>
									<td width="200" style="height: 0" class=" grid-td-col7"></td>
									<td class="bui-grid-cell bui-grid-cell-empty">&nbsp;</td>
								</tr>
								<c:forEach var="essay" items="${requestScope.essayList}">
								<%	i++;
								if(i%2==1){
									defaultClass = "bui-grid-row bui-grid-row-odd";
								}else{
									defaultClass = "bui-grid-row bui-grid-row-even";
								} %>
								<tr class="<%= defaultClass%>" id="ess${essay.essayId}">
									<td data-column-field="address" data-column-id="col6"
										class="  bui-grid-cell grid-td-col6"><div
											class="bui-grid-cell-inner">
											<span title="" class="bui-grid-cell-text ">${essay.title}</span>
										</div></td>
									<td data-column-field="name" data-column-id="col2"
										class="  bui-grid-cell grid-td-col2"><div
											class="bui-grid-cell-inner">
											<span title="" class="bui-grid-cell-text ">${essay.author}</span>
										</div></td>
									<td data-column-field="birthday" data-column-id="col3"
										class="  bui-grid-cell grid-td-col3"><div
											class="bui-grid-cell-inner">
											<span title="" class="bui-grid-cell-text ">${essay.typeName}</span>
										</div></td>
									<td data-column-field="sex" data-column-id="col4"
										class="  bui-grid-cell grid-td-col4"><div
											class="bui-grid-cell-inner">
											<span title="" class="bui-grid-cell-text "></span>
										</div></td>
									<td data-column-field="grade" data-column-id="col5"
										class="  bui-grid-cell grid-td-col5"><div
											class="bui-grid-cell-inner">
											<span title="" class="bui-grid-cell-text ">${essay.pageView}</span>
										</div></td>
									<td data-column-field="id" data-column-id="col1"
										class="  bui-grid-cell grid-td-col1"><div
											class="bui-grid-cell-inner">
											<span title="" class="bui-grid-cell-text "><span
												title="博客信息" data-href="detail/example.html"
												data-id="detail123" class="page-action grid-command">${essay.date}</span></span>
										</div></td>
									<td data-column-field="" data-column-id="col7"
										class="  bui-grid-cell grid-td-col7"><div
											class="bui-grid-cell-inner">
											<span title="" class="bui-grid-cell-text "><span
												title="编辑博客信息" data-href="form/example.html"
												data-id="edit123" class="page-action grid-command">打开编辑</span><span
												title="编辑博客信息" class="grid-command btn-edit">弹出编辑</span><span
												title="删除博客信息" class="grid-command btn-del" onclick="del(${essay.essayId})">删除</span></span>
										</div></td>
									<td class="bui-grid-cell bui-grid-cell-empty">&nbsp;</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bui-grid-bbar" style="">
						<div class="bui-bar" role="toolbar" id="bar2"
							aria-disabled="false">
							<ul class="bui-pagingbar bui-bar" role="toolbar" id="bar3"
								aria-disabled="false">
								<li
									class="bui-bar-item-button bui-bar-item bui-pb-first bui-inline-block bui-bar-item-button-disabled bui-bar-item-disabled"
									aria-disabled="true" id="first"><button
										class="bui-button-disabled" type="button" disabled="disabled">首
										页</button></li>
								<li
									class="bui-bar-item-button bui-bar-item bui-pb-prev bui-inline-block bui-bar-item-button-disabled bui-bar-item-disabled"
									aria-disabled="true" id="prev"><button
										class="bui-button-disabled" type="button" disabled="disabled">上一页</button></li>
								<li class="bui-bar-item-separator bui-bar-item bui-inline-block"
									aria-disabled="false" id="bar-item-separator1" role="separator"></li>
								<li class="bui-bar-item-text bui-bar-item bui-inline-block"
									aria-disabled="false" id="totalPage">共 2 页</li>
								<li class="bui-bar-item-text bui-bar-item bui-inline-block"
									aria-disabled="false" id="curPage">第 <input type="text"
									name="inputItem" value="1" size="20" class="bui-pb-page"
									autocomplete="off"> 页
								</li>
								<li
									class="bui-bar-item-button bui-bar-item bui-pb-skip bui-inline-block"
									aria-disabled="false" id="skip"><button class=""
										type="button">确定</button></li>
								<li class="bui-bar-item-separator bui-bar-item bui-inline-block"
									aria-disabled="false" id="bar-item-separator2" role="separator"></li>
								<li
									class="bui-bar-item-button bui-bar-item bui-pb-next bui-inline-block"
									aria-disabled="false" id="next"><button class=""
										type="button">下一页</button></li>
								<li
									class="bui-bar-item-button bui-bar-item bui-pb-last bui-inline-block"
									aria-disabled="false" id="last"><button class=""
										type="button">末 页</button></li>
								<li class="bui-bar-item-separator bui-bar-item bui-inline-block"
									aria-disabled="false" id="bar-item-separator3" role="separator"></li>
								<li class="bui-bar-item-text bui-bar-item bui-inline-block"
									aria-disabled="false" id="totalCount">共40条记录</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div id="content" class="hide">
		<form id="J_Form" class="form-horizontal"
			action="../data/edit.php?a=1">
			<input type="hidden" name="a" value="3">
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>博客标题</label>
					<div class="controls">
						<input name="name" type="text" data-rules="{required:true}"
							class="input-normal control-text">
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>博客标签</label>
					<div class="controls">
						<select data-rules="{required:true}" name="sex"
							class="input-normal">
							<option value="">请选择</option>
							<option value="1">男</option>
							<option value="0">女</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>博客班级</label>
					<div class="controls">
						<input name="grad" type="grade" data-rules="{required:true}"
							class="input-normal control-text">
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>生日</label>
					<div class="controls">
						<input name="birthday" type="text" data-rules="{required:true}"
							class="calendar">
					</div>
				</div>

			</div>

		</form>
	</div>
	<script type="text/javascript" src="${basePath}/admin/assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="${basePath}/admin/assets/js/bui-min.js"></script>
	<script type="text/javascript" src="${basePath}/admin/assets/js/config-min.js"></script>
<body>
</html>
