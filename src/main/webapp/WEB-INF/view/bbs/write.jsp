<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
  <head>
    <title>BIT 9월 2조 :: 글쓰기</title>
  </head>
  <body>
    <h2>글 작성</h2>

    <div>
      <form action="/bbs/writeProc" method="post" enctype="multipart/form-data">
        <div>
          <label for ="subject">제목</label>
          <input type="text" id="title" name="title" />
        </div>

        <div>
          <label for = "account_idx">작성자</label>
          <input type="text" id="account_idx" name="account_idx" />
        </div>

        <div>
          <label for="content">내용</label>
          <textarea id="content" name="content" rows="3"></textarea>
        </div>

        <input type="file" name="files"/>

        <button type="submit">작성</button>
      </form>
    </div>
  </body>
</html>
