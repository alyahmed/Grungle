'use strict';

angular.module('grungleApp')
    .controller('LogoutController', function (Auth) {
        Auth.logout();
    });
