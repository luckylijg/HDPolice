package com.goldsoft.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * Module entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "module", catalog = "police")
public class Module implements java.io.Serializable {

	// Fields

	private String moduleid;
	private String name;
	private String icon;
	private String link;
	private Set<Role> roles = new HashSet<Role>(0);

	// Constructors

	/** default constructor */
	public Module() {
	}

	/** minimal constructor */
	public Module(String moduleid, String name) {
		this.moduleid = moduleid;
		this.name = name;
	}

	/** full constructor */
	public Module(String moduleid, String name, String icon, String link,
			Set<Role> roles) {
		this.moduleid = moduleid;
		this.name = name;
		this.icon = icon;
		this.link = link;
		this.roles = roles;
	}

	// Property accessors
	@Id
	@Column(name = "moduleid", unique = true, nullable = false, length = 30)
	public String getModuleid() {
		return this.moduleid;
	}

	public void setModuleid(String moduleid) {
		this.moduleid = moduleid;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "icon", length = 100)
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "link", length = 200)
	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "modules")
	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

}