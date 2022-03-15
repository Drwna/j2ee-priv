<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- set out remove 练习  -->
<h3>set out remove</h3>
<c:set var="name" value="${'gareen'}" scope="request" />

通过标签获取name:
<c:out value="${name}" />
<br>

<c:remove var="name" scope="request" />
<br>

通过标签获取name:
<c:out value="${name}" />
<br>

<hr />

<!-- ---------------------------------- -->
<!-- if else 练习  -->
<h3>if else</h3>
<c:set var="hp" value="${10}" scope="request" />

<c:if test="${hp<5}">
	<p>这个英雄要挂了</p>
</c:if>

<c:if test="${!(hp<5)}">
	<p>这个英雄觉得自己还可以再抢救抢救</p>
</c:if>

<%
	pageContext.setAttribute("weapon", null);
	pageContext.setAttribute("lastwords", "");
	pageContext.setAttribute("items", new ArrayList());
%>

<c:if test="${empty weapon}">
	<p>没有装备武器</p>
</c:if>
<c:if test="${empty lastwords}">
	<p>挂了也没有遗言</p>
</c:if>
<c:if test="${empty items}">
	<p>物品栏为空</p>
</c:if>
<hr />

<!-- ---------------------------------- -->
<h3>for each</h3>
<!-- for each 练习 -->
<%
	List<String> heros = new ArrayList<String>();
	heros.add("塔姆");
	heros.add("艾克");
	heros.add("巴德");
	heros.add("塞格罗斯");
	heros.add("卡卡罗特");
	request.setAttribute("heros", heros);
%>

<!-- 使用jsp中的for循环来遍历List -->
<h4>使用jsp中的for循环来遍历List</h4>
<table width="200px" align="center" border="1" cellspacing="0">
	<tr>
		<td>编号</td>
		<td>英雄</td>
	</tr>

	<%
		int i = 0;
		for (String hero : heros) {
			i++;
	%>

	<tr>
		<td><%=i%></td>
		<td><%=hero%></td>
	</tr>

	<%
		}
	%>

</table>

<br>
<!-- 使用JSTL中的c:forEach 循环来遍历List -->
<h4>使用JSTL中的c:forEach 循环来遍历List</h4>
<table width="200px" align="center" border="1" cellspacing="0">
	<tr>
		<td>编号</td>
		<td>英雄</td>
	</tr>

	<c:forEach items="${heros}" var="hero" varStatus="st">
		<tr>
			<td><c:out value="${st.count}" /></td>
			<td><c:out value="${hero}" /></td>
		</tr>
	</c:forEach>
</table>
<hr />
<!-- ---------------------------------- -->
<h3>forTokens</h3>
<c:set var="heros" value="塔姆,艾克;巴德|塞格罗斯! 卡卡罗特" />

<c:forTokens items="${heros}" delims=":;|!" var="hero">
	<c:out value="${hero}" />
	<br />
</c:forTokens>
<hr />

<!-- ---------------------------------- -->
<h3> fmt:formatNumber 格式化数字 </h3>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %> 
 
<c:set var="money" value="888.8" />
<c:set var="pi" value="3.1415926" />
最少两个小数点:
<fmt:formatNumber type="number" value="${money}" minFractionDigits="2"/>
<br>
最多两个小数点:
<fmt:formatNumber type="number" value="${pi}" maxFractionDigits="2" />
<hr />

<!-- ---------------------------------- -->

<h3> fmt:formatDate 格式化日期</h3>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %> 
 
<%
    Date now = new Date();
    pageContext.setAttribute("now",now);
%>
 
完整日期: <fmt:formatDate value="${now}" pattern="G yyyy年MM月dd日 E"/><br>
完整时间: <fmt:formatDate value="${now}" pattern="a HH:mm:ss.S z"/><br>
常见格式: <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>