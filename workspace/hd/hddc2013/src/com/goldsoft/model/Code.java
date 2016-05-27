package com.goldsoft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Code entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "code", catalog = "police")
public class Code implements java.io.Serializable {

	// Fields

	private Integer codeid;
	private String nextcode;
	private String description;

	// Constructors

	/** default constructor */
	public Code() {
	}

	/** minimal constructor */
	public Code(String nextcode) {
		this.nextcode = nextcode;
	}

	/** full constructor */
	public Code(String nextcode, String description) {
		this.nextcode = nextcode;
		this.description = description;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "codeid", unique = true, nullable = false)
	public Integer getCodeid() {
		return this.codeid;
	}

	public void setCodeid(Integer codeid) {
		this.codeid = codeid;
	}

	@Column(name = "nextcode", nullable = false, length = 20)
	public String getNextcode() {
		return this.nextcode;
	}

	public void setNextcode(String nextcode) {
		this.nextcode = nextcode;
	}

	@Column(name = "description", length = 100)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}