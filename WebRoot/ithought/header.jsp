<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<base href="${ctx_path}/"/>
<html lang="en-US"
	class=" js flexbox no-touch rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio">
<head>
<meta charset="UTF-8">
<title>ithought</title>
<link type="image/x-icon" href="${ctx_path}/favicon.png" rel="icon">
<!--iOS/android/handheld specific -->
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<link href="${ctx_path}/style.css" media="all" type="text/css" rel="stylesheet">
<script src="${ctx_path}/js/jquery.min.js"></script>
<script src="${ctx_path}/js/modernizr.min.js"></script>
<script type="text/javascript" src="${ctx_path}/js/customscript.js"></script>


<script type="text/javascript">
	var duoshuoQuery = {short_name:"ithought"};
	(function() {
		var ds = document.createElement('script');
		ds.type = 'text/javascript';ds.async = true;
		ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
		ds.charset = 'UTF-8';
		(document.getElementsByTagName('head')[0] 
		 || document.getElementsByTagName('body')[0]).appendChild(ds);
	})();
</script>

<style type="text/css">
#header h1,#header h2 {
	text-indent: -999em;
	min-width: 286px;
}

#header h1 a,#header h2 a {
	background: url("${ctx_path}/logo.png") no-repeat;
	min-width: 315px;
	display: block;
	min-height: 70px;
	line-height: 70px;
}

body {
	background-color: #EEEEEE;
}

.nav-previous a,.nav-next a,.comment_cont span,#navigation ul ul a:hover,.flex-control-nav li a:hover,#navigation ul a:hover,.flex-control-nav li .active,#tabber ul.tabs li a.selected,#tabber ul.tabs li.tab-recent-posts a.selected,.readMore a,.currenttext,.pagination a:hover,.mts-subscribe input[type="submit"],.date_container,#commentform input#submit,.comment_cont span
	{
	background-color: #EEEEEE;
}

.tagcloud a {
	border-color: #8FC400;
}

.single_post a,a:hover,#logo a,.textwidget a,#commentform a,#tabber .inside li a,.copyrights a:hover,a,.f-widget .popular-posts li a:hover,.comment-meta a,.pp_date
	{
	color: #888888;
}

.comment_cont span:after {
	border-right-color: #8FC400;
}

#tabber {
    display: block;
    height: auto;
    margin: 0 0 25px;
    max-width: 330px;
    overflow: hidden;
    padding: 0;
}


</style>

</head>


<body class="${requestScope.class}" id="blog">
	<header class="main-header">
		<div class="container">
			<div id="header">
				<h1 id="logo">
					<a href="${ctx_path}">ithought.cn</a>
				</h1>
				<!-- END #logo -->
			</div>
			<!--#header-->
			<div class="secondary-navigation">
				<nav id="navigation">
					<ul class="menu sf-js-enabled" id="menu-main-navigation">
						<li
							class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1225"
							id="menu-item-1225"><a href="${ctx_path}/"><font
								face="微软雅黑" size="3">首页</font></a></li>
						<li
							class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1186"
							id="menu-item-1186"><a href="${ctx_path}/mood"><font face="微软雅黑"
								size="3">心路历程</font></a></li>
						<li
							class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1185"
							id="menu-item-1185"><a href="${ctx_path }/summa"><font face="微软雅黑"
								size="3">学无止境</font></a></li>
						<li
							class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1188"
							id="menu-item-1188"><a href="${ctx_path }/gather"><font face="微软雅黑"
								size="3">精品收藏</font></a></li>
						<li
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-1265"
							id="menu-item-1265"><a href="#" class="sf-with-ul"><font
								face="微软雅黑" size="3">关于</font><span class="sf-sub-indicator">
									»</span></a>
							<ul class="sub-menu sf-js-enabled"
								style="display: none; visibility: hidden;">
								<li
									class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1262"
									id="menu-item-1262"><font face="微软雅黑"><a href="${ctx_path}/about">个人简介</a></font></li>
								<li
									class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1261"
									id="menu-item-1261"><font face="微软雅黑"><a href="#">博客简介</a></font></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>