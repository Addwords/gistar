<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<html>
<head>
	<title>GISTAR</title>
</head>
<body>
<h1>
	Hello Google!  
</h1>
내이름은 <p id='nam'></p>
나이는 <p id='ag'></p>

<script type="text/javascript">
$(function(){
	main.init();
	
});
var main = (function(){
	
	return{
		init : function(){
			var htmstr = '';
			console.log("init실행.");
			ajax.post('/di/selectList.gistar', {}, main.postcnt);
		}
		,postcnt : function(data){
			if(data.result && data.result != ''){
				//var pcnt = validVal(data.result.listcnt) ? data.result.listcnt : 0;
				//var pcnt = data.result.listcnt ? data.result.listcnt : 0;
				
				//$('.postcnt b').text(pcnt.toLocaleString());
				list.set(data.result.resultlist, $('#nam'))
			}
		}
		
	}
})();

</script>
</body>
</html>
