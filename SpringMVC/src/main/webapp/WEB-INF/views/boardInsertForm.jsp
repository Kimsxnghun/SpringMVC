<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form class="form-horizontal" action="/action_page.php">
		  <div class="form-group">
		    <label class="control-label col-sm-2">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="title" placeholder="Enter title">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="pwd">Password:</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label><input type="checkbox"> Remember me</label>
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">Submit</button>
		    </div>
		  </div>
		</form>
	</div>
    <div class="panel-footer">빅데이터 2차 김성훈</div>
  </div>
</div>

</body>
</html>