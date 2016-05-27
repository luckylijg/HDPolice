package com.goldsoft.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "department", catalog = "police", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Department implements java.io.Serializable {

	// Fields

	private Integer departmentid;
	private Integer type;
	private String name;
	private String address;
	private String phone;
	private String description;
	private Set<Complaint> complaints = new HashSet<Complaint>(0);
	private Set<Feedback> feedbacks = new HashSet<Feedback>(0);
	private Set<Complaint> complaints_1 = new HashSet<Complaint>(0);
	private Set<User> users = new HashSet<User>(0);

	// Constructors

	/** default constructor */
	public Department() {
	}

	/** minimal constructor */
	public Department(String name) {
		this.name = name;
	}

	/** full constructor */
	public Department(Integer type, String name, String address, String phone,
			String description, Set<Complaint> complaints,
			Set<Feedback> feedbacks, Set<Complaint> complaints_1,
			Set<User> users) {
		this.type = type;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.description = description;
		this.complaints = complaints;
		this.feedbacks = feedbacks;
		this.complaints_1 = complaints_1;
		this.users = users;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "departmentid", unique = true, nullable = false)
	public Integer getDepartmentid() {
		return this.departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}

	@Column(name = "type")
	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "name", unique = true, nullable = false, length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "address", length = 100)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone", length = 40)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "description", length = 100)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "department")
	public Set<Complaint> getComplaints() {
		return this.complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "department")
	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
	@JoinTable(name = "complaintdepartment", catalog = "police", joinColumns = { @JoinColumn(name = "departmentid", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "complaintid", nullable = false, updatable = false) })
	public Set<Complaint> getComplaints_1() {
		return this.complaints_1;
	}

	public void setComplaints_1(Set<Complaint> complaints_1) {
		this.complaints_1 = complaints_1;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "department")
	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}