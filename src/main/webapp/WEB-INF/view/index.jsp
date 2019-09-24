<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
  <title>메인 페이지</title>
</head>

<body>

  <c:if test="${sessionScope.signVO == null}">
    <button onclick="location.href='/sign/in'">로그인</button>
  </c:if>
  <c:if test="${sessionScope.signVO != null}">
    ${sessionScope.signVO.getUserId()}<button onclick="location.href='/sign/out'">로그아웃</button>
  </c:if>
</body>

