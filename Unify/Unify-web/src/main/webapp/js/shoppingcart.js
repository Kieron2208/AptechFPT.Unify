(function () {
    'use strict';

    angular.module('myApp', ['ui.bootstrap', 'ngFileUpload']).controller('MyController', MyController);
    MyController.$inject = ['$scope', '$http', '$window', '$modal'];
    function MyController($scope, $http, w, $modal) {

        var x = w.localStorage.getItem("shoppingcart");

        $scope.cart = JSON.parse(x) || [];

        $scope.open = function (size) {
            $scope.animationsEnabled = true;
            var modalInstance = $modal.open({
                animation: $scope.animationsEnabled,
                templateUrl: 'myModalContent.html',
                controller: myModalController,
                size: size

            });
            $scope.toggleAnimation = function () {
                $scope.animationsEnabled = !$scope.animationsEnabled;
            };
        };
        $scope.openconfirm = function (size) {
            $scope.animationsEnabled = true;
            var modalInstance = $modal.open({
                animation: $scope.animationsEnabled,
                templateUrl: 'myModalConfirm.html',
                controller: myModalConfirmController,
                size: size
            });
            modalInstance.result.then(function () {
            }, function () {
            });
            $scope.toggleAnimation = function () {
                $scope.animationsEnabled = !$scope.animationsEnabled;
            };
        };
        $scope.opencancel = function (size) {
            $scope.animationsEnabled = true;
            var modalInstance = $modal.open({
                animation: $scope.animationsEnabled,
                templateUrl: 'myModalCancel.html',
                controller: myModalCancelController,
                size: size
            });
            modalInstance.result.then(function () {
            }, function () {
            });
            $scope.toggleAnimation = function () {
                $scope.animationsEnabled = !$scope.animationsEnabled;
            };
        };

        $scope.put = function (id, n, pic, p, q) {

            //kiem tra 
            var addToArray = true;
            for (var i = 0; i < $scope.cart.length; i++) {
                if ($scope.cart[i].id === id) {
                    addToArray = false;
                }
            }
            //add
            if (addToArray) {
                if ($scope.cart.sum("quantity") + q > 30) {
                    $scope.open();
                    $scope.toggleAnimation();
                } else {
                    $scope.cart.push({
                        id: id,
                        name: n,
                        pic: pic,
                        price: p,
                        quantity: q,
                        total: p * q
                    });
                    var jsonStr = JSON.stringify($scope.cart);
                    w.localStorage.setItem("shoppingcart", jsonStr);
                }
            }
            else {
                if ($scope.cart.sum("quantity") + q > 30) {
                    $scope.open();
                    $scope.toggleAnimation();
                } else {
                    for (var i = 0; i < $scope.cart.length; i++) {
                        var item = $scope.cart[i];
                        if (item.id === id) {
                            item.quantity = this.toNumber(item.quantity + q);
                            item.total = this.toNumber(item.quantity * item.price);
                            //xoa         
                            if (item.quantity < 1) {
                                $scope.cart.splice(i, 1);
                            }
                        }
                    }
                    var jsonStr = JSON.stringify($scope.cart);
                    w.localStorage.setItem("shoppingcart", jsonStr);
                }
            }


        };
        $scope.customer = {
            accountId: null,
            name: '',
            phone: null,
            address: '',
            subTotal: 0,
            comment: ''
        };
        $scope.formsubmit = function () {
            $scope.openconfirm();

        };
        $scope.clearcart = function () {
            $scope.opencancel();
        };
        $scope.qu = 1;
        //return so
        $scope.toNumber = function (value) {
            value = value * 1;
            return isNaN(value) ? 0 : value;
        };
//check ton tai
        $scope.show = function () {
            return ($scope.cart.sum("quantity") > 0) ? true : false;
        };
        $scope.hide = function () {
            return ($scope.cart.sum("quantity") < 1) ? true : false;
        };
//tong bat ky
        Array.prototype.sum = function (prop) {
            var total = 0;
            for (var i = 0, _len = this.length; i < _len; i++) {
                total += this[i][prop];
            }
            return total;
        };

    }

    angular.module('myApp').controller('myModalController', myModalController);
    function myModalController($scope, $uibModalInstance) {
        $scope.ok = function () {
            $uibModalInstance.close();
        };

        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    }


    angular.module('myApp').controller('myModalConfirmController', myModalConfirmController);
    function myModalConfirmController($scope, $http, $window, $uibModalInstance) {
        var form = document.getElementById("myForm");
        $scope.ok = function () {
            form.submit();
            $scope.cart = [];
            var jsonStr = JSON.stringify($scope.cart);
            $window.localStorage.setItem("shoppingcart", jsonStr);
            $uibModalInstance.close();
        };

        $scope.cancel = function () {
            $uibModalInstance.dismiss();
        };
    }


    angular.module('myApp').controller('myModalCancelController', myModalCancelController);
    function myModalCancelController($scope, $http, $window, $uibModalInstance) {

        $scope.ok = function () {
            $scope.cart = [];
            var jsonStr = JSON.stringify($scope.cart);
            $window.localStorage.setItem("shoppingcart", jsonStr);
            location.reload();
            $uibModalInstance.close();
        };

        $scope.cancel = function () {
            $uibModalInstance.dismiss();
        };
    }



})();

