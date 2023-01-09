package com.skilldistillery.sip.entities;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="beer_tasting")
public class BeerTasting {
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
	@JoinColumn(name="beer_id")
	private Beer beer;

	public BeerTasting() {
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

	public String getDateSampled() {
		return dateFmt.format(dateSampled);
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

	public Beer getBeer() {
		return beer;
	}

	public void setBeer(Beer beer) {
		this.beer = beer;
	}


	@Override
	public String toString() {
		return "BeerTasting [id=" + id + ", user=" + user + ", notes=" + notes + ", price=" + price + ", rating="
				+ rating + ", photo=" + photo + ", dateSampled=" + dateSampled + ", beer=" + beer + "]";
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
		BeerTasting other = (BeerTasting) obj;
		return id == other.id;
	}

}
