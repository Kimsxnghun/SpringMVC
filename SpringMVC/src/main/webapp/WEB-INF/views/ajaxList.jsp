<%@page import="java.util.List"%>
<%@page import="kr.smhrd.dao.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  <script type ="text/javascript">
	
  	// 응용소프트웨어처럼 한 화면에서 모든 작업을 처리해보자 -> ajax를 사용해야함
  	// 한 화면을 동적으로 관리하기 위해서 여백을 활용해야한다
  	// jquery문법의 시작 -> $(document).ready();
  	$(document).ready(function(){
  		loadJson();
  	});
  
  	function loadJson(){

  		$.ajax({
  			url : "${cpath}/list.do",
  			type : "get",
  			// data : {}, 현재 넘길 데이터 없음
  			dataType: "json", 
  			success : resultJson, 
  			error : function(){ alert("error"); }			
    	});
  	}
  	function resultJson(data){ // data = [{ 0 },{ 1 },{ 2 },...]

  		// alert(data);
  		var html="<table class='table'>";
  		html+="<tr>";
  		html+="<td>번호</td>";
  		html+="<td>제목</td>";
  		html+="<td>조회수</td>";
  		html+="<td>작성자</td>";
  		html+="<td>작성일</td>";
  		html+="<td>삭제</td>";  		
  		html+="</tr>";

  		$.each(data, (index, obj)=>{ // index는 자리를 받고, obj는 json을 받는다 
  			html+="<tr>";
  	  		html+="<td>"+obj.idx+"</td>";
  	  		html+="<td>"+obj.title+"</td>";
  	  		html+="<td>"+obj.count+"</td>";
  	  		html+="<td>"+obj.writer+"</td>";
  	  		html+="<td>"+obj.indate+"</td>";
  	  		html+="<td><button class='btn btn-warning btn-sm' onclick='goDel("+obj.idx+")'>삭제</button></td>";
  	  		html+="</tr>";
  		})
  		html+="</table>";

  		$(".panel-body").html(html); // text 변경
  		$(".panel-body").css("display","block"); // css속성 변경
  		
  	}
  		
  	function goWrite(){
  		$(".panel-body").css("display","none"); // 글쓰기 할 때는 글 목록을 지워준다
  	}
  	
  	function goDel(idx){
  		$.ajax({
  			url : "${cpath}/delete.do",
  			type : "get",
  			data : {"idx":idx}, // key:value
  			success : loadJson,
  			error : function(){ alert("error"); }
  		
  		});	
  	}
  </script>
</head>
<body>

<div class="container">
  <h2>Spring MVC BOARD (AJAX)</h2>
  <div class="panel panel-default">
    <div class="panel-heading"><button class="btn btn-primary btn-sm" onclick = "goWrite()">글쓰기</button></div>
    <div class="panel-body" style="display:none;">  
    <!-- 기본값은 안보이게 해두고 노출시키고 싶을 때 javaScript에서 css속성을 block으로 바꿔 노출시킨다 -->
    <!-- 
    style="visibility:hidden;" -> 여백 있는 채로 숨김
    style= "display:none;" -> 여백 없이 숨김
     -->
    </div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>