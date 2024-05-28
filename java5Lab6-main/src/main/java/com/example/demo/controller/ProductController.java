package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import com.example.demo.entity.Report;
import com.example.demo.service.SessionSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.ProductDao;
import com.example.demo.entity.Product;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	@Autowired
	ProductDao dao;
	@Autowired
	SessionSevice session;

	@RequestMapping("product/index")
	public String index(Model model) {
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "product/index";
	}

	@RequestMapping("product/search")
	public String search(Model model, @RequestParam("min")Optional<Double> min, @RequestParam("max")Optional<Double> max) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		List<Product> items = dao.findAllProducts(minPrice, maxPrice);
		model.addAttribute("items", items);
		return "product/index";
	}
	//search product and combine with pagination by product
	@RequestMapping("product/search-and-page")
	public String searchAndPage(Model model, @RequestParam("keywords")Optional<String> kw, @RequestParam("p")Optional<Integer> p) {
		String kword = kw.orElse(session.get("keywords"));// if kw null value => get default value
		session.set("keywords", kword);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = dao.findAllProductsByNameLike("%" + kword + "%", pageable);
		model.addAttribute("page", page);
		return "product/page-search";
	}

	@RequestMapping("report/inventory-by-category")
	public String inventoryByCategory(Model model) {
		List<Report> items = dao.findAllReports();
		model.addAttribute("items", items);
		return "report/inventory-by-category";
	}
}
