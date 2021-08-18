<%@page import="java.util.List"%>
<%@page import="kr.smhrd.dao.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
%>
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
</head>
<body>

<div class="container">
  <h2>Spring MVC BOARD</h2>
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
    	  <% for(int i =0; i<list.size(); i++){ %>
    	  <tr>
    	    <td><%= list.get(i).getIdx()%></td>
    	    <td><%= list.get(i).getTitle()%></td>
    	    <td><%= list.get(i).getCount()%></td>
    	    <td><%= list.get(i).getWriter()%></td>
    	    <td><%= list.get(i).getIndate()%></td>
    	  </tr>    	  
    	  <%} %>
    	</table>
    </div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>