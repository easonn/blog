<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="sidebar c-4-12">
	<div class="g" id="sidebars">
		<div class="sidebar">
			<ul class="sidebar_list">
				<div id="tabber">
					<ul class="tabs">
						<li><a class="" href="#popular-posts"><font face="微软雅黑">热门博文</font></a>
						</li>
						<li class="tab-recent-posts"><a class="" href="#recent-posts"><font
								face="微软雅黑">最新评论</font></a></li>
					</ul>
					<!-- end .tabs-->
					<div class="clear"></div>
					<div class="inside">
						<div id="popular-posts" style="display: none;">

							<ul>
								<c:forEach items="${requestScope.essayPageView}" var="essay">
									<li>
										<div class="info">
											<p class="entry-title">
												<a href="${ctx_path}/blog/${essay.essayId}" rel="bookmark">${essay.title}</a>
											</p>
											<div class="meta">
												<span style="font-size: 12px">${essay.date} -
													${essay.pageView}浏览</span>
											</div>
										</div>
										<div class="clear"></div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- end #popular-posts-->
						<div id="recent-posts" style="display: block;">
							<!-- 多说最新评论 start -->
							<div class="ds-recent-comments" data-num-items="5"
								data-show-avatars="1" data-show-time="1" data-show-title="1"
								data-show-admin="1" data-excerpt-length="70"></div>
						</div>
						<!-- end #recent-posts-->
						<div class="clear" style="display: none;"></div>
					</div>
					<!-- end .inside-->
					<div class="clear"></div>
				</div>
			</ul>
		</div>
	</div>
</aside>
