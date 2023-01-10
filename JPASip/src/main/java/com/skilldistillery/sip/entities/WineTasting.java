package com.skilldistillery.sip.entities;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="wine_tasting")
public class WineTasting {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	private String notes;
	private double price;
	private Integer rating;
	private String photo;
	private static final DateTimeFormatter dateFmt = DateTimeFormatter.ofPattern("MMM d, yyyy");

	@Column(name = "date_sampled")
	private LocalDate dateSampled;

	@ManyToOne
	@JoinColumn(name="wine_id")
	private Wine wine;

	public WineTasting() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Wine getWine() {
		return wine;
	}

	public void setWine(Wine wine) {
		this.wine = wine;
	}
	
	public String getFormattedDate() {
		return dateFmt.format(dateSampled);
	}

	@Override
	public String toString() {
		return "WineTasting [id=" + id + ", user=" + user + ", notes=" + notes + ", price=" + price + ", rating="
				+ rating + ", photo=" + photo + ", dateSampled=" + dateSampled + ", wine=" + wine + "]";
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
