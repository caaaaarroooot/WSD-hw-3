package com.example.springcrudservice;

public class PersonVO {
    private int id;
    private String name;
    private String relationship;
    private String phone;
    private String email;
    private String address;
    private String birthday;
    private String photo;
    private int cnt;
    private String regdate;

    public PersonVO(String name, String relationship, String phone, String email, String address, String birthday, String photo) {
        this.name = name;
        this.relationship = relationship;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.birthday = birthday;
    }

    public PersonVO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
}

