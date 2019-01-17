/**
 * 
 */
angular.module('ol').service('olService', function($http, $q) {
	var storage = {

		sample : [
			{
				name : '장용건',
				address : '수원'
			},
			{
				name : '김대영',
				address : '홍대'
			},
			{
				name : '박영빈',
				address : '노원'
			} 
		]
		,get : function() {
			
			return storage.sample;
		}
		//서울시 전체구 가져오기
		,seoulist : function() {
			var url = '/di/getSeoulList.gistar';
			return $http.post(url)
			.success(
					function(data){
						console.log('list샘플서비스 까지 왓음'+data);
						if(data.result && data.result != ''){
							//$('#lmit10').val(data.result.resultlist[0].sggNm); //초기값 설정
							//list.selbox(data.result.resultlist, $('#selectgu')); //드롭박스 데이터 채움
							return '';
						}else{
							console.log('error');
						}
						
					}
			)
			.error(
					function (e) {
						return $q.reject(e);
					}
			);
		}
		
		//선택한 구 영역정보 가져오기
		,seoulgeom : function(param){
			var url = '/di/getSeoulGeom.gistar';
			return $http.post(url, param).success(
					function(data){
						console.log('geom샘플서비스 까지 왓음'+data);
						if(data.result && data.result != ''){
							//$('#lmit10').val(data.result.resultlist[0].sggNm); //초기값 설정
							//list.selbox(data.result.resultlist, $('#selectgu')); //드롭박스 데이터 채움
							return '';
						}else{
							console.log('error');
						}
						
					}
			)
			.error(
					function (e) {
						return $q.reject(e);
					}
			);
		}
	}

	return storage;
	
	
});