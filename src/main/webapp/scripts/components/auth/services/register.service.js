'use strict';

angular.module('grungleApp')
    .factory('Register', function ($resource) {
        return $resource('api/register', {}, {
        });
    });


