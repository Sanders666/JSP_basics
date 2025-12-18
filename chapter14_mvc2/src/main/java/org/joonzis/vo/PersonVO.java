package org.joonzis.vo;

public class PersonVO {
	private String name, age, phone, addr, self;
	
	public PersonVO() {}
	public PersonVO(String name, String age, String phone, String addr, String self) {
		super();
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.addr = addr;
		this.self = self;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
	}
	
}
