<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout />

<jsp:include page="/WEB-INF/view/header.jsp" />
<br/>
<h1 class="display-3" align="center">Login</h1>

<div class="col-md-3 order-md-1" style="margin:40px auto;">
  <form class="order-md-3" id="signup" class="form-horizontal" action="/sign/in" method="post">
    <fieldset>
      <div class="mb-3 form-group">
        <input type="text" class="form-control" placeholder="ID" name="userid" />
      </div>

      <div class="mb-3">
        <input type="password" class="form-control" placeholder="Password" name="pw" />
      </div>

      <div class="custom-control custom-checkbox">
        <input type="checkbox" name="check" value="false" class="custom-control-input" id="customCheck1" />
        <label class="custom-control-label" for="customCheck1">아이디 기억</label>        
        <%-- <a href="#" style="text-align:right;">find</a> --%>
      </div>

      <div><h1></h1></div>

      <%-- <div class="custom-control custom-checkbox">
        <input type="checkbox" name="check" value="false" class="custom-control-input" id="customCheck1">
        <label class="custom-control-label" for="customCheck1">Check this custom checkbox</label>
      </div> --%>
      
      <div class="col-sm-12  text-center">
       <button class="btn btn-primary my-1 my-sm-0">
         <span class="fas fa-user-check mr-1"></span> Login
       </button>
       <button type='button' onclick="location.href='/sign/up'" class="btn btn-primary btn-danger my-1 my-sm-0">
         <span class="fas fa-user-plus mr-1"></span> SingUp
        </button>
       </div>
    </fieldset>
  </form>
</div>


<%-- <div class="panel-body">
    <form action="/sign/in" method="post">
        <fieldset>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="ID" name="userid" />
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" name="pw" />
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="check" value="false" />아이디 기억
                </label>
            </div>
            <div class="form-group">
                <div class="col-sm-12  text-center">
                    <input type="submit" value="로그인" class="btn btn-success">
                    <input type="button" onclick="location.href='/sign/up'" value="회원가입" class="btn btn-warning">
                </div>
            </div>
        </fieldset>
    </form>
</div> --%>
