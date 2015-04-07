<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="cn.ithought.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<article class="article">


	<c:if
		test="${null!=requestScope.essayList&&requestScope.essayList.size()!=0}">
		<div id="content_box">
			<c:forEach var="essay" items="${requestScope.essayList}">
				<div class="post excerpt  date_con_handler">
					<div class="home_post_container">
						<h2 class="title">
							<a rel="bookmark"
								href="${ctx_path}/blog/<c:out value="${essay.essayId}" default="1"/>"><font
								face="Monda,​sans-serif"><c:out value="${essay.title}"
										default="error" /> </font></a>
						</h2>
						<div align="left">
							By <a  href="${ctx_path}"><c:out
									value="${essay.author}" default="ithought" /> </a> On
							${essay.date} <span style="font-size: 12px"><c:out
									value="${essay.typeName}" default="心路历程" /></span>

						</div>
						<hr style="margin-bottom: 0px; margin-top: 0px; width: 100%" />
						<div class="post-content image-caption-format-1">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:out value="${essay.contentInfo}" default="error" />
						</div>
						<div class="post_meta_custom">
							<font face='Aldrich' color="#000000"><b><c:out
										value="${essay.date}" default="error" /></b></font>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="pagination">
				<ul>
					<c:forEach var="i" begin="1" end="${requestScope.pageCount}">
						<c:choose>
							<c:when test="${requestScope.pageNum==i}">
								<li class="current"><span class="currenttext">${pageNum}</span></li>
							</c:when>
							<c:otherwise>
								<li><a class="inactive" href="${ctx_path} /${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${null!=requestScope.essay}">

		<div id="content_box" class="single">
			<div
				class="post-350 post type-post status-publish format-standard has-post-thumbnail hentry category-apple tag-facebook g post cat-7-id has_thumb"
				id="post-350">
				<div class="single_post">
					<header>
						<h1 class="title single-title">
							<c:out value="${essay.title}" default="error" />
						</h1>
					</header>
					<!--.headline_area-->
					<div class="post-single-content box mark-links">
						<div>${essay.content}</div>
					</div>
				</div>
				<div class="ds-thread" data-thread-key="${essay.essayId}" data-title="${essay.title}" data-url="http://ithought.cn/blog/${essay.essayId}"></div>
			</div>
			<!--.post-content box mark-links-->
		</div>
	</c:if>
</article>

