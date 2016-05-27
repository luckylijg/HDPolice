package com.goldsoft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * ScoreSerial entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "scoreserial", catalog = "police", uniqueConstraints = @UniqueConstraint(columnNames = "score"))
public class ScoreSerial implements java.io.Serializable {

	// Fields

	private Integer serialid;
	private Integer score;

	// Constructors

	/** default constructor */
	public ScoreSerial() {
	}

	/** full constructor */
	public ScoreSerial(Integer score) {
		this.score = score;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "serialid", unique = true, nullable = false)
	public Integer getSerialid() {
		return this.serialid;
	}

	public void setSerialid(Integer serialid) {
		this.serialid = serialid;
	}

	@Column(name = "score", unique = true, nullable = false)
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

}