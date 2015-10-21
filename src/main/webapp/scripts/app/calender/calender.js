'use strict';

angular.module('grungleApp')
    .config(function ($stateProvider) {
        $stateProvider
            .state('calender', {
                parent: 'site',
                url: '/calender',
                data: {
                    roles: ['ROLE_USER'],
                    pageTitle: 'Authentication'
                },
                views: {
                    'content@': {
                        templateUrl: 'scripts/app/calender/calender.html',
                        controller: 'CalenderController'
                    }
                },
                resolve: {

                }
            });
    });
