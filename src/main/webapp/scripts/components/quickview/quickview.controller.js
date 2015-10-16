'use strict';

angular.module('grungleApp')
    .controller('QuickviewController', function ($scope, $location, $rootScope, $state, Auth, Principal) {
        $scope.isAuthenticated = Principal.isAuthenticated;
        $scope.$state = $state;

        $scope.logout = function () {
            Auth.logout();
            $state.go('home');
        };

        $scope.quickview = $rootScope.quickview;

        $scope.closeQuickView = function(){
            if($rootScope.quickview){
                $rootScope.quickview = false;
            }
        }
    });
