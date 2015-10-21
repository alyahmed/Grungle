'use strict';

angular.module('grungleApp')
    .controller('LoginController', function ($rootScope, $scope, $state, $timeout, Auth, $log, Principal, $auth, Notification) {
        $scope.user = {};
        $scope.errors = {};
        $scope.rememberMe = true;
        $log.info("Auth status = " + Principal.isAuthenticated());

        if (Principal.isAuthenticated()) {
            $state.go('home');
        }

        $scope.login = function (event) {
            event.preventDefault();
            if ($scope.username == null || $scope.password == null) {
                showWarning();
                return;
            }
            Auth.login({
                username: $scope.username,
                password: $scope.password
            }).then(function () {
                $scope.authenticationError = false;
                if ($rootScope.previousStateName === 'register') {
                    $state.go('home');
                } else {
                    $rootScope.back();
                }
            }).catch(function () {
                $scope.authenticationError = true;
                showError('Incorrect username or password');
            });
        };

        $scope.socialLogin = function () {
            $log.debug("Attempting Social login");
            $auth.authenticate('github')
                .then(function (response) {
                    var token = response.data.token;
                    Auth.socialLogin(token).then(function () {
                        $scope.authenticationError = false;
                        $scope.isSuccess = true;
                        if ($rootScope.previousStateName === 'register') {
                            $state.go('home');
                        } else {
                            $rootScope.back();
                        }
                    }).catch(function () {
                        $scope.isSuccess = false;
                        $scope.authenticationError = true;
                        showError('Unable to authenticate using GitHub');
                    });
                })
                .catch(function (response) {
                    // Something went wrong.
                    $log.error(response);
                    $scope.authenticationError = true;
                    showError('Unable to authenticate using GitHub');
                });
        };


        var showWarning = function () {
            Notification.warning({
                message: 'Please enter a valid username and password',
                title: '<b>Invalid</b> Credentials'
            });
        };

        var showError = function (msg) {
            Notification.error({message: msg, title: '<b>Authorization</b> Failure'});
        };
    });
