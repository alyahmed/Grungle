'use strict';

angular.module('grungleApp')
    .config(function ($stateProvider) {
        $stateProvider
            .state('listProjects', {
                parent: 'projects',
                url: '/projects',
                data: {
                    roles: []
                },
                views: {
                    'content@': {
                        templateUrl: 'scripts/app/projects/list/list_projects.html',
                        controller: 'ListProjectsController'
                    }
                },
                resolve: {}
            });
    });
