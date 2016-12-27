package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Category;
import com.model.Supplier;

@Repository
@Transactional
public class SupplierDaoImpl implements SupplierDao {
	@Autowired
	private SessionFactory sessionFactory;
	

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Supplier> getAllSupplier() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		List<Supplier> supplier=session.createQuery("from Supplier").list();
		session.close();
		return supplier;
	}

	public void addSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(supplier);
		//session.flush();
		session.getTransaction().commit();
		session.close();

	}

	public Supplier getSupplierBySID(int SID) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Supplier supplier=session.get(Supplier.class, SID);
			session.close();
			return supplier;
	}

	public void deleteSupplier(int SID) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		//select * from book where isbn=?
		Supplier supplier=session.get(Supplier.class, SID);
		//delete from book where isbn=?
		session.delete(supplier);
		//commit the changes
		//changes to the database will become permanent
		//session.flush();
		session.getTransaction().commit();
		//closing the connection with the database.
		session.close();//close the session	

	}

	public void editSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(supplier);
		session.getTransaction().commit();
		//session.flush();
		session.close();

	}

}
