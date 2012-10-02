package com.sysquare.ims.web.ui.dto;

import java.util.List;

import javax.persistence.Column;

import org.hibernate.validator.constraints.NotEmpty;
import org.jdto.annotation.Source;
import org.jdto.mergers.DateFormatMerger;
import org.springframework.web.multipart.MultipartFile;

public class RegistrationDTO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer studentId;
	@NotEmpty
	private String firstName;
	@NotEmpty
	private String lastName;
	@NotEmpty
    @Source(value="dob", merger=DateFormatMerger.class, mergerParam="dd/MMM/yyyy")
	private String dob;
	@NotEmpty
	private String gender;
	@NotEmpty
	private String permanentAddress;
	private String communicationAddress;
	@NotEmpty
	private String phone;
	@NotEmpty
	private String mobile;
	private String email;
	@NotEmpty
	private String school;
	@NotEmpty
	@Source(value="joinDate", merger=DateFormatMerger.class, mergerParam="dd/MMM/yyyy")
	private String joinDate;
	@NotEmpty
	private String fatherName;
	private String fatherOccupation;
	@NotEmpty
	private String fatherMobile;
	private Float feesDeposited;
	private Float feesDue;
	@NotEmpty
	private String username;
	@NotEmpty
	private List<Integer> courses;
	private List<Integer> subjects;
	private List<Integer> batchTimings;
	
	private MultipartFile picture;

	public RegistrationDTO() {
	}

	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFatherName() {
		return this.fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getFatherOccupation() {
		return this.fatherOccupation;
	}

	public void setFatherOccupation(String fatherOccupation) {
		this.fatherOccupation = fatherOccupation;
	}

	public String getFatherMobile() {
		return this.fatherMobile;
	}

	public void setFatherMobile(String fatherMobile) {
		this.fatherMobile = fatherMobile;
	}
	
	public String getPermanentAddress() {
		return this.permanentAddress;
	}

	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public String getCommunicationAddress() {
		return this.communicationAddress;
	}

	public void setCommunicationAddress(String communicationAddress) {
		this.communicationAddress = communicationAddress;
	}
	
	public String getDob() {
		return this.dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "mobile", length = 20)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoinDate() {
		return this.joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}
	
	public Float getFeesDeposited() {
		return feesDeposited;
	}

	public void setFeesDeposited(Float feesDeposited) {
		this.feesDeposited = feesDeposited;
	}

	public Float getFeesDue() {
		return feesDue;
	}

	public void setFeesDue(Float feesDue) {
		this.feesDue = feesDue;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public List<Integer> getCourses() {
		return courses;
	}

	public void setCourses(List<Integer> courses) {
		this.courses = courses;
	}

	public List<Integer> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Integer> subjects) {
		this.subjects = subjects;
	}

	public List<Integer> getBatchTimings() {
		return batchTimings;
	}

	public void setBatchTimings(List<Integer> batchTimings) {
		this.batchTimings = batchTimings;
	}

	public MultipartFile getPicture() {
		return picture;
	}

	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "RegistrationDTO [studentId=" + studentId + ", firstName=" + firstName + ", lastName=" + lastName + ", dob=" + dob + ", gender="
				+ gender + ", permanentAddress=" + permanentAddress + ", communicationAddress=" + communicationAddress + ", phone=" + phone
				+ ", mobile=" + mobile + ", email=" + email + ", school=" + school + ", joinDate=" + joinDate + ", fatherName=" + fatherName
				+ ", fatherOccupation=" + fatherOccupation + ", fatherMobile=" + fatherMobile + ", feesDeposited=" + feesDeposited + ", feesDue="
				+ feesDue + ", username=" + username + ", courses=" + courses + ", subjects=" + subjects + ", batchTimings=" + batchTimings + "]";
	}
	
}
