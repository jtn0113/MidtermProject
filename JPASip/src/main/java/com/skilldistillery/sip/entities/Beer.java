package com.skilldistillery.sip.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class Beer {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	
	@ManyToOne
	@JoinColumn(name="brew_type_id")
	private BrewType brewType;
	
	@Column(name="origin_city")
	private String originCity;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="origin_state")
	private String originState;
	
	private double abv;
	private String description;	
	
	@Column(name="brewing_company")
	private String brewingCompany;
	

	public Beer() {
		super();
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Beer other = (Beer) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "Beer [id=" + id + ", name=" + name + ", brewType=" + brewType + ", originCity=" + originCity
				+ ", originState=" + originState + ", abv=" + abv + ", description=" + description + ", brewingCompany="
				+ brewingCompany + ", imageUrl=" + imageUrl + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public BrewType getBrewType() {
		return brewType;
	}

	public void setBrewType(BrewType brewType) {
		this.brewType = brewType;
	}

	public String getOriginCity() {
		return originCity;
	}
	public void setOriginCity(String originCity) {
		this.originCity = originCity;
	}
	public String getOriginState() {
		return originState;
	}
	public void setOriginState(String originState) {
		this.originState = originState;
	}
	public double getAbv() {
		return abv;
	}
	public void setAbv(double abv) {
		this.abv = abv;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getBrewingCompany() {
		return brewingCompany;
	}
	
	public void setBrewingCompany(String brewingCompany) {
		this.brewingCompany = brewingCompany;
	}
}
