<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>BIT 9월 2조 :: 글 읽기</title>
  </head>
  <body>
    <div>
      <form action="/writeProc" method="post">
        <div>
          <label>제목</label>
          <p>${read.title}</p>
        </div>

        <div>
          <label>작성자</label>
          <p>${read.account_idx}</p>
        </div>

        <div>
          <label>작성일</label>
          <p>${read.regdate}</p>
        </div>

        <div>
          <label>내용</label>
          <p>${read.content}</p>
        </div>

        <button type="submit">작성</button>

      </form>
    </div>

  </body>
</html>
