'use strict';

angular.module('grungleApp')
    .controller('ListProjectsController', function ($scope, $http, ChatService, Principal) {
        // Model
        $scope.projects = [];

        $http.get('api/projects').success(function (response) {
            $scope.projects = response;
        });

    });
