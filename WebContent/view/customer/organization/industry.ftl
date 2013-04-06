<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<link rel="stylesheet" type="text/css" href="../../../style/css/pss.css">
	<script type="text/javascript" src="../../../script/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.btn-add').click(function(){
				parent.dialog({
					title: '新增商品',
					label: ['名称',{style: 'high', name:'备注'}],
					data: {url:'customer/organization/industry/add'},
					source: [
						'<input type="text" class="text_500 not_null form-value" name="name" />',
						'<textarea class="text_500 not_null form-value" name="description"></textarea>'
					]
				});
			});
			
			function checked(){
				var isCheckAll = true;
				$.each($('.ui-table').find('.checkbox'), function(i,n){
					if($(this).attr('class') == 'checkbox'){
						isCheckAll = false;
					}
				});
				return isCheckAll;
			}
			$('.btn-check-all').click(function(){
				if($(this).text() == '全选'){
					$('.ui-table').find('.checkbox').addClass('checked');
					$(this).text('不全选');
				}else{
					$('.ui-table').find('.checkbox').removeClass('checked');
					$(this).text('全选');
				}
			});
			$('.btn-check-invert').click(function(){
				$('.ui-table').find('.checkbox').toggleClass('checked');
				if(checked()){
					$('.btn-check-all').text('不全选');
				}else{
					$('.btn-check-all').text('全选');
				}
			});
			$('.table-source-line').click(function(){
				$(this).find('.checkbox').toggleClass('checked');
				if(checked()){
					$('.btn-check-all').text('不全选');
				}else{
					$('.btn-check-all').text('全选');
				}
			});
		});
	</script>
	<body>
		<!--<div class="search">
			<form action="list" method="post" class="searchForm">
				<dl class="search_line">
					<dd>类型名称：<input type="text" name="sort.name"/></dd>
					<dd>备注：<input type="text" name="sort.remark"/></dd>
				</dl>
				<div class="search_btn">查询</div>
			</form>
		</div> -->
		<div class="ui-table" id="sortTable">
			<div class="ui-head">
				<div class="ui-title">
					<div class="ui-title-name">行业信息</div>
					<div class="ui-operation">
						<div class="ui-btn btn-delete">删除</div>
						<div class="ui-btn btn-edit">编辑</div>
						<div class="ui-btn btn-add">新增</div>
					</div>
				</div>
				<div class="table-source-head">
					<dl>
						<dd class="text_5p">选项</dd>
						<dd class="text_5p">编号</dd>
						<dd class="text_35p">商品名称</dd>
						<dd class="text_55p">备注</dd>
					</dl>
				</div>
			</div>
			<div class="table-source">
				<#list industryList as industry>
					<#if industry_index % 2 = 0>
						<dl class="table-source-line odd">
							<dd class="text_5p"><span id="${industry.id}" class="checkbox"></span></dd>
							<dd class="text_5p">${industry_index + 1}</dd>
							<dd class="text_35p">${industry.name}</dd>
							<dd class="text_55p">${industry.description}</dd>
						</dl>
					</#if>
					<#if industry_index % 2 = 1>
						<dl class="table-source-line">
							<dd class="text_5p"><span id="${industry.id}" class="checkbox"></span></dd>
							<dd class="text_5p">${industry_index + 1}</dd>
							<dd class="text_35p">${industry.name}</dd>
							<dd class="text_55p">${industry.description}</dd>
						</dl>
					</#if>
				</#list>
			</div>
			<div class="ui-foot">
				<#if (industryList?size>1) >
					<div class="btn">
						<div class="ui-btn btn-check-all">全选</div>
						<div class="ui-btn btn-check-invert">反选</div>
					</div>
				</#if>
			</div>
		</div>
	</body>
</html>
