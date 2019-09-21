<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>BIT 9월 2조 :: 글 목록</title>
  </head>
  <body>
    <div>
      <table>
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
              <tr onclick="location.href='bbs/read/${p.idx}'">
                  <td>${p.idx}</td>
                  <td>${p.title}</td>
                  <td>${p.account_idx}</td>
                  <td>${p.content}</td>
                  <td>${p.readcount}</td>
                  <td>${p.regdate}</td>
                  <td>${p.modifydate}</td>
              </tr>
          </c:forEach>
      </table>
    </div>

    <button onclick="location.href='/bbs/write'>글작성</button>
  </body>
</html>
