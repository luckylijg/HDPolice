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
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * HandleSort entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "handlesort", catalog = "police", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class HandleSort implements java.io.Serializable {

	// Fields

	private Integer handlesortid;
	private String name;
	private String description;
	private Set<Complaint> complaints = new HashSet<Complaint>(0);

	// Constructors

	/** default constructor */
	public HandleSort() {
	}

	/** minimal constructor */
	public HandleSort(String name) {
		this.name = name;
	}

	/** full constructor */
	public HandleSort(String name, String description, Set<Complaint> complaints) {
		this.name = name;
		this.description = description;
		this.complaints = complaints;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "handlesortid", unique = true, nullable = false)
	public Integer getHandlesortid() {
		return this.handlesortid;
	}

	public void setHandlesortid(Integer handlesortid) {
		this.handlesortid = handlesortid;
	}

	@Column(name = "name", unique = true, nullable = false, length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description", length = 100)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
	@JoinTable(name = "complainthandlesort", catalog = "police", joinColumns = { @JoinColumn(name = "handlesortid", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "complaintid", nullable = false, updatable = false) })
	public Set<Complaint> getComplaints() {
		return this.complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}

}