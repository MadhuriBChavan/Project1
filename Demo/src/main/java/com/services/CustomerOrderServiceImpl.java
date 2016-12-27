package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CustomerOrderDao;
import com.model.Cart;
import com.model.CartItem;
import com.model.CustomerOrder;
@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {

	@Autowired
    private CustomerOrderDao customerOrderDao;

    @Autowired
    private CartService cartService;
    
    
    @Transactional
	public void addCustomerOrder(CustomerOrder customerOrder) {
		// TODO Auto-generated method stub
		customerOrderDao.addCustomerOrder(customerOrder);

	}

    @Transactional
	public double getCustomerOrderGrandTotal(int cartId) {
		// TODO Auto-generated method stub
	        double grandTotal = 0;
	        Cart cart = cartService.getCartByCartId(cartId);
	        List<CartItem> cartItems = cart.getCartItem();

	        for (CartItem item : cartItems){
	            grandTotal += item.getTotalPrice();
	        }
	        return grandTotal;
	}

}
