<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

  <jsp:include page="/WEB-INF/view/header.jsp" />
  </br>

  <h1 class="display-3" align="center">join membership</h1>

  <div class="col-md-5 order-md-1" style="margin:40px auto;">

    <form class="order-md-3" id="signup" class="form-horizontal" action="/sign/up" method="post">

      <div class="mb-3">
        <label>ID</label>
        <input type="email" class="form-control" name="userid" value="${accountVO.id}" placeholder="you@example.com" required/>
        <p style="color:red;">${userIdError}</p>
      </div>

      <br />

      <div class="row">
        <div class="col-md-6 mb-3">
          <label>Password</label>
          <input type="password" class="form-control" name="pw" required/>
          <p style="color:red;">${pwError}</p>
        </div>
        <div class="col-md-6 mb-3">
          <label>Password Check</label>
          <input type="password" class="form-control" name="pwCheck" required/>
          <p style="color:red;">${pwCheckError}</p>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label>Nickname</label>
          <input type="text" class="form-control" name="nickname" value="${accountVO.nickname}" required/>
          <p style="color:red;">${nameError}</p>
        </div>
        <div class="col-md-6 mb-3">
          <label>Email</label>
          <input type="email" class="form-control" name="email" value="${accountVO.email }" required/>
          <p style="color:red;">${emailError}</p>
        </div>
      </div>

      <!-- <div class="row">
      <div class="col-md-6 mb-3">
        <label>Email</label>
        <input type="email" class="form-control" name="email" value="${accountVO.email }" />
        <p style="color:red;">${emailError}</p>
      </div>
    </div> -->


      <label>Postcode</label>
      <div class="row">
        <div class="col-md-6 mb-3">
          <input type="text" placeholder="Postcode" name="zipcode" class="form-control" value="${accountVO.zipcode}" required/>
          <p style="color:red;">${zipcodeError}</p>
        </div>
        <div class="col-md-6 mb-3">
          <input type="button" onclick="execDaumPostcode()" value="Postcode Search" class="btn btn-primary"/>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label>Address</label>
          <input type="text" placeholder="Address" name="address" class="form-control" value="${accountVO.address }" required/>
          <p style="color:red;">${addressError}</p>
        </div>
        <div class="col-md-6 mb-3">
          <label>Address Detail</label>
          <input type="text" placeholder="Address Detail" name="extraaddress" class="form-control"
            value="${accountVO.extraAddress}" required/>
        </div>
      </div>


      <div class="form-group">
        <div class="col-sm-12  text-center">

          <button href="/sign/in" class="btn btn-primary btn-primary my-1 my-sm-0">
            <span class="fas fa-user-plus mr-1"></span> ok
          </button>
          <a href="/" class="btn btn-primary btn-danger my-1 my-sm-0">
            <span class="fas fa-undo mr-1"></span> back
          </a>

          <!-- <input type="submit" value="회원가입" class="btn btn-primary btn-primary my-1 my-sm-0" />
          <input type="reset" value="취소" class="btn btn-primary btn-danger my-1 my-sm-0" /> -->
        </div>
      </div>

  </div>
  </form>
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