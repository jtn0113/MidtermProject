package com.skilldistillery.sip.entities;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="wine_tasting")
public class WineTasting {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "user_id")
	private int userId;
	private String notes;
	private double price;
	private Integer rating;
	private String photo;

	@Column(name = "date_sampled")
	private LocalDate dateSampled;

	@Column(name = "wine_id")
	private int wineId;

	public WineTasting() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}


	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public LocalDate getDateSampled() {
		return dateSampled;
	}

	public void setDateSampled(LocalDate dateSampled) {
		this.dateSampled = dateSampled;
	}

	public int getWineId() {
		return wineId;
	}

	public void setWineId(int wineId) {
		this.wineId = wineId;
	}

	@Override
	public String toString() {
		return "WineTasting [id=" + id + ", userId=" + userId + ", notes=" + notes + ", price=" + price + ", rating="
				+ rating + ", photo=" + photo + ", dateSampled=" + dateSampled + ", wineId=" + wineId + "]";
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
		WineTasting other = (WineTasting) obj;
		return id == other.id;
	}

}
