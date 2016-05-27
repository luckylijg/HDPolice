package com.goldsoft.model;

import java.sql.Timestamp;
import java.util.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "police")
public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private Department department;
	private String username;
	private String pwd;
	private String sno;
	private Timestamp entrytime;
	private String job;
	private String realname;
	private Integer sex;
	private Date birthday;
	private String idnumber;
	private String photo;
	private String mobile;
	private String phone;
	private String email;
	private String qq;
	private Integer state;
	private Timestamp indate;
	private Timestamp latestLoginTime;
	private Integer loginTimes;
	private String description;
	private Set<Complaint> complaintsForUserid2 = new HashSet<Complaint>(0);
	private Set<Complaint> complaintsForUserid = new HashSet<Complaint>(0);
	private Set<Role> roles = new HashSet<Role>(0);
	private Set<Feedback> feedbacks = new HashSet<Feedback>(0);
	private Set<Complaint> complaints = new HashSet<Complaint>(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(Department department, String username, String realname,
			Timestamp indate) {
		this.department = department;
		this.username = username;
		this.realname = realname;
		this.indate = indate;
	}

	/** full constructor */
	public User(Department department, String username, String pwd, String sno,
			Timestamp entrytime, String job, String realname, Integer sex,
			Date birthday, String idnumber, String photo, String mobile,
			String phone, String email, String qq, Integer state,
			Timestamp indate, Timestamp latestLoginTime, Integer loginTimes,
			String description, Set<Complaint> complaintsForUserid2,
			Set<Complaint> complaintsForUserid, Set<Role> roles,
			Set<Feedback> feedbacks, Set<Complaint> complaints) {
		this.department = department;
		this.username = username;
		this.pwd = pwd;
		this.sno = sno;
		this.entrytime = entrytime;
		this.job = job;
		this.realname = realname;
		this.sex = sex;
		this.birthday = birthday;
		this.idnumber = idnumber;
		this.photo = photo;
		this.mobile = mobile;
		this.phone = phone;
		this.email = email;
		this.qq = qq;
		this.state = state;
		this.indate = indate;
		this.latestLoginTime = latestLoginTime;
		this.loginTimes = loginTimes;
		this.description = description;
		this.complaintsForUserid2 = complaintsForUserid2;
		this.complaintsForUserid = complaintsForUserid;
		this.roles = roles;
		this.feedbacks = feedbacks;
		this.complaints = complaints;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userid", unique = true, nullable = false)
	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "departmentid", nullable = false)
	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Column(name = "username", nullable = false, length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "pwd", length = 20)
	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Column(name = "sno", length = 10)
	public String getSno() {
		return this.sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	@Column(name = "entrytime", length = 0)
	public Timestamp getEntrytime() {
		return this.entrytime;
	}

	public void setEntrytime(Timestamp entrytime) {
		this.entrytime = entrytime;
	}

	@Column(name = "job", length = 20)
	public String getJob() {
		return this.job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	@Column(name = "realname", nullable = false, length = 20)
	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	@Column(name = "sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birthday", length = 0)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "idnumber", length = 18)
	public String getIdnumber() {
		return this.idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	@Column(name = "photo", length = 100)
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "mobile", length = 30)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "phone", length = 30)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "email", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "qq", length = 20)
	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Column(name = "state")
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "indate", nullable = false, length = 0)
	public Timestamp getIndate() {
		return this.indate;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	@Column(name = "latest_login_time", length = 0)
	public Timestamp getLatestLoginTime() {
		return this.latestLoginTime;
	}

	public void setLatestLoginTime(Timestamp latestLoginTime) {
		this.latestLoginTime = latestLoginTime;
	}

	@Column(name = "login_times")
	public Integer getLoginTimes() {
		return this.loginTimes;
	}

	public void setLoginTimes(Integer loginTimes) {
		this.loginTimes = loginTimes;
	}

	@Column(name = "description", length = 200)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "userByUserid2")
	public Set<Complaint> getComplaintsForUserid2() {
		return this.complaintsForUserid2;
	}

	public void setComplaintsForUserid2(Set<Complaint> complaintsForUserid2) {
		this.complaintsForUserid2 = complaintsForUserid2;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "userByUserid")
	public Set<Complaint> getComplaintsForUserid() {
		return this.complaintsForUserid;
	}

	public void setComplaintsForUserid(Set<Complaint> complaintsForUserid) {
		this.complaintsForUserid = complaintsForUserid;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
	@JoinTable(name = "userrole", catalog = "police", joinColumns = { @JoinColumn(name = "userid", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "roleid", nullable = false, updatable = false) })
	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
	@JoinTable(name = "complaintinspector", catalog = "police", joinColumns = { @JoinColumn(name = "userid", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "complaintid", nullable = false, updatable = false) })
	public Set<Complaint> getComplaints() {
		return this.complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}

}