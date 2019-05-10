<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>
<c:choose>
<c:when test="${view==null }">
작성
</c:when>
<c:otherwise>
수정
</c:otherwise>
</c:choose>
</title>
<c:import url="/WEB-INF/temp/link.jsp"></c:import>
<link rel="stylesheet" href="/css/form.css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/temp/head.jsp"></c:import>
		<form  action="/write/article" method="POST" id="contentsBox">
			<div id="titleBox">
				<label><span>제목</span><input name="title" value="${view.title }"/></label>
			</div><!-- //titleBox end -->
			<div id="contentBox">
				<label><span>내용</span><textarea name="content"><c:if test="${view!=null }">${view.content }</c:if></textarea></label>
			</div><!-- //cotentBox end  -->
			<div id="contentBtnBox">
				<c:choose>
				<c:when test="${view==null }">
				<button>작성하기</button>
				</c:when>
				<c:otherwise>
				<input type="hidden" name="_method" value="PUT"/>
				<input type="hidden" name="no" value="${view.no }"/>
				<button>수정하기</button>
				</c:otherwise>
				</c:choose>
			</div><!-- //contentBtnBox end  -->
		</form><!--//form end  -->
	</div><!-- //wrap end -->

</body>
</html>