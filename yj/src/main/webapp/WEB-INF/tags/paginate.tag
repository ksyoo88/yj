<%@ tag body-content="scriptless" pageEncoding="UTF-8" dynamic-attributes="like, sure"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ attribute name="page" required="true" type="java.lang.Integer" rtexprvalue="true"%>
<%@ attribute name="total" required="true" type="java.lang.Integer" rtexprvalue="true"%>
<%@ attribute name="queryString" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="pageName" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="max" type="java.lang.Integer" rtexprvalue="true"%>
<%@ attribute name="numberOfPageGroup" type="java.lang.Integer" rtexprvalue="true"%>
<%@ attribute name="cssClass" type="java.lang.String" rtexprvalue="true"%>

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
<c:if test="${page eq 1 }">
	<c:set var="firstCss" value="disabled" />
</c:if>

<ul class="<c:out value="${cssClass }" />">
	<li class="${firstCss }"><a href="?${pageName }=${prev }&amp;${queryString }" data-no="${prev }">«</a></li>
	<c:forEach var="p" begin="${begin }" end="${end }">
		<li ${p eq page ? ' class="active"' : '' }><a href="?${pageName }=${p }&amp;${queryString }" data-no="${p }" >${p }</a></li>
	</c:forEach>
	<li><a href="?${pageName }=${next }&amp;${queryString }">»</a></li>
</ul>