<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" import="bean.*"
	import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="name" value="${'gareen'}" scope="request" />

通过标签获取name:
<c:out value="${name}" />
<br>

通过 EL表达式 获取name: ${name}
<hr />

<!-- ------------------------------------------ -->
<h3>作用域优先级</h3>
<p>
	EL表达式可以从pageContext,request,session,application四个作用域中取到值，<br />
	如果4个作用域都有name属性怎么办？<br /> EL会按照从高到低的优先级顺序获取<br /> pageContext >
	request > session > application
</p>
<c:set var="name" value="${'gareen-pageContext'}" scope="page" />
<c:set var="name" value="${'gareen-request'}" scope="request" />
<c:set var="name" value="${'gareen-session'}" scope="session" />
<c:set var="name" value="${'gareen-application'}" scope="application" />

4个作用域都有name,优先获取出来的是 ： ${name}
<hr />

<!-- ------------------------------------------ -->

<h3>获取 JavaBean 的属性</h3>
<p>需要导入 import="bean.*"</p>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Hero hero = new Hero();
	hero.setName("楚休");
	hero.setHp(616);
	request.setAttribute("hero", hero);
%>

英雄名字 ： ${hero.name}
<br>
英雄血量 ： ${hero.hp}
<br />
<hr />
<!-- ------------------------------------------ -->

<h3>结合 JSTL 的 foreach</h3>
<%
	List<String> heros = new ArrayList<String>();
	heros.add("塔姆");
	heros.add("艾克");
	heros.add("巴德");
	heros.add("塞恩罗斯");
	heros.add("卡卡罗特");
	request.setAttribute("heros", heros);
%>

<table width="200px" align="center" border="1" cellspacing="0">
	<tr>
		<td>编号</td>
		<td>英雄</td>
	</tr>

	<c:forEach items="${heros}" var="hero" varStatus="st">
		<tr>
			<td>${st.count}</td>
			<td>${hero}</td>
		</tr>
	</c:forEach>
</table>

<br />
<hr />
<!-- ------------------------------------------ -->
<h3>取参</h3>
EL表达式还可以做到request.getParameter("name")<br>
 这样的形式获取浏览器传递过来的参数<br>
先把jstl.jsp代码改为如例所示，然后访问如下地址<br>
http://localhost:8080/j2ee-priv/testELExpression.jsp?name=iron man<br>
可以观察到获取了参数 name <br>
<br/>
${param.name}
<br />
<hr />
<!-- ------------------------------------------ -->
 <h3>条件判断</h3> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<% request.setAttribute("killNumber", "10"); %>
 
<p> request.setAttribute("killNumber", "10");</p> 
c:if 的用法，运行结果：
<c:if test="${killNumber>=10}"> 超神 </c:if>
<c:if test="${killNumber<10}"> 还没超神 </c:if>
<br>

c:choose 的用法，运行结果：
<c:choose>
    <c:when test="${killNumber>=10}"> 超神 </c:when>
    <c:otherwise> 还没超神 </c:otherwise>
</c:choose>
<br>
EL表达式eq的用法，运行结果：
<p>$ &nbsp;{killNumber ge 10? "超神":"还没超神" }</p>
${killNumber ge 10? "超神":"还没超神" }