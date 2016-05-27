package com.goldsoft.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Complaint entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "complaint", catalog = "police", uniqueConstraints = @UniqueConstraint(columnNames = "sno"))
public class Complaint implements java.io.Serializable {

	// Fields

	private Integer complaintid;
	private Department department;
	private User userByUserid;
	private User userByUserid2;
	private Integer type;
	private String sno;
	private Timestamp time;
	private String name;
	private Integer sex;
	private Integer age;
	private String profession;
	private String address;
	private Integer mode;
	private String idnumber;
	private String phone;
	private String people;
	private String question;
	private String filename;
	private String leadercomment;
	private String investigateresult;
	private String filename2;
	private Integer yesno;
	private Integer visitopinion;
	private Timestamp time2;
	private Integer score;
	private Integer earlywarning;
	private Integer leaderapproved;
	private String remark;
	private Timestamp entertime;
	private Timestamp edittime;
	private String ip;
	private Set<QuestionSort> questionSorts = new HashSet<QuestionSort>(0);
	private Set<HandleSort> handleSorts = new HashSet<HandleSort>(0);
	private Set<Feedback> feedbacks = new HashSet<Feedback>(0);
	private Set<User> users = new HashSet<User>(0);
	private Set<Department> departments = new HashSet<Department>(0);

	// Constructors

	/** default constructor */
	public Complaint() {
	}

	/** minimal constructor */
	public Complaint(Department department, Integer type, String sno,
			Timestamp time, String question, Timestamp entertime,
			Timestamp edittime) {
		this.department = department;
		this.type = type;
		this.sno = sno;
		this.time = time;
		this.question = question;
		this.entertime = entertime;
		this.edittime = edittime;
	}

	/** full constructor */
	public Complaint(Department department, User userByUserid,
			User userByUserid2, Integer type, String sno, Timestamp time,
			String name, Integer sex, Integer age, String profession,
			String address, Integer mode, String idnumber, String phone,
			String people, String question, String filename,
			String leadercomment, String investigateresult, String filename2,
			Integer yesno, Integer visitopinion, Timestamp time2,
			Integer score, Integer earlywarning, Integer leaderapproved,
			String remark, Timestamp entertime, Timestamp edittime, String ip,
			Set<QuestionSort> questionSorts, Set<HandleSort> handleSorts,
			Set<Feedback> feedbacks, Set<User> users,
			Set<Department> departments) {
		this.department = department;
		this.userByUserid = userByUserid;
		this.userByUserid2 = userByUserid2;
		this.type = type;
		this.sno = sno;
		this.time = time;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.profession = profession;
		this.address = address;
		this.mode = mode;
		this.idnumber = idnumber;
		this.phone = phone;
		this.people = people;
		this.question = question;
		this.filename = filename;
		this.leadercomment = leadercomment;
		this.investigateresult = investigateresult;
		this.filename2 = filename2;
		this.yesno = yesno;
		this.visitopinion = visitopinion;
		this.time2 = time2;
		this.score = score;
		this.earlywarning = earlywarning;
		this.leaderapproved = leaderapproved;
		this.remark = remark;
		this.entertime = entertime;
		this.edittime = edittime;
		this.ip = ip;
		this.questionSorts = questionSorts;
		this.handleSorts = handleSorts;
		this.feedbacks = feedbacks;
		this.users = users;
		this.departments = departments;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "complaintid", unique = true, nullable = false)
	public Integer getComplaintid() {
		return this.complaintid;
	}

	public void setComplaintid(Integer complaintid) {
		this.complaintid = complaintid;
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
	@JoinColumn(name = "userid")
	public User getUserByUserid() {
		return this.userByUserid;
	}

	public void setUserByUserid(User userByUserid) {
		this.userByUserid = userByUserid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid2")
	public User getUserByUserid2() {
		return this.userByUserid2;
	}

	public void setUserByUserid2(User userByUserid2) {
		this.userByUserid2 = userByUserid2;
	}

	@Column(name = "type", nullable = false)
	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "sno", unique = true, nullable = false, length = 30)
	public String getSno() {
		return this.sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	@Column(name = "time", nullable = false, length = 0)
	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Column(name = "name", length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "age")
	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "profession", length = 30)
	public String getProfession() {
		return this.profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	@Column(name = "address", length = 100)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "mode")
	public Integer getMode() {
		return this.mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}

	@Column(name = "idnumber", length = 18)
	public String getIdnumber() {
		return this.idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	@Column(name = "phone", length = 30)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "people", length = 100)
	public String getPeople() {
		return this.people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	@Column(name = "question", nullable = false, length = 2048)
	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column(name = "filename", length = 300)
	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Column(name = "leadercomment", length = 200)
	public String getLeadercomment() {
		return this.leadercomment;
	}

	public void setLeadercomment(String leadercomment) {
		this.leadercomment = leadercomment;
	}

	@Column(name = "investigateresult", length = 300)
	public String getInvestigateresult() {
		return this.investigateresult;
	}

	public void setInvestigateresult(String investigateresult) {
		this.investigateresult = investigateresult;
	}

	@Column(name = "filename2", length = 300)
	public String getFilename2() {
		return this.filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	@Column(name = "yesno")
	public Integer getYesno() {
		return this.yesno;
	}

	public void setYesno(Integer yesno) {
		this.yesno = yesno;
	}

	@Column(name = "visitopinion")
	public Integer getVisitopinion() {
		return this.visitopinion;
	}

	public void setVisitopinion(Integer visitopinion) {
		this.visitopinion = visitopinion;
	}

	@Column(name = "time2", length = 0)
	public Timestamp getTime2() {
		return this.time2;
	}

	public void setTime2(Timestamp time2) {
		this.time2 = time2;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "earlywarning")
	public Integer getEarlywarning() {
		return this.earlywarning;
	}

	public void setEarlywarning(Integer earlywarning) {
		this.earlywarning = earlywarning;
	}

	@Column(name = "leaderapproved")
	public Integer getLeaderapproved() {
		return this.leaderapproved;
	}

	public void setLeaderapproved(Integer leaderapproved) {
		this.leaderapproved = leaderapproved;
	}

	@Column(name = "remark", length = 300)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "entertime", nullable = false, length = 0)
	public Timestamp getEntertime() {
		return this.entertime;
	}

	public void setEntertime(Timestamp entertime) {
		this.entertime = entertime;
	}

	@Column(name = "edittime", nullable = false, length = 0)
	public Timestamp getEdittime() {
		return this.edittime;
	}

	public void setEdittime(Timestamp edittime) {
		this.edittime = edittime;
	}

	@Column(name = "ip", length = 40)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "complaints")
	public Set<QuestionSort> getQuestionSorts() {
		return this.questionSorts;
	}

	public void setQuestionSorts(Set<QuestionSort> questionSorts) {
		this.questionSorts = questionSorts;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "complaints")
	public Set<HandleSort> getHandleSorts() {
		return this.handleSorts;
	}

	public void setHandleSorts(Set<HandleSort> handleSorts) {
		this.handleSorts = handleSorts;
	}

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "complaint")
	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "complaints")
	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "complaints_1")
	public Set<Department> getDepartments() {
		return this.departments;
	}

	public void setDepartments(Set<Department> departments) {
		this.departments = departments;
	}

}