<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="commentVO" items="${comments}">
  <div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">
    <div class="commentInfo">댓글번호 : ${commentVO.idx} / 작성자 : ${commentVO.nickname}
      <c:if test="${sessionScope.signVO.idx == commentVO.account_idx}">
        <button onclick="commentUpdate('${commentVO.idx}','${commentVO.content}');"> 수정 </button>
        <button onclick="commentDelete('${commentVO.idx}');"> 삭제 </button>
      </c:if>
    </div>
    <div class="commentContent${commentVO.idx}">
      <p> 내용 : ${commentVO.content}</p>
    </div>
  </div>
</c:forEach> 