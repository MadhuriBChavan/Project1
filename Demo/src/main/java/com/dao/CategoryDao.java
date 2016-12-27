package com.dao;

import java.util.List;

import com.model.Category;

public interface CategoryDao {
	List<Category> getAllCategory();
	Category getCategoryByCID(int CID);
	void addCategory(Category category);
	void deleteCategory(int CID);
	void editCategory(Category category);
}

