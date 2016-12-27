package com.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="productcategories")
public class Category implements Serializable{
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private int CID;
@Column(name="categoryName")
private String categoryName;
@OneToMany(mappedBy="category")
@JsonIgnore
List<Product> products;
public int getCID() {
	return CID;
}
public void setCID(int cID) {
	CID = cID;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public List<Product> getProducts() {
	return products;
}
public void setProducts(List<Product> products) {
	this.products = products;
}

}
