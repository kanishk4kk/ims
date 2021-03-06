package com.sysquare.ims.model.domain;
// Generated 28 Aug, 2012 9:23:52 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CourseSubjectStudent generated by hbm2java
 */
@Entity
@Table(name="course_subject_student"
    ,catalog="ims"
)
public class CourseSubjectStudent  implements java.io.Serializable {


     private Integer courseSubjectStudentId;
     private CourseSubject courseSubject;
     private Student student;
     private Date createDate;
     private Date lastModifiedDate;
     private boolean isActive;

    public CourseSubjectStudent() {
    }

	
    public CourseSubjectStudent(CourseSubject courseSubject, Student student, Date lastModifiedDate, boolean isActive) {
        this.courseSubject = courseSubject;
        this.student = student;
        this.lastModifiedDate = lastModifiedDate;
        this.isActive = isActive;
    }
    public CourseSubjectStudent(CourseSubject courseSubject, Student student, Date createDate, Date lastModifiedDate, boolean isActive) {
       this.courseSubject = courseSubject;
       this.student = student;
       this.createDate = createDate;
       this.lastModifiedDate = lastModifiedDate;
       this.isActive = isActive;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="course_subject_student_id", unique=true, nullable=false)
    public Integer getCourseSubjectStudentId() {
        return this.courseSubjectStudentId;
    }
    
    public void setCourseSubjectStudentId(Integer courseSubjectStudentId) {
        this.courseSubjectStudentId = courseSubjectStudentId;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="course_subject_id", nullable=false)
    public CourseSubject getCourseSubject() {
        return this.courseSubject;
    }
    
    public void setCourseSubject(CourseSubject courseSubject) {
        this.courseSubject = courseSubject;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="student_id", nullable=false)
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_date", length=19)
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="last_modified_date", nullable=false, length=19)
    public Date getLastModifiedDate() {
        return this.lastModifiedDate;
    }
    
    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
    
    @Column(name="is_active", nullable=false)
    public boolean isIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }




}


