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
import javax.persistence.UniqueConstraint;

/**
 * Note generated by hbm2java
 */
@Entity
@Table(name="note"
    ,catalog="ims"
    , uniqueConstraints = @UniqueConstraint(columnNames={"title", "course_subject_id"}) 
)
public class Note  implements java.io.Serializable {


     private Integer noteId;
     private Author author;
     private User user;
     private int courseSubjectId;
     private String title;
     private String fileName;
     private String filePath;
     private Date createDate;
     private Date lastModifiedDate;
     private boolean isActive;

    public Note() {
    }

	
    public Note(Author author, User user, int courseSubjectId, Date lastModifiedDate, boolean isActive) {
        this.author = author;
        this.user = user;
        this.courseSubjectId = courseSubjectId;
        this.lastModifiedDate = lastModifiedDate;
        this.isActive = isActive;
    }
    public Note(Author author, User user, int courseSubjectId, String title, String fileName, String filePath, Date createDate, Date lastModifiedDate, boolean isActive) {
       this.author = author;
       this.user = user;
       this.courseSubjectId = courseSubjectId;
       this.title = title;
       this.fileName = fileName;
       this.filePath = filePath;
       this.createDate = createDate;
       this.lastModifiedDate = lastModifiedDate;
       this.isActive = isActive;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="note_id", unique=true, nullable=false)
    public Integer getNoteId() {
        return this.noteId;
    }
    
    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="author_id", nullable=false)
    public Author getAuthor() {
        return this.author;
    }
    
    public void setAuthor(Author author) {
        this.author = author;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="updated_by", nullable=false)
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    @Column(name="course_subject_id", nullable=false)
    public int getCourseSubjectId() {
        return this.courseSubjectId;
    }
    
    public void setCourseSubjectId(int courseSubjectId) {
        this.courseSubjectId = courseSubjectId;
    }
    
    @Column(name="title", length=64)
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    @Column(name="file_name", length=64)
    public String getFileName() {
        return this.fileName;
    }
    
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    @Column(name="file_path", length=1024)
    public String getFilePath() {
        return this.filePath;
    }
    
    public void setFilePath(String filePath) {
        this.filePath = filePath;
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


