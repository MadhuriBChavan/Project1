package com.services;
import java.util.List;

import com.model.Product;

public interface ProductService {
List <Product> getAllProducts();
Product getProductByID(int PID);
void deleteProduct(int PID);
void addProduct(Product product);
void editProduct(Product product);
}
