<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 두 개가 한 세트 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value ="${pageContext.request.contextPath}"/>

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
    <div class="panel-heading">BOARD FORM</div>
    <div class="panel-body">
		 <!-- action에 '/'를 넣으면 경로가 '8081/' 로 간다 '/' 빼고 적으면 된다 -->
		 <!-- /web/boardInsert.do 라고 적으면 가긴함, 근데 수정 시 경로 문제발생 --> 
		<form class="form-horizontal" action="${cpath}/boardInsert.do" method = "post">
		  <div class="form-group">
		    <label class="control-label col-sm-2">제목 :</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="title" placeholder="Enter title">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2">내용 :</label>
		    <div class="col-sm-10">
		      <textarea rows="5" class="form-control" name="contents"></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2">작성자 :</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="writer" placeholder="Enter writer">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-primary btn-sm">저장</button>
		      <button type="reset" class="btn btn-warning btn-sm">취소</button>
		    </div>
		  </div>
		</form>
	</div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>