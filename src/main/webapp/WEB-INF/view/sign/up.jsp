<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout />

<form id="signup" class="form-horizontal" action="/sign/up" method="post">
  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>아이디</label>
    </div>
    <div class="col-sm-6 text-left">
      <input type="text" class="form-control" name="userid" value="${accountVO.id}" />
      <p style="color:red;">${userIdError}</p>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>패스워드</label>
    </div>
    <div class="col-sm-6">
      <input type="password" class="form-control" name="pw" />
      <p style="color:red;">${pwError}</p>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>패스워드 체크</label>
    </div>
    <div class="col-sm-6">
      <input type="password" class="form-control" name="pwCheck" />
      <p style="color:red;">${pwCheckError}</p>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>이름</label>
    </div>
    <div class="col-sm-6">
      <input type="text" class="form-control" name="nickName" value="${accountVO.name}" />
      <p style="color:red;">${nameError}</p>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>이메일</label>
    </div>
    <div class="col-sm-6">
      <input type="email" class="form-control" name="email" value="${accountVO.email }" />
      <p style="color:red;">${emailError}</p>
    </div>
  </div>


  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>우편번호</label>
    </div>
    <div class="col-sm-3">
      <input type="text" placeholder="우편번호" name="zipcode" class="form-control" value="${accountVO.zipcode}" />
      <p style="color:red;">${zipcodeError}</p>
    </div>
    <div class="col-sm-3">
      <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" />
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>주소</label>
    </div>
    <div class="col-sm-6">
      <input type="text" placeholder="주소" name="address" class="form-control" value="${accountVO.address }" />
      <p style="color:red;">${addressError}</p>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-2 control-label">
      <label>상세주소</label>
    </div>
    <div class="col-sm-6">
      <input type="text" placeholder="상세주소" name="extraaddress" class="form-control"
        value="${accountVO.extraAddress}" />
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-12  text-center">
      <input type="submit" value="회원가입" class="btn btn-success" />
      <input type="reset" value="취소" class="btn btn-warning" />
    </div>
  </div>
</form>

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

        var signup = document.forms["signup"];
        signup.zipcode.value = data.zonecode;
        signup.address.value = address
        signup.extraaddress.focus();
      }
    }).open();
  }
</script>