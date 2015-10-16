'use strict';

angular.module('grungleApp')
    .controller('StreamController', function ($rootScope, $scope, $state, $timeout, $http, $log, Twitter) {

        $scope.tweets = [];
        Twitter.getTweets().success(function (response) {
            $scope.tweets = response;
            $log.info("Found " + $scope.tweets.length + " tweets");
            if($scope.tweets.length > 10){
                $scope.tweets = $scope.tweets.slice(1, 10);
            }
        });

    });
