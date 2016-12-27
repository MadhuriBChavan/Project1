package com.services;

import java.util.List;

import com.model.Supplier;

public interface SupplierService {
	List<Supplier> getAllSupplier();
	void addSupplier(Supplier supplier);
	Supplier getSupplierBySID(int SID);
	void deleteSupplier(int SID);
	void editSupplier(Supplier supplier);

}
