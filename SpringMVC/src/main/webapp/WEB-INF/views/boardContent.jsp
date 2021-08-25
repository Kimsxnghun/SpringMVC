<%@page import="kr.smhrd.dao.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
			BoardVO vo = (BoardVO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC BOARD</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD CONTENT</div>
    <div class="panel-body">
    	<table class="table table-bordered table-hover">
    	  <tr>
    	    <td>번호</td>
    	    <td><%= vo.getIdx() %></td>
    	  </tr>
    	  <tr>
    	    <td>제목</td>
    	    <td><%= vo.getTitle() %></td>
    	  </tr>
    	  <tr>
    	    <td>내용</td>
    	    <td><%= vo.getContents() %></td>
    	  </tr>
    	  <tr>
    	    <td>작성자</td>
    	    <td><%= vo.getWriter() %></td>
    	  </tr>
    	  <tr>
    	  	<td colspan = "2">
    	  		<button class = "btn btn-primary btn-sm">수정</button>
    	  		<button class = "btn btn-warning btn-sm">삭제</button>
    	  		<button class = "btn btn-info btn-sm">목록</button>
    	  	</td>
    	  </tr>
    	</table>
    </div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>