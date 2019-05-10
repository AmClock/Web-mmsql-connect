function selectList() {
	var $test = [];
	$.ajax({
		url:"/ajax/selectList/1",
		type:"GET",
		dataType:"json",
		error:function(){
			alert("error");
		},
		success:function(json){
			$test.push(json);
		}
	});
	return $test;
}