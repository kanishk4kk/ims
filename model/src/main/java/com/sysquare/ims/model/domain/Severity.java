package com.sysquare.ims.model.domain;
// Generated 28 Aug, 2012 9:23:52 PM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Severity generated by hbm2java
 */
@Entity
@Table(name="severity"
    ,catalog="ims"
    , uniqueConstraints = @UniqueConstraint(columnNames="name") 
)
public class Severity  implements java.io.Serializable {


     private Integer severityId;
     private String name;
     private boolean isActive;

    public Severity() {
    }

	
    public Severity(boolean isActive) {
        this.isActive = isActive;
    }
    public Severity(String name, boolean isActive) {
       this.name = name;
       this.isActive = isActive;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="severity_id", unique=true, nullable=false)
    public Integer getSeverityId() {
        return this.severityId;
    }
    
    public void setSeverityId(Integer severityId) {
        this.severityId = severityId;
    }
    
    @Column(name="name", unique=true, length=64)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="is_active", nullable=false)
    public boolean isIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }




}


