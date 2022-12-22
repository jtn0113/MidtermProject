package com.skilldistillery.sip.entities;

import java.util.Objects;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Beer {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(name="brew_type_id")
	private int brewTypeId;
	@Column(name="origin_city")
	private String originCity;
	@Column(name="origin_state")
	private String originState;
	private double abv;
	private String description;	
	
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
		return "Beer [id=" + id + ", name=" + name + ", brewTypeId=" + brewTypeId + ", originCity=" + originCity
				+ ", originState=" + originState + ", abv=" + abv + ", description=" + description + ", imageUrl="
				+ imageUrl + "]";
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
	public int getBrewTypeId() {
		return brewTypeId;
	}
	public void setBrewTypeId(int brewTypeId) {
		this.brewTypeId = brewTypeId;
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
	@Column(name="image_url")
	private String imageUrl;
}
