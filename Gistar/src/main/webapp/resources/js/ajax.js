
/* Function Format
var A = (function(){
	return{
		 B : function(){
		 }
		,C : function(){
		}
	}
})();
 * */

/*.* * * * * * * *
 * script 모음
 * 1. AJAX
 * 2. MSG
 * 3. LIST
 * * * * * * * * */


//AJAX 함수 설정
var ajax = (function(){ //post, cmm
	var type = 'GET';
	var defaultOp = {
				 dataType    : 'json'
				,contentType : 'application/json'
	};
	
	return{
		
		post : function(path, jsonObj, successFunction, failFunction, initData){
				type = 'POST';
				//console.log(jsonObj);
				/*if(initData && initData.enctype == 'multipart/form-data'){ // file upload 제외
			        jsonObj = jsonObj;
			      }else if(!(initData && initData.hasOwnProperty('objectFlag'))){// form 제외
			        jsonObj = (jsonObj) ? JSON.stringify(jsonObj) : '';
			      }*/
				initData = $.extend({}, defaultOp, initData);
				ajax.cmm(type, path, jsonObj, successFunction, failFunction, initData);
		}//post End
		
		,cmm : function(method, path, jsonObj, successFunction, failFunction, initData){
			var base = {
					url   : path
					,type : method
					,data : jsonObj
					,success : function(data){
						//console.log("아작스"+jsonObj);
						if(data.errorYn == 'N'){
							if(successFunction !== undefined && successFunction !== ''){
								successFunction(data);
							}
						}else{
							if(data.errorYn = 'Y'){
								if(failFunction !== undefined && failFunction !== ''){
									failFunction(data);
								}else{
									alert(msg.get('ajaxError'));
									return false;
								}
							}else{
								alert(data.errMsg);
								if(data.errorYn =='Y003'){
									location.href='/';
								}
							}
						}
					}
					,error : function(xhr){
						console.error(xhr.responseJSON.errorYn);
						if(xhr.responseJSON.errorYn == 'Y005'){
							location.href = '/common/error.day'
						}
					}
			}
			
			$.ajax($.extend(base, initData));
		}//cmm End
		
	}//ajax return End
})();

//Message 함수 설정
var msg = (function(){//get
	return{
		 get : function(state){
			var value = '';
			
			switch(state){
			case 'ajaxError' : value = 'AJAX에러!'; break;
			//case '' : value = ''; break;
			//case '' : value = ''; break;
			//case '' : value = ''; break;
			}
			return value;
		 }//get End
	}//msg return End
})();

//List 함수 설정
var list = (function(){
	return{
		 get : function(){
			 
		 }
		 //list 
		,set : function(data, divid){
			var hstr = '';

			if(data && data.length > 0){
				for(i in data){
					var d = data[i];

					hstr += '<ul class="ulist">';
					hstr += '<li><b>'+d.name+'</b></li>';
					hstr += '<li><b>'+d.age+'</b></li><br>';
				}
			}else{
				hstr = "게시글이 없습니다."
			}
			divid.html(hstr);
		}
		
		//드롭박스 
		,selbox : function(data, selectid){
			var sstr = '';
			if(data && data.length > 0){
				//데이터양만큼 
				for(i in data){
					var d = data[i];
					sstr += '<option value="'+d.sggCd+'">'+d.sggNm+'</option>';
				}
			}else{
				sstr = "코드가 없습니다."
			}
			selectid.html(sstr);
		}
		
		//테스트 
		,selbox2 : function(data, selectid){
			var sstr2 = '';
			if(data && data.length > 0){
				//positions = [];
				//데이터양만큼 
				for(i in data){
					var d = data[i];
					sstr2 += '<p>'+d.sggNm+' '+d.admdongNm+'의 좌표 [x='+d.xCrd+' : y='+d.yCrd+']</p>';
					//positions.push('{title:"'+d.traNm+'" , latlng: new daum.maps.LatLng('+d.xCrd+', '+d.yCrd+')}')
					
					positions.push({title:d.traNm, latlng: new daum.maps.LatLng(d.xCrd, d.yCrd)});
						}
				console.log(positions);
				//console.log(positions);
			}else{
				sstr2 = "코드가 없습니다."
			}
			selectid.html(sstr2);
		}
	}
})();