package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.model.Cart;
import com.model.CartItem;
import com.model.Customer;
import com.model.Product;
import com.services.CartItemService;
import com.services.CartServiceImpl;
import com.services.CustomerServices;
import com.services.ProductService;

@Controller
public class CartItemController {
	@Autowired	
	private CustomerServices customerServices;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private CartServiceImpl cartService;	
	
	public CustomerServices getCustomerServices() {
		return customerServices;
	}
	public void setCustomerServices(CustomerServices customerServices) {
		this.customerServices = customerServices;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public CartItemService getCartItemService() {
		return cartItemService;
	}
	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}
	
	public CartServiceImpl getCartService() {
		return cartService;
	}
	public void setCartService(CartServiceImpl cartService) {
		this.cartService = cartService;
	}
	@RequestMapping("/cart/add/{PID}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void addCartItem(@PathVariable(value="PID") int PID){
		// To get the username of the customer
		//User object contains details about the user -username , password, active user or not
		//Users user=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//Users user= (Users) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username=user.getUsername();
		Customer customer=customerServices.getCustomerByUsername(username);
		System.out.println("Customer is " + customer.getCustomerEmail());
		Cart cart=customer.getCart();
		
	
		List<CartItem> cartItems=cart.getCartItem();
		Product product=productService.getProductByID(PID);
		for(int i=0; i<cartItems.size(); i++){
			CartItem cartItem=cartItems.get(i);
				if(product.getPID()==cartItem.getProduct().getPID()){
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				cartItem.setTotalPrice(cartItem.getQuantity() * cartItem.getProduct().getPrice());
				cartItemService.addCartItem(cartItem);
				return ;
			}
		}
		CartItem cartItem=new CartItem();
		cartItem.setQuantity(1);
		cartItem.setProduct(product);
		cartItem.setTotalPrice(product.getPrice() * 1);
		cartItem.setCart(cart);
		cartItemService.addCartItem(cartItem);
		

	}
	
	@RequestMapping("/cart/removecartitem/{cartItemId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeCartItem(@PathVariable(value="cartItemId") int cartItemId){
		cartItemService.removeCartItem(cartItemId);
	}

	@RequestMapping("/cart/removeAllItems/{cartId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeAllCartItems(@PathVariable(value="cartId") int cartId){
		Cart cart=cartService.getCartByCartId(cartId);
		cartItemService.removeAllCartItems(cart);
	}

	@RequestMapping("/getAllCartItems")
	public ModelAndView getAllCartItems() 
	{
		
		List<CartItem> cartItem=cartItemService.getAllCartItem();
		return new ModelAndView("CartList","cartItem",cartItem);
	}
	
	
	
}
