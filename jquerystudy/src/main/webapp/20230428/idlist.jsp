<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jquerystudy/src/main/webapp/20230428/idlist.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%--1. db에 Connection --%>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/gdudb"
	user="gdu" password="1234"/>

<%--2.connection객체를 이용해 데이터 전송 --%>
<sql:query var="rs" dataSource="${conn}">
	select * from member where id like ?
	<sql:param>${param.id}%</sql:param>
<%--${param.id}% :입력한 값으로 시작한 값(%가 뒤에만 있음) --%>
</sql:query>
<ul>
<%-- data : member 테이블의 한개의 레코드값 --%>
<c:forEach var="data" items="${rs.rows}">
	<li>${data.id}</li>
<%--클라이언트에 보내줌 --%>
</c:forEach>
</ul>
