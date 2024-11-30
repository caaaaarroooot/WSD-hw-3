package com.example.springcrudservice;

public class PlayerVO {
    private String name;
    private String birthyear;
    private String club;
    private String country;
    private String position;
    private String mainfoot;
    private int id;

    public PlayerVO(int id, String name, String birthyear, String club, String country, String position, String mainfoot) {
        this.name = name;
        this.birthyear = birthyear;
        this.club = club;
        this.country = country;
        this.position = position;
        this.mainfoot = mainfoot;
        this.id = id;
    }

    public PlayerVO() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthyear() {
        return birthyear;
    }

    public void setBirthyear(String birthyear) {
        this.birthyear = birthyear;
    }

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getMainfoot() {
        return mainfoot;
    }

    public void setMainfoot(String mainfoot) {
        this.mainfoot = mainfoot;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}