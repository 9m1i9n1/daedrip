<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

<!DOCTYPE html">
<html>
  <head>
    <title>BIT 9월 2조 :: 글쓰기</title>
  </head>

    <div class="container">
      <div class="col-xs-12" style="margin:15px auto;">
          <label style="font-size:20px;"><span class="glyphicon glyphicon-edit"></span>글 쓰기</label>
      </div>

      <div class="col-xs-12">
      <form action="/bbs/writeProc" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label for ="subject">제목</label>
          <input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력하세요."/>
        </div>

        <div class="form-group">
          <label for = "account_idx">작성자</label>
          <input class="form-control" type="text" id="account_idx" name="account_idx" />
        </div>

        <div class="form-group">
          <label for="content">내용</label>
          <textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력하세요."></textarea>
        </div>
        
        <div class="form-group">
          <label for=file">파일 업로드</label>
          <input class="form-control" type="file" name="files"/>
        </div>

        <button type="submit" class="btn btn-primary btn-sm" style="float:right;">작성</button>
      </form>
      </div>
    </div>
</html>

</layoutTag:layout>