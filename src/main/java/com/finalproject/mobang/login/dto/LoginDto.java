package com.finalproject.mobang.login.dto;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
	
@Component
public class LoginDto {
	
	private String seq;

	@SuppressWarnings("deprecation")
	@NotNull @Email(message = "이메일 형식이 아닙니다.")
	private String email;	//user email
	
	@NotNull @Pattern(regexp="^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$", message = "영문 숫자 조합으로 6자리 이상 20자리 이하로 비밀번호를 만들어주세요.")
	private String pwd;								//user pwd

	@NotNull @Pattern(regexp = "^[가-힣]{2,6}$", message = "이름은 한글 2~6자리로 입력해주세요.")
	private String name;							//user name
	
	@NotNull @Pattern(regexp = "^(01[1|6|7|8|9|0])-(\\d{3,4})-(\\d{4})$", message = "폰 번호 형식이 아닙니다.")
	private String phone;
	
	private String authority;
	private String userfile;
	private String confirm;
	private String clean;
	private String lifestyle;
	private String shower;
	private String favorateage;
	private String gender;
	private String animal;
	private String needs;
	private String enabled;
	private String roommate;
	
	public LoginDto() {
		super();
	}
	
	public LoginDto(String seq, String email, String pwd, String name, String phone, String authority, String userfile,
			String confirm, String clean, String lifestyle, String shower, String favorateage, String gender,
			String animal, String needs, String enabled, String roommate) {
		super();
		this.seq = seq;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.authority = authority;
		this.userfile = userfile;
		this.confirm = confirm;
		this.clean = clean;
		this.lifestyle = lifestyle;
		this.shower = shower;
		this.favorateage = favorateage;
		this.gender = gender;
		this.animal = animal;
		this.needs = needs;
		this.enabled = enabled;
		this.roommate = roommate;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}


	public String getUserfile() {
		return userfile;
	}


	public void setUserfile(String userfile) {
		this.userfile = userfile;
	}


	public String getConfirm() {
		return confirm;
	}


	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}


	public String getClean() {
		return clean;
	}


	public void setClean(String clean) {
		this.clean = clean;
	}


	public String getLifestyle() {
		return lifestyle;
	}


	public void setLifestyle(String lifestyle) {
		this.lifestyle = lifestyle;
	}


	public String getShower() {
		return shower;
	}


	public void setShower(String shower) {
		this.shower = shower;
	}


	public String getFavorateage() {
		return favorateage;
	}


	public void setFavorateage(String favorateage) {
		this.favorateage = favorateage;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAnimal() {
		return animal;
	}


	public void setAnimal(String animal) {
		this.animal = animal;
	}


	public String getNeeds() {
		return needs;
	}


	public void setNeeds(String needs) {
		this.needs = needs;
	}


	public String getEnabled() {
		return enabled;
	}


	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getRoommate() {
		return roommate;
	}

	public void setRoommate(String roommate) {
		this.roommate = roommate;
	}
	
	
}