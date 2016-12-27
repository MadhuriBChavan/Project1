package com.dao;

import java.util.List;

import com.model.Product;

public interface ProductDao {
List <Product> getAllProduct();
Product getProductByID(int PID);
void deleteProduct(int PID);
void addProduct(Product product);
void editProduct(Product product);
}
