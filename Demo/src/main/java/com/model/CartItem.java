package com.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="cartitem")

public class CartItem implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cartItemId;
	private int quantity;
	private double totalPrice;
	@ManyToOne
	@JoinColumn(name="productId")
	@JsonIgnoreProperties({"foobar"})
	private Product product;

	@ManyToOne
	@JoinColumn(name="cartid")
	@JsonIgnoreProperties({"foobar"})
	private Cart cart;
	public int getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}	
		public Product getProduct() {
		return product;
	}
		
	public double getTotalPrice() {
			return totalPrice;
		}
		public void setTotalPrice(double totalPrice) {
			this.totalPrice = totalPrice;
		}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
}
