<%@page import="java.util.List"%>
<%@page import="kr.smhrd.mapper.BoardVO"%>
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
  		html+="<td>수정</td>";  		
  		html+="<td>삭제</td>";  		
  		html+="</tr>";

  		$.each(data, (index, obj)=>{ // index는 자리를 받고, obj는 json을 받는다 
  			html+="<tr>";
  	  		html+="<td id='idx"+index+"'>"+obj.idx+"</td>";
  	  		html+="<td id='title"+index+"'><a href='javascript:onview("+index+")'>"+obj.title+"</a></td>";
  	  		// 눌렀을 때 서버를 이동하는 것이 아니라 javascript에서 게시물을 보여줘야함 -> <a href='javascript:onview()'>
  	  		// div에서 보여주기 때문에 div에 id를 걸어준다 -> <div id='onview"+index+"' style='display:none'>
  	  		// json으로 가져온 값들 중 선택하는 것이기 때문에 index를 활용한다
  	  		html+="<td>"+obj.count+"</td>";
  	  		html+="<td id='writer"+index+"'>"+obj.writer+"</td>";
  	  		html+="<td>"+obj.indate+"</td>";
  	  		html+="<td id='update"+index+"'><button class='btn btn-info btn-sm' onclick='goUpdate("+index+")'>수정</button></td>";
  	  		html+="<td><button class='btn btn-warning btn-sm' onclick='goDel("+obj.idx+")'>삭제</button></td>";
  	  		html+="</tr>";
  	  		html+="<tr>";
  	  		html+="<td colspan='7'><div id='onview"+index+"' style='display:none'><textarea rows='5' class='form-control' id='contents"+index+"'>"+obj.contents+"</textarea><button class='btn btn-info btn-sm' onclick='goContent("+index+")'>내용수정</button></div></td>";
  	  		html+="</tr>";
  		})
  		html+="</table>";

  		$(".list").html(html); // text 변경	
  	}
  	
  	// 게시물 내용 수정 메소드
  	function goContent(index){ // 사용자가 선택한 게시물이 무엇인지 알기 위해 index값을 이용
  		var idx =$("#idx"+index).text(); // 어떤 글을 수정할 지 고유번호로 지정 
  		var contents =$("#contents"+index).val(); // 수정할 컨텐츠의 내용 // text()가 아닌 val()을 통해 textarea(form)안의 value값을 가져온다
  		$.ajax({
  			url:"${cpath}/conUpdate.do",
  			type:"post",
  			data:{"idx":idx, "contents":contents},
  			success:loadJson,
  			error:function(){alert("error");}  			
  		});
  	}
  	
  	// 게시물 눌렀을 때 게시물 내용 확인하는 메소드
  	function onview(index){
  		if ($("#onview"+index).css('display') == 'block') { // display값이 block인 경우
            $("#onview"+index).slideUp(); // hide() 메소드와 같은 기능
        } else { // display값이 block이 아닌경우
            $("#onview"+index).slideDown(); // show() 메소드와 같은 기능
        }
  	}
  	
  	// 게시물 수정할 수 있도록 ui를 바꾸는 메소드
  	function goUpdate(index){ 
  		// 수정버튼을 눌렀을 때 버튼을 누른 글을 찾아가는 것이 관건
  		// 게시글 고유 번호도 이용할 수 있지만, json객체의 index를 이용할 수도 있다 **
  		
  		// title과 writer에 id로 접근해보자 
  		// "<td id='title'>" -> 문제점 : 반복문으로 출력하기 때문에 id가 중복된다
  		// index를 id값에 넣는 방법을 활용해서 해결! -> "<td id='title"+index+"'>"
  		
  		var title=$("#title"+index).text();
  		var writer=$("#writer"+index).text();		
  		// alert(title + writer);
  		
  		var newTitle = "<input type='text' value='"+title+"' class='form-control' id='newTitle"+index+"'>"
  		//value를 설정해 기존 값을 유지
  		$("#title"+index).html(newTitle); // 수정하기 눌렀을 때 textbox로 바꿔준다
  		var newWriter = "<input type='text' value='"+writer+"' class='form-control' id='newWriter"+index+"'>"
  		$("#writer"+index).html(newWriter);
  		
  		// '수정'버튼 눌렀을 때 버튼을 '수정하기'버튼으로 바꿔준다
  		// '수정하기'버튼 눌렀을 때 수정된 값을 서버로 보낼 수 있도록 이벤트 설정해준다 -> onclick='update()'
  		var newBtn = "<button class='btn btn-success btn-sm' onclick='update("+index+")'>수정하기</button>"
  		// td에 접근하기 위해 name을 설정해줘야함 -> "<td id='update"+index+"'>
  		$('#update'+index).html(newBtn);
  		
  	}	
  	
  	// 수정한 게시물을 저장하는 메소드
  	function update(index){ // index로 접근
  		// '수정하기'버튼 눌렀을 때 값을 서버로 보내기 위해 input에 접근해야함 -> <input ... id='newTitle"+index+"'>
  		var idx = $('#idx'+index).text(); // 어떤 글을 수정할 것인지 알기 위해 고유번호 보내줘야함
  		var title = $('#newTitle'+index).val(); // text()는 태그와 태그 사이에 있는 문자를 가져오기 때문에 input에 적은 값은 못 가져온다
  		var writer = $('#newWriter'+index).val(); // val()을 통해 input에 적은 value값을 보내줘야함
  		// ajax로 서버에 보내준다
  		$.ajax({
  			url:"${cpath}/update.do",
  			type:"post",
  			data:{"title":title, "writer":writer, "idx":idx}, // 기존에 쓰던 update랑 조금 다르다!
  			success:loadJson,
  			error:function(){alert("error");}
  		});
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
  	
  	// 게시물을 작성할 수 있는 ui를 보여주는 메소드
  	function goWrite(){
  		// css속성 변경
  		$(".list").css("display","none"); // 글쓰기 할 때는 글 목록을 지워준다
  		$(".write").css("display","block");
  		// 글 쓴 후 문제점 ! 글을 쓴 후 다시 글쓰기를 누르면 이전에 썼던 글이 남아있다
  		$("#reset").trigger("click"); // trigger("이벤트") -> 이벤트를 발생 시킴
  	} 	
  	
  	// 수정한 게시물을 저장하는 메소드
  	function goInsert(){
  		var frmData = $("#frm").serialize(); // serialize() -> form에 있는 parameter 한 번에 가져와서 직렬화 (get방식)
  		// alert(frmData);
  		$.ajax({
  			url:"${cpath}/insert.do", // Json방식으로 보내기 때문에 기존의 POJO가 아닌 restController로 보내야한다
  			type:"post",
  			data:frmData, // 직렬화 시켰기 때문에 그대로 보낼 수 있다
  			success:loadJson,
  			error:function(){alert("error")}
  		});
  		$(".list").css("display","block"); // 글쓰기가 완료되면 리스트를 보여주고
  		$(".write").css("display","none"); // 글쓰기폼을 지운다
  	}
  	

  </script>
</head>
<body>
   
<div class="container">
  <h2>Spring MVC BOARD (AJAX)</h2>
  <div class="panel panel-default">
    <div class="panel-heading"><button class="btn btn-primary btn-sm" onclick = "goWrite()">글쓰기</button></div>
    <div class="panel-body">  
    <!-- style="visibility:hidden;" : 여백 있는 채로 숨김 , style="display:none;" : 여백 없이 숨김   -->
      <!-- 기본값은 안보이게 해두고 노출시키고 싶을 때 javaScript에서 css속성을 block으로 바꿔 노출시킨다 -->
      <div class="list" style="display: block;">리스트화면</div> 
      <div class="write" style="display: none;">
      
        <!-- ajax로 처리해줄 것이기 때문에 action, method 사용하지 않고 id를 사용한다 -->
        <form class="form-horizontal" id="frm">
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
		    
		      <!-- type="submit"을 하면 url이 바뀌어 버리기 때문에 ajax로 처리해줘야한다 -->
		      <!-- <button type="submit" class="btn btn-primary btn-sm">저장</button> -->
		      <button type="button" class="btn btn-primary btn-sm" onclick="goInsert()">저장</button>
		      <button type="reset" class="btn btn-warning btn-sm" id="reset">취소</button>
		    </div>
		  </div>
		</form>  
      </div>
    </div>
    <div class="panel-footer">빅데이터 2차 (김성훈)</div>
  </div>
</div>

</body>
</html>