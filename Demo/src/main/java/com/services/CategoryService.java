package com.services;

import java.util.List;

import com.model.Category;

public interface CategoryService {
	List<Category> getAllCategory();
	Category getCategoryByCID(int CID);
	void addCategory(Category category);
	void deleteCategory(int CID);
	void editCategory(Category category);
}
