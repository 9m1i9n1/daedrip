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
            <tr>
              <td>${p.idx}</td>
              <td>
                <a href="bbs/read/${p.idx}">
                  ${p.title}
                </a>
              </td>
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

        <%-- Page 처리 --%>
      <div>
        <ul>
          <c:if test="${pageMakeVO.prev}">
            <li><a href="${path}?page=${pageMakeVO.startPage - 1}">이전</a></li>
          </c:if>

          <c:forEach begin="${pageMakeVO.startPage}" end="${pageMakeVO.endPage}" var="idx">
            <li>
              <%-- 'class=active' 부분에 현재 클릭되어있다는 css 넣어주세요~ 성자이너님~! --%>
              <%-- <c:out value="${pageMakeVO.pageVO.page == idx ? 'class=active' : ''}" /> --%>
              <c:out value="${pageMakeVO.pageVO.page == idx ? '' : ''}" />
              <a href="${path}?page=${idx}">${idx}</a>
            </li>
          </c:forEach>

          <c:if test="${pageMakeVO.next && pageMakeVO.endPage > 0}">
            <li><a href="${path}?page=${pageMakeVO.endPage + 1}">다음</a></li>
          </c:if>
        </ul>
      </div>

    </body>
  </html>
</layoutTag:layout>
