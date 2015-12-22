/* global angular */
/* global baseContext */
(function () {
    'use strict';

//    angular.module('myApp', ['ui.bootstrap', 'ngFileUpload']);

    angular.module('myApp').constant('baseContext', baseContext)
            .constant('toastr', toastr);

    angular.module('myApp').controller('UserController', UserController);

    UserController.$inject = ['$q', 'Upload', 'logger'];

    function UserController($q, Upload, logger) {
        var vm = this;
        vm.entity = {
            email: '',
            password: '',
            passwordConfirm: '',
            firstName: '',
            lastName: '',
            avatar: null,
            phone: '',
            gender: 'Male',
            address: '',
            dateOfBirth: ''
        };
        vm.message = '';
        vm.dateStatus = false;
        vm.openPopup = openPopup;
        vm.submit = submit;
        vm.maxdate = new Date();
        vm.disabled = disabled;
        vm.emailPattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        vm.date = {
            minDate: null,
            maxDate: null
        };

        activate();

        function activate() {
            var promises = [init()];
            return $q.all(promises).then(function () {
                logger.info('Activated Create Employee Dialog.');
            });
        }

        function init() {
            var now = new Date();
            var past16 = now.getFullYear() - 16;
            var month16 = now.getMonth();
            var date16 = now.getDate();
            vm.date.maxDate = new Date(past16, month16, date16);
            vm.entity.dateOfBirth = new Date(past16, month16, date16);
        }

        function openPopup($event) {
            vm.dateStatus = true;
        }

        function disabled(date, mode) {
            var now = new Date();
            var past16 = now.getFullYear() - 16;
            var month16 = now.getMonth();
            var date16 = now.getDate();
            return date.getTime() > new Date(past16, month16, date16).getTime();
//            return (mode === 'date' && (date.getDate() > new Date().getDate()));
        }

        function submit() {
            if (vm.userForm.$valid) {
                Upload.upload({
                    url: baseContext + 'register',
                    data: {
                        email: vm.entity.email,
                        password: vm.entity.password,
                        image: vm.entity.avatar,
                        firstName: vm.entity.firstName,
                        lastName: vm.entity.lastName,
                        phone: vm.entity.phone,
                        address: vm.entity.address,
                        gender: vm.entity.gender,
                        dateOfBirth: vm.entity.dateOfBirth
                    }
                }).then(function (resp) {
                    vm.message = 'Create new Account Successful.';
                    logger.success("Insert Successful.", resp);
                    window.location = "/Unify-web/";
                }, function (resp) {
                    vm.message = 'Create new Account Failed.';
                    logger.error("Insert Failed.", resp);
                });
            } else {
                vm.message = 'Form is not valid.';
                logger.warning("Form is not valid.");
            }
        }
    }

    angular.module('myApp').controller('ProfileController', ProfileController);

    ProfileController.$inject = ['$q', '$http', 'Upload', 'logger'];

    function ProfileController($q, $http, Upload, logger) {
        var vm = this;
        vm.entity = {
            id: 0,
            email: '',
            password: '',
            passwordConfirm: '',
            firstName: '',
            lastName: '',
            phone: '',
            gender: 'Male',
            address: '',
            dateOfBirth: ''
        };
        vm.dateStatus = false;
        vm.openPopup = openPopup;
        vm.submit = submit;
        vm.disabled = disabled;
        vm.message = '';
        vm.emailPattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        vm.date = {
            minDate: null,
            maxDate: null
        };

        activate();

        function activate() {
            var promises = [init(), fetchData()];
            return $q.all(promises).then(function () {
                logger.info('Activated Create Employee Dialog.');
            });
        }

        function fetchData() {
            return $http.get(baseContext + 'profile/detail')
                    .then(function (response) {
                        vm.entity = response.data;
                        vm.entity.dateOfBirth = new Date(response.data.dateOfBirth);
                        return vm.entity;
                    });
        }

        function init() {
            var now = new Date();
            var past16 = now.getFullYear() - 16;
            var month16 = now.getMonth();
            var date16 = now.getDate();
            vm.date.maxDate = new Date(past16, month16, date16);
            vm.entity.dateOfBirth = new Date(past16, month16, date16);
        }

        function openPopup($event) {
            vm.dateStatus = true;
        }

        function disabled(date, mode) {
            var now = new Date();
            var past16 = now.getFullYear() - 16;
            var month16 = now.getMonth();
            var date16 = now.getDate();
            return date.getTime() > new Date(past16, month16, date16).getTime();
//            return (mode === 'date' && (date.getDate() > new Date().getDate()));
        }

        function submit() {
            if (vm.userForm.$valid) {
                var arrayOfString = vm.entity.imgLink.split(baseContext);
                var imgPath = '/' + arrayOfString[1];
                Upload.upload({
                    url: baseContext + 'profile',
                    data: {
                        id: vm.entity.id,
                        email: vm.entity.email,
                        password: vm.entity.password,
                        firstName: vm.entity.firstName,
                        image: vm.entity.avatar || imgPath,
                        lastName: vm.entity.lastName,
                        phone: vm.entity.phone,
                        address: vm.entity.address,
                        gender: vm.entity.gender,
                        dateOfBirth: vm.entity.dateOfBirth
                    }
                }).then(function (resp) {
                    vm.message = 'Update Successful.';
                    logger.success("Update Successful.", resp);
                    location.reload();
                }, function (resp) {
                    vm.message = 'Update profile failed.';
                    logger.error("Update Failed.", resp);
                });
            } else {
                vm.message = "Form is not valid.";
                logger.warning("Form is not valid.");
            }
        }
    }

    angular.module('myApp').controller('PasswordController', PasswordController);

    PasswordController.$inject = ['$q', '$http', 'logger'];

    function PasswordController($q, $http, logger) {
        var vm = this;
        vm.submit = submit;
        vm.message = '';
        activate();

        function activate() {
            var promises = [];
            return $q.all(promises).then(function () {
                logger.info('Activated Password Employee Dialog.');
            });
        }

        function submit() {
            if (vm.userForm.$valid) {
                $http({
                    method: 'POST',
                    url: baseContext + 'AdminProfileController?action=password',
                    transformRequest: function (obj) {
                        var str = [];
                        for (var p in obj)
                            str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                        return str.join("&");
                    },
                    data: {newPassword: vm.password},
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                }).then(function (resp) {
                    vm.message = 'Change Password Successful.';
                    logger.success("Insert Successful.", resp);
                }, function (resp) {
                    vm.message = 'Change Password failed.';
                    logger.error("Insert Failed.", resp);
                });
            } else {
                vm.message = 'Form is not valid.';
                logger.warning("Form is not valid.");
            }
        }
    }

    angular.module('myApp')
            .directive('username', username);

    username.$inject = ['$compile', '$http', '$q'];

    function username($compile, $http, $q) {
        var directive = {
            restrict: 'A',
            require: ['ngModel', '^form'],
            link: link
        };
        return directive;

        function link(scope, element, attributes, controllers) {
            var ngModel = controllers[0];
            var ngForm = controllers[1];
            ngModel.$asyncValidators.username = asyncEmailValidator;
//            setupDom(element, ngForm, scope);
        }

        function asyncEmailValidator(value) {
            return $http.get(baseContext + 'accountutil/checkemail/' + encodeURI(value))
                    .then(success);

            function success(response) {
                if (response.data) {
                    return $q.when(true);
                } else {
                    return $q.reject(false);
                }
            }
        }
    }

    angular.module('myApp')
            .directive('newpassword', newpassword);

    newpassword.$inject = ['$compile', '$http', '$q'];

    function newpassword($compile, $http, $q) {
        var directive = {
            restrict: 'A',
            require: ['ngModel', '^form'],
            link: link
        };
        return directive;

        function link(scope, element, attributes, controllers) {
            var ngModel = controllers[0];
            var ngForm = controllers[1];
            ngModel.$asyncValidators.newpassword = asyncNewPasswordValidator;
//            setupDom(element, ngForm, scope);
        }

        function asyncNewPasswordValidator(value) {
            return $http.get(baseContext + 'accountutil/checknewpassword/' + encodeURI(value))
                    .then(success);

            function success(response) {
                if (response.data) {
                    return $q.when(true);
                } else {
                    return $q.reject(false);
                }
            }
        }
    }

    angular.module('myApp')
            .directive('oldpassword', oldpassword);

    oldpassword.$inject = ['$compile', '$http', '$q'];

    function oldpassword($compile, $http, $q) {
        var directive = {
            restrict: 'A',
            require: ['ngModel', '^form'],
            link: link
        };
        return directive;

        function link(scope, element, attributes, controllers) {
            var ngModel = controllers[0];
            var ngForm = controllers[1];
            ngModel.$asyncValidators.oldpassword = asyncOldPasswordValidator;
//            setupDom(element, ngForm, scope);
        }

        function asyncOldPasswordValidator(value) {
            return $http.get(baseContext + 'accountutil/checkoldpassword/' + encodeURI(value))
                    .then(success);

            function success(response) {
                if (response.data) {
                    return $q.when(true);
                } else {
                    return $q.reject(false);
                }
            }
        }
    }

    var emailLength = function () {
        return {
            restrict: 'A',
            require: "ngModel",
            link: function (scope, element, attributes, ngModel) {
                ngModel.$validators.emailLength = function (value) {
                    var regex = /^((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                    var email = value.split('@');
                    if (!email[1] || !regex.test(email[1]))
                        return true;
                    return 6 <= email[0].length && email[0].length <= 30;
                };
            }
        };
    };

    angular.module('myApp').directive("emailLength", emailLength);

    var compareTo = function () {
        return {
            require: "ngModel",
            scope: {
                otherModelValue: "=compareTo"
            },
            link: function (scope, element, attributes, ngModel) {

                ngModel.$validators.compareTo = function (modelValue) {
                    return modelValue == scope.otherModelValue;
                };

                scope.$watch("otherModelValue", function () {
                    ngModel.$validate();
                });
            }
        };
    };

    angular.module('myApp').directive("compareTo", compareTo);

    angular.module('myApp').config(toastrConfig);

    toastrConfig.$inject = ['toastr'];
    /* @ngInject */
    function toastrConfig(toastr) {
        toastr.options.timeOut = 4000;
        toastr.options.positionClass = 'toast-bottom-right';
    }

    angular
            .module('myApp')
            .factory('logger', loggerService);

    loggerService.$inject = ['$log', 'toastr'];

    /* @ngInject */
    function loggerService($log, toastr) {
        var service = {
            showToasts: true,
            error: error,
            info: info,
            success: success,
            warning: warning,
            // straight to console; bypass toastr
            log: $log.log
        };

        return service;
        /////////////////////

        function error(message, data, title) {
            toastr.error(message, title);
            $log.error('Error: ' + message, data);
        }

        function info(message, data, title) {
            toastr.info(message, title);
            $log.info('Info: ' + message, data);
        }

        function success(message, data, title) {
            toastr.success(message, title);
            $log.info('Success: ' + message, data);
        }

        function warning(message, data, title) {
            toastr.warning(message, title);
            $log.warn('Warning: ' + message, data);
        }
    }
})();
