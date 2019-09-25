<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

  <jsp:include page="/WEB-INF/view/header.jsp" />
  </br>

  <h1 class="display-3" align="center">join membership</h1>
  <div class="col-md-5 order-md-1" style="margin:40px auto;">
    <form:form cssClass="order-md-3 form-horizontal" modelAttribute="accountVO" id="signup" action="/sign/up" method="post">

      <div class="mb-3">
        <label>ID</label>
        <form:input cssClass="form-control" path="userid" value="${accountVO.userid}" placeholder="you@example.com" />
        <form:errors path="userid" style="color:red;"/>
      </div>

      <br />

      <div class="row">
        <div class="col-md-6 mb-3">
          <label>Password</label>
          <form:password cssClass="form-control" path="pw" />
          <form:errors path="pw" style="color:red;"/>
        </div>
        <div class="col-md-6 mb-3">
          <label>Password Check</label>
          <input class="form-control" name="pwCheck" />
          <p name="pwCheck" style="color:red;" ></p>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label>Nickname</label>
          <form:input cssClass="form-control" path="nickname" value="${accountVO.nickname}" />
          <p style="color:red;">${nameError}</p>
        </div>
        <div class="col-md-6 mb-3">
          <label>Email</label>
          <form:input type="email" cssClass="form-control" path="email" value="${accountVO.email }" />
          <p style="color:red;">${emailError}</p>
        </div>
      </div>


      <label>Postcode</label>
      <div class="row">
        <div class="col-md-6 mb-3">
          <input type="text" placeholder="Postcode" name="zipcode" class="form-control" value="${accountVO.zipcode}" />
          <p style="color:red;">${zipcodeError}</p>
        </div>
        <div class="col-md-6 mb-3">
          <input type="button" onclick="execDaumPostcode()" value="Postcode Search" class="btn btn-primary" />
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label>Address</label>
          <input type="text" placeholder="Address" name="address" class="form-control" value="${accountVO.address }" />
          <p style="color:red;">${addressError}</p>
        </div>
        <div class="col-md-6 mb-3">
          <label>Address Detail</label>
          <input type="text" placeholder="Address Detail" name="extraaddress" class="form-control"
            value="${accountVO.extraaddress}" />
        </div>
      </div>


      <div class="form-group">
        <div class="col-sm-12  text-center">

          <!-- <a href="/sign/in" class="btn btn-primary btn-primary my-1 my-sm-0"
            onclick="document.getElementById('signup').submit();">
            <span class="fas fa-user-plus mr-1"></span> ok
          </a>
          <a href="/sign/in" class="btn btn-primary btn-danger my-1 my-sm-0">
            <span class="fas fa-undo mr-1"></span> back
          </a> -->

          <input type="submit" value="회원가입" class="btn btn-primary btn-primary my-1 my-sm-0" />
          <input type="reset" value="취소" class="btn btn-primary btn-danger my-1 my-sm-0" />
        </div>
      </div>

  </div>
  </form:form>
  </div>

</layoutTag:layout>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script language="javascript">
  function execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        var address = '';
        if (data.userSelectedType === 'R') {
          address = data.roadAddress;
        } else {
          address = data.jibunAddress;
        }

        var signup = document.forms["accountVO"];
        signup.zipcode.value = data.zonecode;
        signup.address.value = address
        signup.extraaddress.focus();
      }
    }).open();
  }
</script>