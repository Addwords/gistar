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
	
		//서울시 읍면동 경계영역정보 들고옴
		,emdlist : function(param) {
			var url = '/di/selectList.gistar';
			return $http.post(url,param).success(function(data){ })
			.error(function(e){	return $q.reject(e);});
		}
		
		//서울시 전체구 가져와서 드롭박스 채움
		,seoulist : function() {
			var url = '/di/getSeoulList.gistar';
			return $http.post(url).success(function(data){ })
			.error(function(e){	return $q.reject(e);});
		}
		
		//선택한 구 영역정보 가져오기
		,seoulgeom : function(param){
			var url = '/di/getEmdGeom.gistar';
			return $http.post(url, param)
			.success(
					function(data){	}
			)
			.error(
					function (e) {
						return $q.reject(e);
					}
			);
		}
		
		//선택한 구 영역정보 가져오기
		,getsang : function(param){
			var url = '/di/getSangList.gistar';
			return $http.post(url, param).success(function(data){})
			.error(function(e){	return $q.reject(e);});
		}

		//선택한 구 영역정보 가져오기
		,getsangclust : function(param){
			var url = '/di/getSangCluster.gistar';
			return $http.post(url, param).success(function(data){})
			.error(function(e){	return $q.reject(e);});
		}
		,csvParse : function(param){
			var url = '/di/csv.gistar';
			return $http.post(url).success(function(data){})
			.error(function(e){	return $q.reject(e);});
		}
		
		
	}//storage

	return storage;
	
	
});