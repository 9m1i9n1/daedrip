<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<c:if test="${sessionScope.signVO == null}">
  <script>
    alert('로그인을 해주세요!');
    history.go(-1);
  </script>
</c:if>

<layoutTag:layout>


  <jsp:include page="/WEB-INF/view/header.jsp" />
  </br>

<!DOCTYPE html">
<html>
  <head>
    <title>BIT 9월 2조 :: 글쓰기</title>
  </head>

  <h1 class="display-3" align="center">Post Write</h1>

  <div class="col-md-5 order-md-1" style="margin:40px auto;">
    <form class="order-md-3" id="write" class="form-horizontal" action="/bbs/writeProc" method="post" enctype="multipart/form-data">
      <div class="mb-3">
        <label for ="subject">제목</label>
        <input class="form-control" type="text" name="userid" placeholder="제목을 입력하세요."/>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label for = "account_idx">작성자</label>
          <input class="form-control" type="text" value="${sessionScope.signVO.nickname}" disabled/>
          <input type="hidden" value="${sessionScope.signVO.idx}" id="account_idx" name="account_idx" />
        </div>
      </div>

      <div class="mb-3">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="8" placeholder="내용을 입력하세요."></textarea>
      </div>

      <div class="form-group mb-3">
        <label for ="subject">파일 업로드</label>
        <input class="form-control" type="file" name="files"/>
      </div>

      <%-- <div class="form-group">
        <div class="col-sm-12  text-center">
          <a href="/sign/in" class="btn btn-primary btn-primary my-1 my-sm-0"
            onclick="document.getElementById('write').submit();">
            <span class="fas fa-user-plus mr-1"></span> 작성
          </a>
        </div>
      </div>  --%>

      <div class="form-group">
        <div class="col-sm-12  text-center">
          <input type="submit" value="작성" class="btn btn-primary btn-primary my-1 my-sm-0" />
        </div>
      </div>
 
    </form>
  </div>
</html>

</layoutTag:layout>