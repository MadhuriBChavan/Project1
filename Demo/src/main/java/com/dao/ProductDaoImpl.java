package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Product;
@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		Session session=(Session) sessionFactory.openSession();
		//Selecting all records from the table
		List<Product> products= session.createQuery("from Product").list();
		session.close();// close the session.
		return products;

	}


	public Product getProductByID(int PID) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		  Product product=(Product)session.get(Product.class,PID);  
			session.close();
			return product;
	}

	@Transactional
	public void deleteProduct(int PID) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		//select * from book where isbn=?
		Product product=(Product)session.get(Product.class,PID);
		//delete from book where isbn=?
		session.delete(product);
		//commit the changes
		//changes to the database will become permanent
		//session.flush();
		session.getTransaction().commit();
		//closing the connection with the database.
		session.close();//close the session	
	}
	
	@Transactional
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(product);
		//session.flush();
		session.getTransaction().commit();
		session.close();
	}

	@Transactional
	public void editProduct(Product product) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		//session.flush();
		session.close();
	}
	
}
