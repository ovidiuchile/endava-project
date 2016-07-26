package com.endava.learning.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
/*import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;*/

//import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "users")
public class User {
	@Id
	@Column(name = "user_id")
	private Long user_id;
	
	@Column(name = "user_type")
	private String user_type;
	
	/*@Size(min=4, max=30)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	@NotNull*/
	@Column(name = "name")
	private String name;
	
	/*@Size(min=4, max=30)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	@NotNull*/
	@Column(name = "surname")
	private String surname;
	
	/*@Size(min=6, max=30)
	@Pattern(regexp=".+@.+\\..+", message="Please provide a valid email address")*/
	//@Email(message="Please provide a valid email address")
	@Column(name = "email")
	private String email;
	
	/*@Size(min=8, max=30)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	@NotNull*/
	@Column(name = "password")
	private String password;
	
	/*@Size(min=4, max=30)
	@Pattern(regexp = "[a-zA-Z]*")
	@NotNull*/
	@Column(name = "city")
	private String city;
	
	/*@Size(min=4, max=50)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	@NotNull*/
	@Column(name = "address")
	private String address;
	
	/*@Size(min=4, max=30)
	@Pattern(regexp = "[0-9]*")
	@NotNull*/
	@Column(name = "phoneNumber")
	private String phoneNumber;
	
	/*@Size(min=4, max=30)
	@Pattern(regexp = "[a-zA-Z]*")
	@NotNull*/
	@Column(name = "country")
	private String country;

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
}