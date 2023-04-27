<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jquerystudy/src/main/webapp/20230427/iddup.jsp--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--1. db에 Connection --%>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/gdudb"
	user="gdu" password="1234"/>

<%--2.connection객체를 이용해 데이터 전송 --%>
<sql:query var="rs" dataSource="${conn}">
	select * from member where id=?
	<sql:param>${param.id}</sql:param>
</sql:query>

<%--밑에만 클라이언트단으로 내려감(데이터 전송)  --%>
<c:if test="${!empty rs.rows}">
	<h1 id="result" class="find" style="color:red;">존재하는 아이디 입니다.</h1>
</c:if>
<c:if test="${empty rs.rows}">
	<h1 id="result" class="notfound">사용가능한 아이디 입니다.</h1>
</c:if>

