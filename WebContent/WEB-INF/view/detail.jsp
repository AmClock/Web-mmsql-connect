<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>detail</title>
<c:import url="/WEB-INF/temp/link.jsp"></c:import>
<link rel="stylesheet" href="/css/detail.css" />
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/temp/head.jsp"></c:import>
		 <div id="writeBox">
        	<div id="writeBtnBox">
		<c:if test="${loginUser.no==view.userNo}">
        		<a href="/update/article/${view.no }"><button>수정</button></a> 
        		<form action="/delet/article/${view.no }" method="POST" style="display: inline-block">
                <input type="hidden" name="_method" value="DELETE"/>
        			<button>삭제</button>
        		</form><!-- // form end -->
		</c:if>
        	</div><!-- //writeBtnBox end -->
    	</div><!-- //writeBox end -->
		<div id="contensBox">
			<div id="titleWrap">
				<span class="text_title">제목</span>
				<div id="titleBox" class="over_out" >${view.title }</div>
			</div><!-- // titleWrap end -->
			<div>
				<span class="text_span">작성자 </span>:<span style="margin-left: 10px"> ${view.nickname }</span>
				<span class="text_span" style="margin-left: 10px">작성 날짜 </span>:<span style="margin-left: 10px"> ${view.regdate }</span>
			</div>
			<div id="contenWrap">
				<span class="text_title">내용</span>
				<div id="contenBox" class="text_out">${view.content }</div>
			</div><!-- //contentWrap end -->
		</div><!-- // contentsBox end -->
	</div><!-- //wrap end  -->
</body>
</html>