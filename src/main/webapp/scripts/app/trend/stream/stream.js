'use strict';

angular.module('grungleApp')
    .config(function ($stateProvider) {
        $stateProvider
            .state('stream', {
                parent: 'trend',
                url: '/trend/stream',
                data: {
                    roles: ['ROLE_USER'],
                    pageTitle: 'Authentication'
                },
                views: {
                    'content@': {
                        templateUrl: 'scripts/app/trend/stream/stream.html',
                        controller: 'StreamController'
                    }
                },
                resolve: {

                }
            });
    });
