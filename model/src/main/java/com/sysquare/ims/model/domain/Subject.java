package com.sysquare.ims.model.domain;

// Generated 30 Sep, 2012 3:42:28 PM by Hibernate Tools 3.2.1.GA

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Subject generated by hbm2java
 */
@Entity
@Table(name = "subject", catalog = "ims", uniqueConstraints = @UniqueConstraint(columnNames = "title"))
public class Subject implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer subjectId;
	private String title;
	private Date createDate;
	private Date lastModifiedDate;
	private boolean isActive;
	private Set<CourseSubject> courseSubjects = new HashSet<CourseSubject>(0);
	private User updatedBy;

	public Subject() {
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "subject_id", unique = true, nullable = false)
	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "updated_by", nullable = false)
	public User getUpdatedBy() {
		return this.updatedBy;
	}

	public void setUpdatedBy(User updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Column(name = "title", unique = true, length = 64)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_modified_date", nullable = false, length = 19)
	public Date getLastModifiedDate() {
		return this.lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	@Column(name = "is_active", nullable = false)
	public boolean isIsActive() {
		return this.isActive;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "subject")
	public Set<CourseSubject> getCourseSubjects() {
		return this.courseSubjects;
	}

	public void setCourseSubjects(Set<CourseSubject> courseSubjects) {
		this.courseSubjects = courseSubjects;
	}

}
