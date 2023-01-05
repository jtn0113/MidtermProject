package com.skilldistillery.sip.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="wine_type")
public class WineType {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	
//	@ManyToOne
//	@JoinColumn(name="wine_color_id")
//	private WineColor wineColor;

	@JoinColumn(name="wine_scale")
	private String wineScale;
	
	@JoinColumn(name="wine_color")
	private String wineColor;
	
	
	public WineType() {
		super();
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

//	public WineColor getWineColor() {
//		return wineColor;
//	}
//
//	public void setWineColor(WineColor wineColor) {
//		this.wineColor = wineColor;
//	}

	@Override
	public String toString() {
		return "WineType [id=" + id + ", name=" + name + ", description=" + description + ", wineScale=" + wineScale
				+ ", wineColor=" + wineColor + "]";
	}

	public String getWineScale() {
		return wineScale;
	}

	public void setWineScale(String wineScale) {
		this.wineScale = wineScale;
	}

	public String getWineColor() {
		return wineColor;
	}

	public void setWineColor(String wineColor) {
		this.wineColor = wineColor;
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
		WineType other = (WineType) obj;
		return id == other.id;
	}

}
