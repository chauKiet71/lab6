package com.example.demo.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Idsp")
	Long id;
	
	@Column(name = "Names")
	String name;
	
	@Column(name = "Images")
	String image;
	
	@Column(name = "Prices")
	Double price;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "Create_date")
	Date createDate = new Date() ;

	Boolean Avaliable;
	
	@Column(name = "Id")
	String categoryId;
	
	@ManyToOne
	@JoinColumn(name = "Id", insertable = false, updatable = false)
	Category category;
//	
//	@OneToMany(mappedBy = "product")
//	List<OrderDetail> orderDetail;
}
