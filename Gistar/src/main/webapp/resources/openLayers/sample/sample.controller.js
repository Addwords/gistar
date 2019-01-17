/**
 * 
 */
  angular.module('ol').controller('olController', function($scope, olService){
	  
  $scope.test = olService.get();
//  $scope.test = "tettttt";
  
});
