<%@ tag body-content="scriptless" pageEncoding="UTF-8" dynamic-attributes="like, sure" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ attribute name="page" required="true" type="java.lang.Integer" rtexprvalue="true" %>
<%@ attribute name="total" required="true" type="java.lang.Integer" rtexprvalue="true" %>
<%@ attribute name="queryString" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="pageName" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="max" type="java.lang.Integer" rtexprvalue="true" %>

<spring:eval var="max" expression="T(java.lang.Math).max(max, 10)" />
<spring:eval var="page" expression="T(java.lang.Math).max(page, 1)" />
<spring:eval var="pages" expression="T(java.lang.Math).max((total + (max - 1)) / max, 1)" />
<spring:eval var="begin" expression="((page - 1) / 10) * 10 + 1" />
<spring:eval var="end" expression="T(java.lang.Math).min(begin + (10 - 1), pages)" />
<spring:eval var="prev" expression="T(java.lang.Math).max(page - max, 1)" />
<spring:eval var="next" expression="T(java.lang.Math).min(page + max, pages)" />
<c:if test="${empty pageName }">
	<c:set var="pageName" value="cPage2" />
</c:if>
<div class="pageNav">
    <a href="?${pageName }=1&amp;${queryString}" class="first"><span></span>첫페이지</a>
    <a href="?${pageName }=${prev}&amp;${queryString}" class="prev"><span></span>이전 10페이지</a>    
    <span>
        <c:forEach var="p" begin="${begin}" end="${end}">
            <c:if test="${p eq page}"><a href="?${pageName }=${p}&amp;${queryString}" class="on">${p}</a></c:if>
            <c:if test="${p ne page}"><a href="?${pageName }=${p}&amp;${queryString}" >${p}</a></c:if>
        </c:forEach>
    </span>
    <a href="?${pageName }=${next}&amp;${queryString}" class="next"><span></span>다음 10페이지</a>
	<a href="?${pageName }=${pages}&amp;${queryString}" class="last"><span></span>마지막페이지</a>    
</div>
