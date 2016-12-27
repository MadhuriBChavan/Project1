package com.services;

import java.util.List;

import com.model.Cart;
import com.model.CartItem;

public interface CartItemService {
	List<CartItem> getAllCartItem();
	void addCartItem(CartItem cartItem);	
	void removeCartItem(int cartItemId);
	void removeAllCartItems(Cart cart);


}
