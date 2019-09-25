<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<layoutTag:layout />

<jsp:include page="/WEB-INF/view/header.jsp" />
<br />
<h1 class="display-3" align="center">ID/Password Search</h1>

<div class="col-md-3 order-md-1" style="margin:40px auto;">
  <fieldset>
    <div class="mb-3 form-group">
      <input type="text" class="form-control" placeholder="Email" name="email_search" />
    </div>

    <div class="col-sm-12  text-center">
      <button type='button' onclick="location.href='/'" class="btn btn-primary my-1 my-sm-0">
        <span class="fas fa-search mr-1"></span> Search
      </button>
    </div>
  </fieldset>
</div>