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
		],
		get : function() {
			
			return storage.sample;
		},
		test : function() {
			var url = '/di/selectList.gistar';
			return $http.post(url)
			.success(
					function (d, s, h, c) {
						return d;
					}
			)
			.error(
					function (e, s, h, c) {
						return $q.reject(e);
					}
			);
		}
	}

	return storage;
	
	
});