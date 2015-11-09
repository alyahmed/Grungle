'use strict';

angular.module('grungleApp')
    .config(function ($stateProvider) {
        $stateProvider
            .state('createProject', {
                parent: 'projects',
                url: '/project/new',
                data: {
                    roles: []
                },
                views: {
                    'content@': {
                        templateUrl: 'scripts/app/projects/create/create_project.html',
                        controller: 'CreateProjectController'
                    }
                },
                resolve: {}
            });
    });
