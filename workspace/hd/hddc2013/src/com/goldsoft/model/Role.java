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
 * Role entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role", catalog = "police", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Role implements java.io.Serializable {

	// Fields

	private Integer roleid;
	private String name;
	private String description;
	private Set<Module> modules = new HashSet<Module>(0);
	private Set<User> users = new HashSet<User>(0);

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String name) {
		this.name = name;
	}

	/** full constructor */
	public Role(String name, String description, Set<Module> modules,
			Set<User> users) {
		this.name = name;
		this.description = description;
		this.modules = modules;
		this.users = users;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "roleid", unique = true, nullable = false)
	public Integer getRoleid() {
		return this.roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
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
	@JoinTable(name = "rolemodule", catalog = "police", joinColumns = { @JoinColumn(name = "roleid", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "moduleid", nullable = false, updatable = false) })
	public Set<Module> getModules() {
		return this.modules;
	}

	public void setModules(Set<Module> modules) {
		this.modules = modules;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "roles")
	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}