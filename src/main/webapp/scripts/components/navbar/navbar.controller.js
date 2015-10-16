'use strict';

angular.module('grungleApp')
    .controller('NavbarController', function ($scope, $location, $state, Auth, Principal) {
        $scope.isAuthenticated = Principal.isAuthenticated;
        $scope.isInRole = Principal.isInRole;
        $scope.$state = $state;

        $scope.addClass = function (id) {
            angular.element(document.querySelector('#' + id)).addClass('nav-hover');
        };
        $scope.removeClass = function (id) {
            angular.element(document.querySelector('#' + id)).removeClass('nav-hover');
        };

        $scope.logout = function () {
            $state.go('login');
            Auth.logout();
            $scope.$apply();
        };
    });
