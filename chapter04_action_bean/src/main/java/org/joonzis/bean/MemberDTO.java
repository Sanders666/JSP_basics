package org.joonzis.bean;

// 자바 빈으로 사용
public class MemberDTO {
	// 필드, 생성자, setter/getter
	private String id;
	private String pw;
	private String name;
	private int age;
	private String addr;
	private String gender;
	private String[] hobbies;
	private String[] likeFoods;
	private String[] dislikeFoods;
	
	public MemberDTO() {}
	public MemberDTO(String id, String pw, String name, int age, String addr, String gender, String[] hobbies, String[] likeFoods, String[] dislikeFoods) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.gender = gender;
		this.hobbies = hobbies;
		this.likeFoods = likeFoods;
		this.dislikeFoods = dislikeFoods;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getHobbies() {
		return hobbies;
	}
	public void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
	}
	public String[] getLikeFoods() {
		return likeFoods;
	}
	public void setLikeFoods(String[] likeFoods) {
		this.likeFoods = likeFoods;
	}
	public String[] getDislikeFoods() {
		return dislikeFoods;
	}
	public void setDislikeFoods(String[] dislikeFoods) {
		this.dislikeFoods = dislikeFoods;
	}
	
}