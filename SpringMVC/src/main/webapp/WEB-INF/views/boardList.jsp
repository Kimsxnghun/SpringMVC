<%@page import="java.util.List"%>
<%@page import="kr.smhrd.dao.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list"); // 바인딩한 것을 꺼내 사용한다
%> --%>
<!-- EL을 사용해서 스크립트릿 사용 X -->
<% 
	String cpath = request.getContextPath(); // context path를 가져옴 
	// 근데 EL문법으로도 가져올 수가 있다
%>
<!-- JSTL에서 변수 선언 방법 <c:set var="변수명" value="변수값"/> -->
<c:set var="cpath" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 부트스트랩 사용할 때 필요한 재료들  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- 부트스트랩 end -->
  <script>
  	function goForm(){
  		// 글쓰기 화면 좀 보여주세요라고 POJO로 요청
  		// location.href = "/web/boardInsertForm.do"; // "/web(context path)/boardInsertForm.do"
  		location.href = "${cpath}/boardInsertForm.do";
  	}
  </script>
</head>
<body>

<div class="container">
  <h2>Spring MVC BOARD (JSTL+EL)</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD LIST</div>
    <div class="panel-body">
    	<table class ="table table-hover table-bordered">
    	  <tr>
    	    <td>번호</td>
    	    <td>제목</td>
    	    <td>조회수</td>
    	    <td>작성자</td>
    	    <td>작성일</td>
    	  </tr>
    	  <!-- Attribute : 메소드를 통해 저장되고 관리되는 데이터 -->
    	  <!-- $+{list} : 톰캣의 해석 = request.getAttribute("list"); -->
    	  <!-- vo가 게시글 데이터 하나 -->
    	  <!-- items 객체 내 요소를 var에 한 개씩 대입  -->
    	  <c:forEach var="vo" items="${list}"><!-- items : 여러개의 데이터를 받는 Attribute -->
    	  <tr>
    	    <td>${vo.idx}</td> <!-- list에서 하나씩 꺼내서 사용 가능하다  $+{var.attribute} -->
    	    <!-- 주석 안에  $+{}를 붙여서 넣으면 컴퓨터가 먼저 해석해서 오류가 발생한다 -->
    	    <td><a href = "${cpath}/boardContent.do?idx=${vo.idx}">${vo.title}</a></td>
    	    <td>${vo.count}</td>
    	    <td>${vo.writer}</td>
    	    <td>${vo.indate}</td>
    	  </tr>    	  
    	  </c:forEach>
    	 
    	 <!-- 
    	 for each 구문
    	 for (type var : iterate){
    	 body-of-loop
    	 } 
    	 iterate 는 루프를 돌릴 객체이고 iterate 객체에서 한개씩 순차적으로 var에 대입되어 for문을 수행
    	 --> 
    	 
<%--     	  <% for(BoardVO vo : list){%>
    	 
    	  <tr>
    	    <td><%= vo.getIdx()%></td>
    	    <td><a href = "/web/boardContent.do?idx=<%= vo.getIdx()%>"><%= vo.getTitle()%></a></td>
    	    <td><%= vo.getCount()%></td>
    	    <td><%= vo.getWriter()%></td>
    	    <td><%= vo.getIndate()%></td>
    	  </tr>    	  
    	  <%} %> --%>
    	</table>
    	<button class = "btn btn-primary btn-sm" onclick = "goForm()">글쓰기</button>
    </div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>