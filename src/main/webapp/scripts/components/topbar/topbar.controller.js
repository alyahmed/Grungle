'use strict';

angular.module('grungleApp')
    .controller('TopbarController', function ($scope, $location, $state, Auth, $rootScope, Principal) {
        $scope.isAuthenticated = Principal.isAuthenticated;
        $scope.$state = $state;

        $scope.logout = function () {
            Auth.logout();
            $state.go('login');
        };

        $scope.getUserCredentials = function () {
            Principal.identity().then(function (account) {
                $scope.account = account;
                $scope.isAuthenticated = Principal.isAuthenticated;
            });
        };

        $scope.addClass = function (id) {
            angular.element(document.querySelector('#' + id)).addClass('open');
        };
        $scope.removeClass = function (id) {
            angular.element(document.querySelector('#' + id)).removeClass('open');
        };

        $scope.openQuickView = function () {
            $rootScope.quickview = true;
        };

        $rootScope.$on('userLoginEvent', function (event, data) {
            $scope.getUserCredentials();
        });

        $scope.getUserCredentials();


    });
