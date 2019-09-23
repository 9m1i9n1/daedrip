<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

  <!DOCTYPE html>
  <html>
    <head>
      <title>BIT 9월 2조 :: 글 목록</title>
    </head>

    <body>
      <div class="container">
        <div class="col-xs-12" style="margin: 15px auto;">
          <label style="font-size: 20px;"><span class="glyphicon glyphicon-list-alt"></span>게시글 목록</label>
        </div>

        <div class="col-xs-12">
        <table class="table table-hover">
          <tr>
            <th>글 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>조회수</th>
            <th>등록일</th>
            <th>수정일</th>
          </tr>

          <c:forEach var="p" items="${list}">
            <tr onclick="location.href='/bbs/read/${p.idx}'">
              <td>${p.idx}</td>
              <td>${p.title}</td>
              <td>${p.account_idx}</td>
              <td>${p.content}</td>
              <td>${p.readCount}</td>
              <td><fmt:formatDate value="${p.regDate}"
								pattern="yyyy.MM.dd HH:mm:ss" /></td>
              <td><fmt:formatDate value="${p.modifyDate}"
								pattern="yyyy.MM.dd HH:mm:ss" /></td>
            </tr>
          </c:forEach>
        </table>
      </div>

      
      <button class="btn btn-primary btn-sm" style="float: right;"
        onclick="location.href='/bbs/write'">글쓰기</button>
    </body>
  </html>
</layoutTag:layout>
