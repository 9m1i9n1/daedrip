<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">

		<div class="navbar-header">
			<button type=button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">토글 네비게이션</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">귀한 Spring Boot로 맨든 게시판</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="active">
					<a href="/">게시판 1</a>
				</li>
				<li>
					<a href="/">게시판 2</a>
				</li>
				<li>
					<a href="/">게시판 3</a>
				</li>
				<li>
					<c:if test="${sessionScope.signVO == null}">
						<a href="#myModal" class="trigger-btn" data-toggle="modal">SignIn</a>
					</c:if>
					<c:if test="${sessionScope.signVO != null}">
						<a href="#myModal" class="trigger-btn" data-toggle="modal">SignOut</a>
					</c:if>
					<li />
			</ul>
		</div>
	</div>
</nav>
<div>
</div>
<div id="myModal" class="modal fade" style="display: none;">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Member Login</h4>
			</div>
			<div class="modal-body">
				<form action="/sign/in" method="post">
					<div class="form-group">
						<i class="fa fa-user"></i>
						<input type="text" name="userid" class="form-control" placeholder="Username" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i>
						<input type="password" name="pw" class="form-control" placeholder="Password" required="required">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<a href="#">Forgot Password?</a>
			</div>
		</div>
	</div>
</div>