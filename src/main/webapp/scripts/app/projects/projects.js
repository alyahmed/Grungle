'use strict';

angular.module('grungleApp')
    .config(function ($stateProvider) {
        $stateProvider
            .state('projects', {
                abstract: true,
                parent: 'site'
            });
    });
