<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE HTML>
<html>
 <head>
  <title> 流量统计</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="${ctx_path}/admin/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx_path}/admin/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx_path}/admin/assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="${ctx_path}/admin/assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    code {
      padding: 0px 4px;
      color: #d14;
      background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
   </style>
 </head>
 <body>
  
    
    <div class="container">
      <div class="row">
        <h2>访客流量</h2>
        <div class="span24" id="canvas"></div>
      </div>
    

    </div>
  <script type="text/javascript" src="${ctx_path}/admin/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="${ctx_path}/admin/assets/js/bui-min.js"></script>

  <script type="text/javascript" src="${ctx_path}/admin/assets/js/config-min.js"></script>
  <script type="text/javascript">
    BUI.use('common/page');

    BUI.use('bui/chart',function (Chart) {

        var chart = new Chart.Chart({
          render : '#canvas',
         
          height : 500,
          plotCfg : {
            margin : [50,50,80] //画板的边距
          },
          title : {
            text : '每日的博客浏览量'
 
          },
          subTitle : {
            text : '来至ithought.cn'
          },
          xAxis : {
            categories : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
          },
          yAxis : {
            title : {
              text : '点击数',
              rotate : -90
            }
          },  
          tooltip : {
            valueSuffix : 'pv',
            shared : true, //是否多个数据序列共同显示信息
            crosshairs : true //是否出现基准线
          },
          series : [{
                name: 'ithought',
                data: [${monthPageView}]
            }]
        });
 
        chart.render();
    });

  </script>
  


<body>
</html>  