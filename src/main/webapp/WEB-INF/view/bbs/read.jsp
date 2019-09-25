<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<%-- <layoutTag:layout> --%>

<!DOCTYPE html>
<html>
  <head>
    <title>BIT 9월 2조 :: 글 읽기</title>
  </head>

<body>

<jsp:include page="/WEB-INF/view/header.jsp" />

  <div class="container">
    <div class="col-xs-12" style="margin: 15px auto;">
			<label style="font-size: 20px;"><span
				class="glyphicon glyphicon-list-alt"></span>글 읽기</label>
		</div>

    <div class="col-xs-12">
      <form action="/writeProc" method="post">
        <dl class="dl-horizontal">
          <dt>제목</dt>
          <dd>${read.title}</dd>

          <dt>작성자</dt>
          <dd>${read.nickname}</dd>

          <dt>등록일</dt>
          <dd>
            <fmt:formatDate value="${read.regDate}"
							pattern="yyyy.MM.dd HH:mm:ss" />
          </dd>

          <dt>조회수</dt>
          <dd>${read.readCount}</dd>

          <dt>수정일</dt>
          <dd>
            <fmt:formatDate value="${read.modifyDate}"
							pattern="yyyy.MM.dd HH:mm:ss" />
          </dd>

          <dt>내용</dt>
          <dd>${read.content}</dd>

          <dt>첨부파일</dt>
          <dd>
            <a href="/bbs/fileDown/${file.bbs_idx}">${file.fileOriName}</a>
          </dd>
      </form>
    </div>

    <div class="btn-group btn-group-sm" role="group" style="float: right;">
      <c:if test="${(sessionScope.signVO != null) && (sessionScope.signVO.idx == read.account_idx)}">
        <button class="btn btn-primary" onclick="location.href='/bbs/update/${read.idx}'">수정</button>
        <button class="btn btn-danger" onclick="location.href='/bbs/delete/${read.idx}'">삭제</button>
      </c:if> 

      <button class="btn btn-primary" onclick="location.href='/bbs'">목록</button>
    </div>

  </div>

  <br/>
  <!--  댓글  -->
  <c:if test="${sessionScope.signVO == null}">
    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bbs_idx" value="${read.idx}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    </c:if>
    <div class="container">
        <div class="commentList"></div>
    </div>

</body>
</html>
<%@ include file="commentS.jsp" %>

<%-- </layoutTag:layout> --%>