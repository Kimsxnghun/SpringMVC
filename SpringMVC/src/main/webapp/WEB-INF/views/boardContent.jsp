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
  <script type="text/javascript">
	function goDel(idx){ // 자바스크립트는 가변 -> 선언 필요X, 변수만 써도됨
		location.href="/web/boardDelete.do?idx=" + idx; // '/web/'(context-root) 은 써도 되고 안써도 된다
	}
	function goList(){
		location.href="boardList.do"
	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC BOARD</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD CONTENT</div>
    <div class="panel-body">
      <form action="boardUpdate.do" method="post">
      	<input type="hidden" name="idx" value="<%= vo.getIdx() %>">  <!-- hidden으로 넘겨줌 -->
    	<table class="table table-bordered table-hover">
    	  <tr>
    	    <td>번호</td>
    	    <td><%= vo.getIdx() %></td>
    	  </tr>
    	  <tr>
    	    <td>제목</td>
    	    <td><input type="text" name="title" class = "form-control" value="<%= vo.getTitle() %>"></td>
    	  </tr>
    	  <tr>
    	    <td>내용</td>
    	    <td><textarea rows="5" name="contents" class="form-control"><%= vo.getContents() %></textarea></td>
    	  </tr>
    	  <tr>
    	    <td>작성자</td>
    	    <td><%= vo.getWriter() %></td>
    	  </tr>
    	  <tr>
    	  	<td colspan = "2">
    	  		<button type="submit" class="btn btn-primary btn-sm">수정</button>
    	  		<button type="reset" class="btn btn-success btn-sm">취소</button>    	  		
    	  		<button type="button" class="btn btn-warning btn-sm" onclick="goDel(<%= vo.getIdx() %>)">삭제</button>
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