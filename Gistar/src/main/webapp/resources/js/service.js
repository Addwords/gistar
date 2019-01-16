/**
 * 
 */
angular.module('ol').service('olService', function() {
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
		}
	}

	return storage;
});