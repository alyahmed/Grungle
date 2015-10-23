'use strict';

angular.module('grungleApp')
    .controller('ProjectsController', function ($scope, $http, ChatService, Principal) {
        $scope.profiles  = [];

        $http.get('api/user/social_profiles').then(function(response){
            $scope.profiles = response.data;
        });
    });
