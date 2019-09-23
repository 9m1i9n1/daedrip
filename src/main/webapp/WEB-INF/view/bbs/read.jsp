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
          <p>${read.regDate}</p>
        </div>

        <div>
          <label>내용</label>
          <p>${read.content}</p>
        </div>

        <div>
          <label>첨부파일</label>
          <p><a href="/bbs/fileDown/${file.bbs_idx}">${file.fileOriName}</a></p>
        </div>

        <button type="submit">작성</button>

      </form>
    </div>

    <button onclick="location.href='/bbs/update/${read.idx}'">수정</button>

    <button onclick="location.href='/bbs/delete/${read.idx}'">삭제</button>

  </body>
</html>
