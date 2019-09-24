<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <%-- <%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%> --%> -->
<layoutTag:layout />

<!DOCTYPE html>
<html>

<head>
  <title>BIT 9월 2조 :: 글 목록</title>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
    integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <link rel="stylesheet" href="../../css/bootstrap4-daydream.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans|Oswald|Shadows+Into+Light" rel="stylesheet">

</head>

<body align="center" style="margin: auto;">

  <jsp:include page="/WEB-INF/view/header.jsp" />

  <!-- <div class="container">
    <div class="col-xs-12" style="margin: 15px auto;">
      <label style="font-size: 20px;"><span class="glyphicon glyphicon-list-alt"></span>게시글 목록</label>
    </div> -->
  <br />
  <h1 class="display-3" align="center">Post List</h1>
  <br />

  <div class="col-sm-8" style="margin: auto;">
    <table class=" table table-hover table-striped">
      <tr class=" bg-primary" align="center">
        <th>글 번호</th>
        <th>제목</th>
        <th>작성자</th>
        <!-- <th>내용</th> -->
        <th>조회수</th>
        <th>등록일</th>
        <!-- <th>수정일</th> -->
      </tr>

      <c:forEach var="p" items="${list}">
        <tr onclick="location.href='/bbs/read/${p.idx}'">
          <td align="center">${p.idx}</td>
          <td>${p.title}</td>
          <td align="center">${p.nickname}</td>
          <!-- <td>${p.content}</td> -->
          <td align="center">${p.readCount}</td>
          <td align="center">
            <fmt:formatDate value="${p.regDate}" pattern="yyyy.MM.dd HH:mm:ss" />
          </td>
          <!-- <td>
            <fmt:formatDate value="${p.modifyDate}" pattern="yyyy.MM.dd HH:mm:ss" />
          </td> -->
        </tr>
      </c:forEach>
    </table>
  </div>

  <%-- Page 처리 --%>
  <div align="center">
    <ul class="pagination" style="justify-content: center;">
      <c:if test="${pageMakeVO.prev}">
        <li class="page-item"><a class="page-link" href="${path}?page=${pageMakeVO.startPage - 1}">이전</a></li>
      </c:if>

      <!-- <c:forEach begin="${pageMakeVO.startPage}" end="${pageMakeVO.endPage}" var="idx">
        <li class="page-item">
          <c:out value="${pageMakeVO.pageVO.page == idx ? '' : ''}" />
          <a class="page-link" href="${path}?page=${idx}">${idx}</a>
        </li>
      </c:forEach> -->
      <c:forEach begin="${pageMakeVO.startPage}" end="${pageMakeVO.endPage}" var="idx">
        <li class="page-item">
          <c:out value="${pageMakeVO.pageVO.page == idx ? '' : ''}" />
          <a class="page-link" href="${path}?page=${idx}">${idx}</a>
        </li>
      </c:forEach>

      <c:if test="${pageMakeVO.next && pageMakeVO.endPage > 0}">
        <li class="page-item"><a class="page-link" href="${path}?page=${pageMakeVO.endPage + 1}">다음</a></li>
      </c:if>
    </ul>
  </div>

  <!-- <button class="btn btn-primary btn-sm" style="margin: auto;" onclick="location.href='/bbs/write'">글쓰기</button> -->
  <div align="center">
    <c:if test="${sessionScope.signVO != null}">
      <a href="/bbs/write" class="btn btn-primary">글쓰기</a>
    </c:if>
  </div>
</body>

</html>
</layoutTag:layout>
