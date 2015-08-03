<%@ tag body-content="scriptless" pageEncoding="UTF-8" dynamic-attributes="like, sure" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ attribute name="page" required="true" type="java.lang.Integer" rtexprvalue="true" %>
<%@ attribute name="total" required="true" type="java.lang.Integer" rtexprvalue="true" %>
<%@ attribute name="queryString" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="pageName" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="max" type="java.lang.Integer" rtexprvalue="true" %>
<%@ attribute name="numberOfPageGroup" type="java.lang.Integer" rtexprvalue="true" %>
<%@ attribute name="cssClass" type="java.lang.String" rtexprvalue="true" %>

<c:if test="${empty numberOfPageGroup }">
	<c:set var="numberOfPageGroup" value="10" />
</c:if>
<c:if test="${empty cssClass }">
	<c:set var="cssClass" value="pageNav" />
</c:if>

<spring:eval var="numberOfPageGroup" expression="T(java.lang.Integer).parseInt(numberOfPageGroup)" />
<spring:eval var="max" expression="T(java.lang.Math).max(max, 5)" />
<spring:eval var="page" expression="T(java.lang.Math).max(page, 1)" />
<spring:eval var="pages" expression="T(java.lang.Math).max((total + (max - 1)) / max, 1)" />
<spring:eval var="begin" expression="((page - 1) / numberOfPageGroup) * numberOfPageGroup + 1" />
<spring:eval var="end" expression="T(java.lang.Math).min(begin + (numberOfPageGroup - 1), pages)" />
<spring:eval var="prev" expression="T(java.lang.Math).max(begin - numberOfPageGroup, 1)" />
<spring:eval var="next" expression="T(java.lang.Math).min( (end ) + 1, pages)" />

<c:if test="${empty pageName }">
	<c:set var="pageName" value="cPage" />
</c:if>

<div class="<c:out value="${cssClass }" />">
	<a href="?${pageName }=1&amp;${queryString }" data-no="1" class="first"><span></span>첫페이지</a>
	<a href="?${pageName }=${prev }&amp;${queryString }" data-no="${prev }" class="prev"><span></span>이전  ${numberOfPageGroup}페이지</a>
	<span>
		<c:forEach var="p" begin="${begin }" end="${end }">
			<a href="?${pageName }=${p }&amp;${queryString }" data-no="${p }"${p eq page ? ' class="on"' : '' }>${p }</a>
		</c:forEach>
	</span>
	<a href="?${pageName }=${next }&amp;${queryString }" data-no="${next }" class="next"><span></span>다음 ${numberOfPageGroup}페이지</a>
	<a href="?${pageName }=${pages }&amp;${queryString }" data-no="${pages }" class="last"><span></span>마지막페이지</a>
</div>