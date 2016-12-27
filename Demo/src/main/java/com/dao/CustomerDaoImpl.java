package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Authorities;
import com.model.Cart;
import com.model.Customer;
import com.model.Users;
@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
	
@Autowired
 private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
	return sessionFactory;
		}

	public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
	}
	@Transactional
	public void addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Authorities authorities=new Authorities();
		authorities.setUsername(customer.getUsers().getUsername());
		authorities.setAuthorities("ROLE_USER");
		
		Cart cart=new Cart();
		customer.setCart(cart);
		cart.setCustomer(customer);
		Users users=customer.getUsers();
		users.setEnabled(true);
		session.save(customer);
		session.save(authorities);
		//session.flush();
		session.getTransaction().commit();
        session.close();
        }

	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		List<Customer> customers=session.createQuery("from Customer").list();
		return customers;

	}
@Transactional
public Customer getCustomerByUsername(String username) {
		
		Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Users where username =?");
        query.setString(0, username);
        Users users=(Users)query.uniqueResult();
        Customer customer=users.getCustomer();
        return customer;
	}


}
