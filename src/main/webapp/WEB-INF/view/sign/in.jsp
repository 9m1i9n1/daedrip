<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout/>

<div class="panel-body">
   <form action="/sign/in" method="post">
        <fieldset>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="ID" name="userid"/>
            </div>
            <div class="form-group">
                 <input type="password" class="form-control" placeholder="Password" name="pw"/>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="check"/>아이디 기억
                </label>
            </div>
                <button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
        </fieldset>
    </form>
</div>