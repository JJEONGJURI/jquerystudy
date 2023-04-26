<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /jquerystudy/src/main/webapp/20230426/examtest.jsp--%>
<%
String result = "";
for (int i = 1; i <= 10; i++) {
	int n = (int) (Math.random() * 100);
	result += n + ((i == 10) ? "" : ",");
}
out.println(result);
%>
