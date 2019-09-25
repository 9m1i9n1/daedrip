<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

<!DOCTYPE html>
<html>
  <head>
    <title>BIT 9월 2조 :: 글 읽기</title>
  </head>

<body>

<jsp:include page="/WEB-INF/view/header.jsp" />
<br/>
<h1 class="display-3" align="center">Post Read</h1>

  <!-- <div class="container"> -->
        <!-- <div class="col-xs-12" style="margin: 15px auto;">
          <label style="font-size: 20px;"><span
            class="glyphicon glyphicon-list-alt"></span>글 읽기</label>
        </div> -->

    <div class="col-md-5 order-md-1" style="margin:40px auto;">
      <div>
        <form class="order-md-3 form-horizontal" id="writeread" action="/writeProc" method="post" enctype="multipart/form-data">
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
    
    

    <!-- <div class="col-xs-12">
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
    </div> -->

 <!-- <%-- <c:if test="${(sessionScope.signVO != null) && (sessionScope.signVO.idx == read.account_idx)}">
    <div role="group" style="float: right;">
        <button href="/bbs/update/${read.idx}" class="btn btn-sm btn-primary my-1 my-sm-0" onclick="location.href='/bbs/update/${read.idx}'">
          <span class="fas fa-edit mr-1"></span> Edit
        </button>
        
        
        <button href="/bbs/delete/${read.idx}" class="btn btn-sm btn-danger my-1 my-sm-0">
          <span class="fas fa-trash mr-1"></span> Delete
        </button>


        <button href="/bbs" class="btn btn-sm btn-primary my-1 my-sm-0" onclick="location.href='/bbs'">
          <span class="fas fa-bars mr-1"></span> List
        </button>
      </div>
    </c:if> --%> -->


    <div role="group" style="float: right;">
      <div class="row">
          <c:if test="${(sessionScope.signVO != null) && (sessionScope.signVO.idx == read.account_idx)}">
            <div>
              <a href="/bbs/update/${read.idx}" class="btn btn-sm btn-primary my-1 my-sm-0">
                <span class="fas fa-edit mr-1"></span> Edit
              </a>
            </div>
            
            <div>
              <form action="/bbs/delete/${read.idx}" method="post">  
                <input type="hidden" name="account_idx" value=${read.account_idx} />
                <button class="btn btn-sm btn-danger my-1 my-sm-0">
                  <span class="fas fa-trash mr-1"></span> Delete
                </button>   
              </form>
            </div>
          </c:if>
          <div>
            <a href="/bbs" class="btn btn-sm btn-primary my-1 my-sm-0" onclick="location.href='/bbs'">
              <span class="fas fa-bars mr-1"></span> List
            </a>
          </div>
      </div>
    </div>

  <!--  댓글  -->
  <c:if test="${sessionScope.signVO != null}">
    <div>
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bbs_idx" value="${read.idx}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요." required>

               <span class="input-group-btn">
                    <button class="btn btn-sm btn-primary my-1 my-sm-0" type="button" name="commentInsertBtn">등록</button>
               </span>
            </div>
        </form>
    </div>
  </c:if>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
</div>
</body>
</html>
<%@ include file="commentS.jsp" %>

</layoutTag:layout>