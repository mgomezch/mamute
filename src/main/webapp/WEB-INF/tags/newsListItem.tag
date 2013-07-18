<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="news" type="br.com.caelum.brutal.model.News" required="true" %>
<c:if test="${news.approved || currentUser.moderator}">
	<li class="post-item ${news.approved ? '' : 'post-under-review'} ${news.isVisibleForModeratorAndNotAuthor(currentUser.current) ? 'highlight-post' : '' }">
		<div class="post-information news-information">
			<tags:postItemInformation key="post.list.vote" count="${news.voteCount}" information="votes" htmlClass="news-info"/>
		</div>
		<div class="summary news-summary">
			<div class="item-title-wrapper">
				<h3 class="title item-title">
					<a href="${linkTo[NewsController].showNews[news][news.sluggedTitle]}">${news.title}</a>
				</h3>
				<div class="views">
					${news.views} <tags:pluralize key="post.list.view" count="${news.views}"/>
				</div>
			</div>
			<tags:lastTouchFor touchable="${news}"/>
		</div>		
		<c:if test="${not news.approved && currentUser.moderator}">
			<a class="approve-news" href="${linkTo[NewsController].approve[news]}"><fmt:message key="news.approve"/></a>
		</c:if>
	</li>
</c:if>