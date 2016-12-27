var app=angular.module("app", [])
.controller("myController", function($scope, $http){

	$scope.getProduct = function(){
		   $http.get('http://localhost:8085/Demo/getProductsList').success(function (data){
		       $scope.products = data;
		   })
		}
		
		
		$scope.addToCart=function(PID){
			   $http.put('http://localhost:8085/Demo/cart/add/'+PID).success(function(){
				   alert('Added Successfully');
			   })
		}
			
		
	    $scope.refreshCart=function(){
	    	$http.get('http://localhost:8085/Demo/cart/getCart/'+ $scope.cartId).success(function (data){
	    		$scope.cart=data;
	    	})
	    } 
	        $scope.getCart=function(cartId){
	        	alert(cartId);
	    	$scope.cartId=cartId;
	    	$scope.refreshCart(cartId);
	        }

	        $scope.removeFromCart=function(cartItemId){
	        	$http.put('http://localhost:8085/Demo/cart/removecartitem/'+ cartItemId).success(function(){
	        		$scope.refreshCart();
	        		alert('Removed cart is'+ cartId);
	        		
	        	})
	    }
	        
	        $scope.clearCart=function(){
	        	$http.put('http://localhost:8085/Demo/cart/removeAllItems/'+ $scope.cartId).success(function(){
	        		$scope.refreshCart();
	        		alert('Cart Cleared')
	        	})
	      }
	        
	        
	        
	        $scope.calculateGrandTotal=function(){
	        	var grandTotal=0.0
	        	for(var i=0; i<$scope.cart.cartItems.length; i++){
	        		grandTotal=grandTotal+$scope.cart.cartItem[i].totalPrice;
	        	}
	        	return grandTotal;
	        }
});

