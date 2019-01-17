/**
 * 
 */
  angular.module('ol').controller('olController', function($scope, olService){
	  
  //$scope.test = olService.get();
  //$scope.test = olService.test();
//  $scope.test = "tettttt";
	  olService.test().success(function(s) {
		  
		  $scope.test = s.result;
		
	});
  
});
