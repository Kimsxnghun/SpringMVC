<%@page import="kr.smhrd.dao.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value ="${pageContext.request.contextPath}"/>
<%-- <%
			BoardVO vo = (BoardVO)request.getAttribute("vo");
			<!-- 불러오는 거 필요 없음 컨트롤러가 보낸 vo를  $+{vo.attribute}로 바로 받을 수 있다 -->
%> --%>
      	
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	function goDel(idx){ // 자바스크립트는 가변 -> 선언 필요X, 변수만 써도됨
		location.href="${cpath}/boardDelete.do?idx=" + idx; // '/web/'(context-root) 은 써도 되고 안써도 된다
	}
	function goList(){
		location.href="${cpath}/boardList.do"
	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC BOARD(JSTL+EL)</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD CONTENT</div>
    <div class="panel-body">
      <form action="${cpath}/boardUpdate.do" method="post">
      	<%-- <input type="hidden" name="idx" value="<%= vo.getIdx() %>"> --%>  <!-- hidden으로 넘겨줌 -->
      	<input type="hidden" name="idx" value="${vo.idx}">
      	<!-- 불러오는 거 필요 없음 컨트롤러가 보낸 vo를  $+{vo.attribute}로 바로 받을 수 있다 -->
    	<table class="table table-bordered table-hover">
    	  <tr>
    	    <td>번호</td>
    	    <%-- <td><%= vo.getIdx() %></td> --%>
    	    <td>${vo.idx}</td>
    	  </tr>
    	  <tr>
    	    <td>제목</td>
    	    <%-- <td><input type="text" name="title" class = "form-control" value="<%= vo.getTitle() %>"></td> --%>
    	    <td><input type="text" name="title" class = "form-control" value="${vo.title}"></td>
    	  </tr>
    	  <tr>
    	    <td>내용</td>
    	    <%-- <td><textarea rows="5" name="contents" class="form-control"><%= vo.getContents() %></textarea></td> --%>
    	    <td><textarea rows="5" name="contents" class="form-control">${vo.contents}</textarea></td>
    	  </tr>
    	  <tr>
    	    <td>작성자</td>
    	    <%-- <td><%= vo.getWriter() %></td> --%>
    	    <td>${vo.writer}</td>
    	  </tr>
    	  <tr>
    	  	<td colspan = "2">
    	  		<button type="submit" class="btn btn-primary btn-sm">수정</button>
    	  		<button type="reset" class="btn btn-success btn-sm">취소</button>    	  		
    	  		<%-- <button type="button" class="btn btn-warning btn-sm" onclick="goDel(<%= vo.getIdx() %>)">삭제</button> --%>
    	  		<button type="button" class="btn btn-warning btn-sm" onclick="goDel(${vo.idx})">삭제</button>
    	  		<!-- 함수를 이용해서 삭제 -->
    	  		<!-- form내부에서 버튼의 기본속성이 submit이기 때문에, 버튼에 버튼타입을 줘야 클릭 시 onclick이벤트로 넘어감 -->
    	  		<button type="button" class="btn btn-info btn-sm" onclick="goList()">목록</button>
    	  	</td>
    	  </tr>
    	</table>
   	  </form>
    </div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>