package com.example.demo.dao;

import com.example.demo.entity.Report;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Product;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDao extends JpaRepository<Product, Integer>{

    @Query("SELECT o FROM Product o WHERE  o.price BETWEEN ?1 AND ?2")
    List<Product> findAllProducts(double minPrice, double maxPrice);

//    @Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
    Page<Product> findAllProductsByNameLike(String keyword, Pageable pageable);

    @Query("SELECT new Report (o.category, sum(o.price), count(o)) " +
            "FROM Product o " +
            "GROUP BY o.category " +
            "ORDER BY SUM(o.price) DESC")
    List<Report> findAllReports();
}
