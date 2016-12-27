package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Category;
import com.model.Product;
@Repository
@Transactional

public class CategoryDaoImpl implements CategoryDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Category> getAllCategory() {
		// TODO Auto-generated method stub
		Session session=(Session) sessionFactory.openSession();
		//Selecting all records from the table
		List<Category> category= session.createQuery("from Category").list();
		session.close();// close the session.
		return category;
	}

	public void addCategory(Category category) {
		// TODO Auto-generated method stub

		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(category);
		//session.flush();
		session.getTransaction().commit();
		session.close();
	}
	@Transactional
	public void deleteCategory(int CID) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		//select * from book where isbn=?
		Category category=session.get(Category.class,CID);
		//delete from book where isbn=?
		session.delete(category);
		//commit the changes
		//changes to the database will become permanent
		//session.flush();
		session.getTransaction().commit();
		//closing the connection with the database.
		session.close();//close the session	

	}

	public void editCategory(Category category) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(category);
		session.getTransaction().commit();
		//session.flush();
		session.close();

	}

	public Category getCategoryByCID(int CID) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Category category=session.get(Category.class, CID);
			session.close();
			return category;
	}

}
