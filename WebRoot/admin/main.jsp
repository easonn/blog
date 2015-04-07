<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
 <head>
  <title> ithought 分析系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="${ctx_path}/admin/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="${ctx_path}/admin/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="${ctx_path}/admin/assets/css/main-min.css" rel="stylesheet" type="text/css" />
 </head>
 <body>
  <div class="header">
      <div class="dl-title">
        <a href="http://www.ithought.cn" title="文档库地址" target="_blank"><!-- 仅仅为了提供文档的快速入口，项目中请删除链接 -->
          <span class="lp-title-port">ithought.cn</span><span class="dl-title-text">数据分析</span>
        </a>
      </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">yinsheng92@hotmail.com</span><a href="###" title="退出系统" class="dl-log-quit">[退出]</a><a href="http://http://www.builive.com/" title="文档库" class="dl-log-quit">文档库</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item"><div class="nav-item-inner nav-home">blog</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="${ctx_path}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx_path}/admin/assets/js/bui-min.js"></script>
  <script type="text/javascript" src="${ctx_path}/admin/assets/js/config-min.js"></script>

  <script>
    BUI.use('common/main',function(){
      var config = [{    
            id:'blog',
			homePage : 'info',
			  menu:[{
				  text:'个人中心',
				  items:[
					{id:'info',text:'个人信息',href:'${ctx_path}/admin/admin/example.html',closeable : false}
				  ]
				},{
				  text:'博文管理',
				  items:[
					{id:'writeBlog',text:'写博客',href:'${ctx_path}/admin/blogManager/writeBlog.jsp'},
					{id:'blogList',text:'博文统计',href:'${ctx_path}/admin_essay/essayList'}
				  ]
				},{
				  text:'流量统计',
				  items:[
					  {id:'monthLine',text:'今日流量',href:'${ctx_path}/admin_essay/allPV'},
					  {id:'area',text:'博文权重',href:'${ctx_path}/admin_essay/essayPercent'},
					  {id:'column',text:'柱状图',href:'${ctx_path}/admin/chart/column.html'},
					  {id:'pie',text:'饼图',href:'${ctx_path}/admin/chart/pie.html'}, 
					  {id:'radar',text:'雷达图',href:'${ctx_path}/admin/chart/radar.html'}
				  ]
				}]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
 </body>
</html>
