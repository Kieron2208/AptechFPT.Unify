(function () {
    'use strict';

    angular.module('myApp', ['ui.bootstrap']).controller('MyController', MyController);

    MyController.$inject = ['$scope', '$http', '$window'];

    function MyController($scope, $http, w) {
        var form = document.getElementById("myForm");
        var x = w.localStorage.getItem("shoppingcart");

        $scope.cart = JSON.parse(x) || [];
//        $scope.cart = [{
//                id: 1,
//                name: 'T-Shirt01',
//                pic: 'img/product/Tshirt01.jpg',
//                price: 140.0000,
//                quantity: 1,
//            }, {
//                id: 2,
//                name: 'T-Shirt02',
//                pic: 'img/product/Tshirt02.jpg',
//                price: 145.0000,
//                quantity: 1,
//            }
//        ];
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
                if ($scope.cart.sum("quantity") + q > 20) {
                    alert("Qua nhieu");
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
                if ($scope.cart.sum("quantity") + q > 20) {
                    alert("Qua nhieu khong them duoc");
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
            subTotal: 0

        };
        $scope.formsubmit = function () {
            form.submit();
            $scope.cart = [];
            var jsonStr = JSON.stringify($scope.cart);
            w.localStorage.setItem("shoppingcart", jsonStr);
        };
        $scope.clearcart = function () {

            $scope.cart = [];
            var jsonStr = JSON.stringify($scope.cart);
            w.localStorage.setItem("shoppingcart", jsonStr);
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

    function myModalController() {
        
    }

})();

