<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <c:import url="/WEB-INF/temp/link.jsp"></c:import>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/css/ui.jqgrid.css">
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<div id="wrap">
   	<c:import url="/WEB-INF/temp/head.jsp"></c:import>
   	 <div id="writeBox">
        <div id="writeBtnBox">
        	 	<a href="/write"><button>작성하기</button></a>
        </div><!-- //writeBtnBox end -->
    </div><!--//write end  -->
    <table id="list"></table><!-- //list end  -->
    <div id="paging"></div><!--//paging end  -->
</div><!-- //wrap end  -->

<script src="/js/jquery.js"></script>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/jquery.jqGrid.min.js"></script>
<script src="/js/grid.locale-kr.js"></script>
<script>

test(1);
var $arry = [];
list();

function test(page){
	console.log("ajax ==> "+page)
	$.ajax({
	url:"/ajax/selectList/"+page,
	type:"GET",
	dataType:"json",
	error:function(){
		alert("error");
	},
	success:function(json){
		$arry = [];
		$arry = json;
			jQuery("#list") .jqGrid('setGridParam',
		        { 
		            datatype: 'local',
		            data:$arry
		        }).trigger("reloadGrid");
	},
}); }

 $("#paging").on("keyup",'td#input_paging .ui-pg-input',function(key){
		console.log("testing...");
		var $val = $(this).val();
		console.log("val ==> " + $val);
		if($val!=""){
			test($val);
		}
	}) 

 function list(){
		$("#list").jqGrid({
            datatype: "local",
            data: $arry,
            height: 'auto',
            colNames: ['번호', '제목', '닉네임', '작성시간'],
            colModel: [
                {name: 'no', index: 'no', align: 'center'},
                {name: 'title', index: 'title', align: 'center'},
                {name: 'nickname', index: 'nickname', align: 'center'},
                {name: 'regdate', index: 'regdate', align: 'center'},
            ],
            rowNum: 10,
            pager:"#paging",
            viewrecords: true,
            autowidth: true,
            loadonce:true,
            rowList: [10,20,30],
            caption: "게시판",
            onSelectRow: function (ids) {
            	var val ;
                var dataObj = $(this).getRowData(ids);
                for (var key in dataObj) {
                    if (key == 'no') {
                    	val = dataObj[key];
                    }
                }
                location.href="/detail/article/"+val;
            },
        	});
		} 
 
</script>
</body>
</html>