<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

<!DOCTYPE html>
<html>
  <head>
    <title>BIT 9월 2조 :: 글 수정</title>
  </head>
  
  <body>
    <div class="container">
      <div class="col-xs-12" style="margin: 15px auto;">
        <label style="font-size: 20px;">
        <span class="glyphicon glyphicon-edit"></span>글 수정</label>
      </div> 

      <div class="col-xs-12">
        <form action="/bbs/updateProc" method="post">
        
          <div class="form-group">
            <label for="title">제목</label>
            <input class="form-control" type="text" id="title" name="title" value="${read.title}" />
          </div>
          
          <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="3">${read.content}</textarea>
          </div>

          <input type="hidden" name="idx" value="${idx}" />

          <button type="submit" class="btn btn-primary">수정</button>
        </form>
      </div>
    </div>
  </div>
  </body>
</html>

</layoutTag:layout>