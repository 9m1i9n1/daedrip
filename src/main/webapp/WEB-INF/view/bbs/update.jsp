<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>BIT 9월 2조 :: 글 수정</title>
  </head>
  
  <body>
    <div>
      <form action="/bbs/updateProc" method="post">
        <div>
          <label for="title">제목</label>
          <input type="text" id="title" name="title" value="${read.title}" />
        </div>
        
        <div>
          <label for="content">내용</label>
          <textarea id="content" name="content" rows="3">${read.content}</textarea>
        </div>

        <input type="hidden" name="idx" value="${idx}" />

        <button type="submit">수정</button>
      </form>
    </div>

  </body>
</html>
