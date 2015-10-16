'use strict';

angular.module('grungleApp')
    .factory('Twitter', function ($rootScope, $http, $log) {
        return {
            getTweets: function () {
                return $http.get('api/tweets').success(function (response) {
                    return response.data;
                });
            }
        }
    });
