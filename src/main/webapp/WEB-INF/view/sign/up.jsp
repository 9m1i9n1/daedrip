<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout />

<div class="col-sm-6 col-md-offset-3">
  <form id="signup" action="/sign/up">
    <div class="form-group">
      <label for="userid">아이디</label>
      <input type="text" class="form-control" name="userid" placeholder="아이디를 입력해 주세요">
    </div>
    <div class="form-group">
      <label for="InputEmail">이메일 주소</label>
      <input type="email" class="form-control" name="" placeholder="이메일 주소를 입력해주세요">
    </div>
    <div class="form-group">
      <label for="inputPassword">비밀번호</label>
      <input type="password" class="form-control" name="" placeholder="비밀번호를 입력해주세요">
    </div>
    <div class="form-group">
      <label for="inputPasswordCheck">비밀번호 확인</label>
      <input type="password" class="form-control" name="" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
    </div>
    <div class="form-group">
      <label for="inputMobile">휴대폰 번호</label>
      <input type="tel" class="form-control" name="" placeholder="휴대폰번호를 입력해 주세요">
    </div>
    <div class="form-group">
      <label for="inputtelNO">사무실 번호</label>
      <input type="tel" class="form-control" name="" placeholder="사무실번호를 입력해 주세요">
    </div>

    <div class="form-group">
      <label>약관 동의</label>
      <div data-toggle="buttons">
        <label class="btn btn-primary active">
          <span class="fa fa-check"></span>
          <input id="agree" type="checkbox" autocomplete="off" checked>
        </label>
        <a href="#">이용약관</a>에 동의합니다.
      </div>
    </div>

    <div class="form-group text-center">
      <button type="submit" id="join-submit" class="btn btn-primary">
        회원가입<i class="fa fa-check spaceLeft"></i>
      </button>
      <button type="submit" class="btn btn-warning">
        가입취소<i class="fa fa-times spaceLeft"></i>
      </button>
    </div>
  </form>
</div>


<form id="signup" action="/sign/up" method="post">
  <div>
    <label for="userid">userid</label>
    <input type="text" name="userid">
  </div>
  <div>
    <label for="pw">pw</label>
    <input type="text" name="pw" />
  </div>
  <div>
    <label for="email">email</label>
    <input type="email" name="email">
  </div>
  <div>
    <label for="nickname">nickname</label>
    <input type="text" name="nickname" />
  </div>
  <div>
    <div>
      <label for="zipcode">zipcode</label>
      <input type="text" name="zipcode" readonly="readonly" />
    </div>
    <div>
      <label for="address">address</label>
      <input type="text" name="address" readonly="readonly" />
    </div>
    <div>
      <label for="extraaddress">extraaddress</label>
      <input type="text" name="extraaddress" />
    </div>
    <div>
      <button type="button" onclick="execDaumPostcode()">우편번호 찾기</button>
    </div>
  </div>
  <div>
    <button>회원가입</button>
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