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
public class Spirit {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="spirit_type_id")
	private SpiritType spiritType;
	
	
	private String name;
	private String description;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	private int proof;
	
	@Column(name = "origin_country")
	private String originCountry;
	
	@Column(name = "origin_state_province")
	private String originStateProvince;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public SpiritType getSpiritType() {
		return spiritType;
	}

	public void setSpiritType(SpiritType spiritType) {
		this.spiritType = spiritType;
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getProof() {
		return proof;
	}

	public void setProof(int proof) {
		this.proof = proof;
	}

	public String getOriginCountry() {
		return originCountry;
	}

	public void setOriginCountry(String originCountry) {
		this.originCountry = originCountry;
	}

	public String getOriginStateProvince() {
		return originStateProvince;
	}

	public void setOriginStateProvince(String originStateProvince) {
		this.originStateProvince = originStateProvince;
	}

	public Spirit() {
		super();
	}

	@Override
	public String toString() {
		return "Spirit [id=" + id + ", spiritType=" + spiritType + ", name=" + name + ", description=" + description
				+ ", imageUrl=" + imageUrl + ", proof=" + proof + ", originCountry=" + originCountry
				+ ", originStateProvince=" + originStateProvince + "]";
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
		Spirit other = (Spirit) obj;
		return id == other.id;
	}

}
