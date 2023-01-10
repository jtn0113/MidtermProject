package com.skilldistillery.sip.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private Boolean enabled;
	private String role;
	@Column(name = "address_id")
	private Integer addressId;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	private String image;
	@Column(name = "about_me")
	private String aboutMe;
	@Column(name = "date_of_birth")
	private LocalDate birthDate;
	@OneToMany(mappedBy = "user")
	private List<BeerTasting> beerTasting;
	@OneToMany(mappedBy = "user")
	private List<WineTasting> wineTasting;
	@OneToMany(mappedBy = "user")
	private List<SpiritTasting> spiritTasting;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "drinking_buddy", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "friend_id"))
	private List<User> following;

	@ManyToMany(mappedBy = "following")
	private List<User> followedBy;

	public User() {
		super();
	}

	public List<User> getFollowing() {
		return following;
	}

	public void setFollowing(List<User> following) {
		this.following = following;
	}

	public List<User> getFollowedBy() {
		return followedBy;
	}

	public void setFollowedBy(List<User> followedBy) {
		this.followedBy = followedBy;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public List<BeerTasting> getBeerTasting() {
		return beerTasting;
	}

	public void setBeerTasting(List<BeerTasting> beerTasting) {
		this.beerTasting = beerTasting;
	}

	public List<WineTasting> getWineTasting() {
		return wineTasting;
	}

	public void setWineTasting(List<WineTasting> wineTasting) {
		this.wineTasting = wineTasting;
	}

	public List<SpiritTasting> getSpiritTasting() {
		return spiritTasting;
	}

	public void setSpiritTasting(List<SpiritTasting> spiritTasting) {
		this.spiritTasting = spiritTasting;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", addressId=" + addressId + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", image=" + image + ", aboutMe=" + aboutMe + ", birthDate=" + birthDate + "]";
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
		User other = (User) obj;
		return id == other.id;
	}

}
