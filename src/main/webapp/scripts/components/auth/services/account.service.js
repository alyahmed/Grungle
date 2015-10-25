'use strict';

angular.module('grungleApp')
    .factory('Account', function Account($resource) {
        return $resource('api/account', {}, {
            'get': { method: 'GET', params: {}, isArray: false,
                interceptor: {
                    response: function(response) {
                        // exposee response
                        return response;
                    }
                }
            }
        });
    });
