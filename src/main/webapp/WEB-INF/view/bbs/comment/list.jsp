<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="commentVO" items="${comments}">
  <div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">
    <div class="commentInfo">댓글번호 : ${commentVO.idx} / 작성자 : ${commentVO.accoun_idx}
      <a href=""> 수정 </a>
      <a href=""> 삭제 </a>
    </div>
    <div class="commentContent">
      <p> 내용 : </p>
    </div>
  </div>
</c:forEach>