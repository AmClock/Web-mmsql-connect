<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <c:import url="/WEB-INF/temp/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/join.css"/>
</head>
<body>
<div id="wrap">
    <div id="logoBox">
        <a href="/main"><img src="/img/logo.jpg"></a>
    </div><!-- // logoBox end -->
    <div id="joinBox">
         <form action="/join/user" method="POST">
         	<input type="hidden" name="referer" value="${referer }"/>
            <label><span>아이디</span><input id="id" name="id" type="text"/></label>
            <label><span>비밀번호</span><input id="pwd" name="pwd" type="password" /></label>
            <label><span>닉네임</span><input id="nickname" name="nickname" type="text"/></label>
            <button>완료</button>
        </form><!-- //form end  -->
    </div><!-- //joinBox end  -->
</div><!-- //wrap end -->
</body>
</html>