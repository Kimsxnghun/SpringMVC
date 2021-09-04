<%@page import="java.util.List"%>
<%@page import="kr.smhrd.mapper.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list"); // 바인딩한 것을 꺼내 사용한다
%> --%>
<!-- EL을 사용해서 스크립트릿 사용 X -->
<%-- <% 
	String cpath = request.getContextPath(); // context path를 가져옴 
	// 근데 EL문법으로도 가져올 수가 있다
%> --%>
<!-- JSTL에서 변수 선언 방법 <c:set var="변수명" value="변수값"/> -->
<c:set var="cpath" value ="${pageContext.request.contextPath}"/>
<!-- EL문법 으로 context-root가져오기 -> ${pageContext.request.contextPath} = '/root' -->
<!-- 이제 cpath로 root경로를 설정해두면 context-root값이 바뀌어도 저절로 찾아갈 수 있게된다 -->

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
	
  	function goForm(){
  		// 글쓰기 화면 좀 보여주세요라고 POJO로 요청
  		// location.href = "/web/boardInsertForm.do"; // "/web(context path)/boardInsertForm.do"
  		location.href = "${cpath}/boardInsertForm.do";
  	}
  	function loadJson(){
  		// JS로 서버에 -> /list.do를 요청해서 JSON데이터로 응답을 받아보자
  		// jquery : JS라이브러리, jquery이용해서 ajax(비동기통신)구현
  		// Jquery와 ajax를 사용하면 json 핸들링이 매우 쉽기 때문에 방법을 숙지해주는 것이 좋다
  		$.ajax({
  			url : "${cpath}/list.do", //서버에 요청
  			type : "get",
  			// data : {}, 현재 넘길 데이터 없음
  			dataType: "json", // 받아올 데이터 타입
  			success : resultJson, // callback 함수 : 서버에 요청한 내용에 대한 응답을 받아서 처리하는 함수
  			error : function(){ alert("error"); }			
    	});
  	}
  	function resultJson(data){ // data = [{ 0 },{ 1 },{ 2 },...]
  	// data에서 object하나씩 꺼내서 채워줘야함
  	// 0번에 있는 번호, 제목, 조회수,.. 꺼내서 넣어주고 끝나면 1번 또 끝나면 2번 반복...
  	// 반복문!
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
  		
  			// jQuery
  			// $.each(데이터, 데이터에서 꺼내서 처리할 함수)
  		// $.each(data, function(index, obj){ // index는 자리를 받고, obj는 json을 받는다
  						// 익명함수 : 이름이 없는 함수 
  						// (매개변수) => {실행내용} : 함수형 프로그램 (람다식)
  						// '>' 의 빨간줄은 이클립스 자체오류, 무시하면됨
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

	  	// 내가 원하는 부분에 접근해서 핸들링할 수 있다는 것이 jquery의 큰 장점
	  	// html을 돔구조(트리)로 메모리에 올리기 때문에 jquery에서 검색이 쉽다
	  	// 문법 -> $("식별자").메소드();
  		$("#msg").html(html);
  		
  	}
  		
  	function goDel(idx){
  		// ajax() -> delete.do
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
    	  <!-- EL에서 $+{} : 표현식 -->
    	  <!-- $+{list} : 톰캣의 해석 = request.getAttribute("list"); -->
    	  <!-- vo가 게시글 데이터 하나 -->
    	  <!-- items 객체 내 요소를 var에 한 개씩 대입  -->
    	  <!-- JSTL(태그)을 사용해서 스크립트릿 요소를 제거한다 -->
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
    	<button class = "btn btn-success btn-sm" onclick="loadJson()">JSON DATA LOAD</button>
    	<div id="msg">여기에 JSON데이터를 출력하시오.</div>
    	<button class = "btn btn-primary btn-sm" onclick = "goForm()">글쓰기</button>
    </div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>