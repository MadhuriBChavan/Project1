package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model.Category;
import com.model.Product;
import com.model.Supplier;
import com.services.CategoryService;
import com.services.ProductService;
import com.services.SupplierService;

@Controller

public class HelloController {
	@Autowired
	
	private ProductService productservice;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private SupplierService supplierService;
	
	public void setProductservice(ProductService productservice) {
		this.productservice = productservice;
	}
	public ProductService getProductservice() {
		return productservice;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public SupplierService getSupplierService() {
		return supplierService;
	}
	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	@RequestMapping("/")
	public ModelAndView helloWorld(){
		ModelAndView model=new ModelAndView("home");
		return model;
	}
	@RequestMapping("/getAllProducts")
	public ModelAndView getAllProducts() 
	{
		List<Product> products=productservice.getAllProducts();
		return new ModelAndView("BookList","products",products);
	}
	
	@RequestMapping("/getProductByPID/{PID}")
	
		public ModelAndView getProductByPID(@PathVariable(value="PID") int PID )
	{
		Product p=productservice.getProductByID(PID);
		return new ModelAndView("ProductPage","productObj",p);	 
	}
	
	@RequestMapping("/admin/delete/{PID}")
	public String deleteProduct(@PathVariable(value="PID") int PID)
	{
		Path path=Paths.get("C:/Users/user/workspace/Demo/src/main/webapp/WEB-INF/resources/images/" + PID + ".png");
		if(Files.exists(path))
				{
				try {
						Files.delete(path);
					} 
				catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

		productservice.deleteProduct(PID);
		return "redirect:/";
	}
	@RequestMapping(value="/admin/product/addProduct", method=RequestMethod.GET)
	public String getProductForm(Model model)
	{
		Product product=new Product();
		Category category=new Category();
		category.setCID(1);
		product.setCategory(category);
		model.addAttribute("productFormObj", product);
		return "productForm";	
	}
	
	@RequestMapping(value="/admin/product/addProduct", method=RequestMethod.POST)
	public String addProduct(@Valid@ModelAttribute(value="productFormObj") Product product,BindingResult result)
	{
		if(result.hasErrors())
			return "productForm";
		else{
		productservice.addProduct(product);
		}
		MultipartFile image=product.getProductImage();
		if(image!=null && !image.isEmpty())
		{
			Path path=Paths.get("C:/Users/user/workspace/Demo/src/main/webapp/WEB-INF/resources/images/" + product.getPID() + ".png");
			
			
				try {
					image.transferTo(new File(path.toString()));
				} 
				catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			catch(IllegalStateException e)
			{
				e.printStackTrace();
			}
		}
		return "redirect:/productsListAngular";	
	}
	
	
	@RequestMapping(value="/admin/product/editProduct/{PID}")
	public ModelAndView getEditForm(@PathVariable(value="PID") int PID)
	{
		
		Product product=this.productservice.getProductByID(PID);
		return new ModelAndView("editProductForm","editProductObj",product);
	}
	
	@RequestMapping(value="/admin/product/editProduct", method=RequestMethod.POST)
	public String editProduct(@ModelAttribute(value="editProductObj") Product product)
	{
		productservice.editProduct(product);
		return "redirect:/productsListAngular";	
	}
	
	@RequestMapping("/getProductsList")
	public @ResponseBody List<Product> getProductsListInJSON(){
		return productservice.getAllProducts();
	}
	
	@RequestMapping("/productsListAngular")
	public String getProducts(){
		return "productsListAngular";
	}

	//Category CRUD Operations
	@RequestMapping(value="/admin/category/addCategory", method=RequestMethod.GET)
	public String getCategoryForm(Model model)
	{
		
		Product product=new Product();
		Category category=new Category();
		category.setCID(1);
		product.setCategory(category);
		model.addAttribute("categoryFormObj", category);
		return "categoryForm";	
	}
	
	
	@RequestMapping(value="/admin/category/addCategory", method=RequestMethod.POST)
	public String addCategory(@Valid@ModelAttribute(value="categoryFormObj") Category category,BindingResult result)
	{
		if(result.hasErrors())
			return "categoryForm";
		categoryService.addCategory(category);
		return "redirect:/getAllCategories";	
	}
	

	@RequestMapping("/getAllCategories")
	public ModelAndView getAllCategories() 
	{
		List<Category> category=categoryService.getAllCategory();
		return new ModelAndView("CategoryList","category",category);
	}

	@RequestMapping("/getcategoryByCID/{CID}")
	public ModelAndView getCategoryByCID(@PathVariable(value="CID") int CID )
	{
		Category c=categoryService.getCategoryByCID(CID);
		return new ModelAndView("CategoryList","productObj",c);	 
	}


	@RequestMapping("/admin/category/delete/{CID}")
	public String deleteCategory(@PathVariable(value="CID") int CID)
	{
		categoryService.deleteCategory(CID);
		return "redirect:/getAllCategories";
	}
	
	@RequestMapping(value="/admin/category/editCategory/{CID}")
	public ModelAndView getCategoryEditForm(@PathVariable(value="CID") int CID)
	{
		
		Category category=this.categoryService.getCategoryByCID(CID);
		return new ModelAndView("editCategoryForm","editCategoryObj",category);
	}
	
	@RequestMapping(value="/admin/category/editCategory", method=RequestMethod.POST)
	public String editCategory(@ModelAttribute(value="editCategoryObj") Category category)
	{
		categoryService.editCategory(category);
		return "redirect:/getAllCategories";
	}
	

	//Supplier CRUD Operations
	@RequestMapping(value="/admin/supplier/addSupplier", method=RequestMethod.GET)
	public String getSupplierForm(Model model)
	{
		
		Product product=new Product();
		Supplier supplier=new Supplier();
		supplier.setSID(612);
		product.setSupplier(supplier);
		model.addAttribute("supplierFormObj", supplier);
		return "supplierForm";	
	}
	

	@RequestMapping(value="/admin/supplier/addSupplier", method=RequestMethod.POST)
	public String addSupplier(@Valid@ModelAttribute(value="supplierFormObj") Supplier supplier, BindingResult result)
	{
		if(result.hasErrors())
			return "supplierForm";
		supplierService.addSupplier(supplier);
		return "redirect:/getAllSuppliers";	
	}

	
	@RequestMapping("/getAllSuppliers")
	public ModelAndView getAllSupplier() 
	{
		List<Supplier> supplier=supplierService.getAllSupplier();
		return new ModelAndView("SupplierList","supplier",supplier);
	}

	@RequestMapping("/getsupplierBySID/{SID}")
	public ModelAndView getSupplierBySID(@PathVariable(value="SID") int SID )
	{
		
	Supplier s=supplierService.getSupplierBySID(SID);
		return new ModelAndView("SupplierList","productObj",s);	 
	}


	@RequestMapping("/admin/supplier/delete/{SID}")
	public String deleteSupplier(@PathVariable(value="SID") int SID)
	{
		supplierService.deleteSupplier(SID);
		return "redirect:/getAllSuppliers";
	}

	@RequestMapping(value="/admin/supplier/editSupplier/{SID}")
	public ModelAndView getSupplierEditForm(@PathVariable(value="SID") int SID)
	{
		Supplier supplier=this.supplierService.getSupplierBySID(SID);
		return new ModelAndView("editSupplierForm","editSupplierObj",supplier);
	}
	
	@RequestMapping(value="/admin/supplier/editSupplier", method=RequestMethod.POST)
	public String editsupplier(@ModelAttribute(value="editSupplierObj") Supplier supplier)
	{
		supplierService.editSupplier(supplier);
		return "redirect:/getAllSuppliers";
	}
}
