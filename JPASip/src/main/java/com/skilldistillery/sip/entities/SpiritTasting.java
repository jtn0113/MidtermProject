package com.skilldistillery.sip.entities;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SpiritTasting {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "user_id")
	private int userId;
	private String notes;
	private double price;
	private int rating;
	private String photo;
	@Column(name = "date_sampled")
	private LocalDate dateSampled;
	@Column(name = "spirit_id")
	private int spiritId;

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
		SpiritTasting other = (SpiritTasting) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "SpiritTasting [id=" + id + ", userId=" + userId + ", notes=" + notes + ", price=" + price + ", rating="
				+ rating + ", photo=" + photo + ", dateSampled=" + dateSampled + ", spiritId=" + spiritId + "]";
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

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
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

	public int getSpiritId() {
		return spiritId;
	}

	public void setSpiritId(int spiritId) {
		this.spiritId = spiritId;
	}

	public SpiritTasting() {
		super();
	}

}
