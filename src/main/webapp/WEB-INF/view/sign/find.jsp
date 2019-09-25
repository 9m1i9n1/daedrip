<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<layoutTag:layout />

<jsp:include page="/WEB-INF/view/header.jsp" />
<br />
<h1 class="display-3" align="center">ID/Password Find</h1>

<div class="col-md-3 order-md-1" style="margin:40px auto;">
  <fieldset>
    <div class="mb-3 form-group">
      <input type="text" class="form-control" placeholder="Email" name="email_search" />
    </div>

    <br />

    <div class="col-sm-12  text-center">
      <button type='button' onclick="location.href='/'" class="btn btn-primary my-1 my-sm-0">
        <span class="fas fa-search mr-1"></span> Search
      </button>
      <button type='button' onclick="location.href='/sign/in'" class="btn btn-danger my-1 my-sm-0">
        <span class="fas fa-undo mr-1"></span> back
      </button>
    </div>
  </fieldset>
</div>