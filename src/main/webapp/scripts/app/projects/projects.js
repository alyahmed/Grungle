'use strict';

angular.module('grungleApp')
    .config(function ($stateProvider) {
        $stateProvider
            .state('projects', {
                parent: 'site',
                url: '/projects',
                data: {
                    roles: []
                },
                views: {
                    'content@': {
                        templateUrl: 'scripts/app/projects/projects.html',
                        controller: 'ProjectsController'
                    }
                },
                resolve: {}
            });
    });
