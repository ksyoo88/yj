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
<spring:eval var="numberOfPageGroup" expression="T(java.lang.Integer).parseInt(numberOfPageGroup)" />
<spring:eval var="max" expression="T(java.lang.Math).max(max, 8)" />
<spring:eval var="page" expression="T(java.lang.Math).max(page, 1)" />
<spring:eval var="pages" expression="T(java.lang.Math).max((total + (max - 1)) / max, 1)" />
<spring:eval var="begin" expression="((page - 1) / 10) * 10 + 1" />
<spring:eval var="end" expression="T(java.lang.Math).min(begin + (numberOfPageGroup - 1), pages)" />
<spring:eval var="prev" expression="T(java.lang.Math).max(begin - numberOfPageGroup, 1)" />
<spring:eval var="next" expression="T(java.lang.Math).min( (end ) + 1, pages)" />
<c:if test="${empty pageName }">
	<c:set var="pageName" value="cPage" />
</c:if>
<div class="board-pageing">
    <a href="?${pageName }=1&amp;${queryString}" class="${cssClass } first"><img src="/images/contest/common/page_first.gif" alt="first" /></a>
    <a href="?${pageName }=${prev}&amp;${queryString}" class="${cssClass } prev"><img src="/images/contest/common/page_prev.gif" alt="prev" /></a>    
    
        <c:forEach var="p" begin="${begin}" end="${end}">
            <c:if test="${p eq page}"><strong>${p}</strong></c:if>
            <c:if test="${p ne page}"><a href="?${pageName }=${p}&amp;${queryString}" >${p}</a></c:if>
        </c:forEach>
    
    <a href="?${pageName }=${next}&amp;${queryString}" class="${cssClass } next"><img src="/images/contest/common/page_next.gif" alt="next" /></a>
	<a href="?${pageName }=${pages}&amp;${queryString}" class="${cssClass } last"><img src="/images/contest/common/page_last.gif" alt="last" /></a>    
</div>