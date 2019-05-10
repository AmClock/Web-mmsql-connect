<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div id="headWrap">

        <div id="logoBox">
           <a href="/">
           <img src="/img/logo.jpg">
           </a> 
        </div><!--//logobox end-->

        <div id="btnBox">
            <div id="loginBox"
            <c:if test="${loginUser !=null }">
          	 style="float: right"
            </c:if>
            >
            <c:choose>
            	 <c:when test="${loginUser==null }">
                <form action="/login" method="POST">
                    <input name="id" type="text"/>
                    <input name="pwd" type="password"/>
                    <button>로그인</button>
                </form>
            	</c:when>
            	<c:otherwise>
            		 <div id="loginProfile">
            		 	<span>닉네임 :</span><span style="margin-left: 10px">${loginUser.nickname }</span>
            		 </div>
              		 <a href="/logout"><button>로그아웃</button></a>
            	</c:otherwise>
            </c:choose>
            </div><!--//loginBox end-->
            <c:if test="${loginUser == null }">
            <div id="joinBox">
                <a href="/join"><button>회원가입</button></a>
            </div><!--joinBox ens-->
            </c:if>
        </div><!--header wrap end-->
    </div><!--//headerWrap end-->

