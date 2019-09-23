<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout />

<div class="panel-body">
    <form action="/sign/in" method="post">
        <fieldset>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="ID" name="userid" />
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" name="pw" />
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="check" value="false" />아이디 기억
                </label>
            </div>
            <div class="form-group">
                <div class="col-sm-12  text-center">
                    <input type="submit" value="로그인" class="btn btn-success">
                    <input type="button" onclick="location.href='/sign/up'" value="회원가입" class="btn btn-warning">
                </div>
            </div>
        </fieldset>
    </form>
</div>