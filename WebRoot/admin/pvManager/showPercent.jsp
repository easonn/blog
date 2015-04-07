<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
 <head>
  <title> 博文权重</title>
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
        <h2>饼状图</h2>
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
          width : 950,
          height : 500,
          title : {
            text : '博文权重分析图'
          },
          legend : null ,//不显示图例
          seriesOptions : { //设置多个序列共同的属性
            pieCfg : {
              allowPointSelect : true,
              labels : {
                distance : 40,
                label : {
                  //文本信息可以在此配置
                },
                renderer : function(value,item){ //格式化文本
                  return value + ' ' + (item.point.percent * 100).toFixed(2)  + '%'; 
                }
              }
            }
          },
          tooltip : {
            pointRenderer : function(point){
              return (point.percent * 100).toFixed(2)+ '%';
            }
          },
          series : [{
              type: 'pie',
              name: 'essay percent',
              data: [
${essayPercent}
              ]
          }]
        });
 
        chart.render();
    });

  </script>

<body>
</html>  