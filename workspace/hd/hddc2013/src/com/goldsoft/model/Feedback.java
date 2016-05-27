package com.goldsoft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "feedback", catalog = "police")
public class Feedback implements java.io.Serializable {

	// Fields

	private Integer feedbackid;
	private Department department;
	private Complaint complaint;
	private User user;
	private String message;
	private String description;

	// Constructors

	/** default constructor */
	public Feedback() {
	}

	/** minimal constructor */
	public Feedback(Department department, Complaint complaint) {
		this.department = department;
		this.complaint = complaint;
	}

	/** full constructor */
	public Feedback(Department department, Complaint complaint, User user,
			String message, String description) {
		this.department = department;
		this.complaint = complaint;
		this.user = user;
		this.message = message;
		this.description = description;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "feedbackid", unique = true, nullable = false)
	public Integer getFeedbackid() {
		return this.feedbackid;
	}

	public void setFeedbackid(Integer feedbackid) {
		this.feedbackid = feedbackid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "departmentid", nullable = false)
	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "complaintid", nullable = false)
	public Complaint getComplaint() {
		return this.complaint;
	}

	public void setComplaint(Complaint complaint) {
		this.complaint = complaint;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "message", length = 1000)
	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name = "description", length = 100)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}