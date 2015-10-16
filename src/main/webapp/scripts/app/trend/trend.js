'use strict';

angular.module('grungleApp')
    .config(function ($stateProvider) {
        $stateProvider
            .state('trend', {
                abstract: true,
                parent: 'site'
            });
    });
