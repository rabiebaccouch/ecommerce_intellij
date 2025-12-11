package com.ecommerce.service;

import com.ecommerce.model.Category;
import com.ecommerce.repository.StaticDatabase;
import java.util.List;

public class CategoryService {

    public List<Category> getAllCategories() {
        return StaticDatabase.getAllCategories();
    }

    public Category getCategoryById(int id) {
        return StaticDatabase.getCategoryById(id);
    }

    public void addCategory(Category category) {
        StaticDatabase.addCategory(category);
    }

    public void updateCategory(Category category) {
        StaticDatabase.updateCategory(category);
    }

    public void deleteCategory(int id) {
        StaticDatabase.deleteCategory(id);
    }
}