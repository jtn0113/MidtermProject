package com.skilldistillery.sip.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Wine {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	@Column(name = "wine_type_id")
	private int wineTypeId;
	@Column(name = "image_url")
	private String imageUrl;
	@Column(name = "vineyard_name")
	private String vineyardName;
	@Column(name = "vineyard_location")
	private String vineyardLocation;
	@Column(name = "vintage_year")
	private Integer vintageYear;
	private Double abv;

	public Wine() {
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

	public int getWineTypeId() {
		return wineTypeId;
	}

	public void setWineTypeId(int wineTypeId) {
		this.wineTypeId = wineTypeId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getVineyardName() {
		return vineyardName;
	}

	public void setVineyardName(String vineyardName) {
		this.vineyardName = vineyardName;
	}

	public String getVineyardLocation() {
		return vineyardLocation;
	}

	public void setVineyardLocation(String vineyardLocation) {
		this.vineyardLocation = vineyardLocation;
	}

	public Integer getVintageYear() {
		return vintageYear;
	}

	public void setVintageYear(Integer vintageYear) {
		this.vintageYear = vintageYear;
	}

	public Double getAbv() {
		return abv;
	}

	public void setAbv(Double abv) {
		this.abv = abv;
	}

	@Override
	public String toString() {
		return "Wine [id=" + id + ", name=" + name + ", description=" + description + ", wineTypeId=" + wineTypeId
				+ ", imageUrl=" + imageUrl + ", vineyardName=" + vineyardName + ", vineyardLocation=" + vineyardLocation
				+ ", vintageYear=" + vintageYear + ", abv=" + abv + "]";
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
		Wine other = (Wine) obj;
		return id == other.id;
	}

}
