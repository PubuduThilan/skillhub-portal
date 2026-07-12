package com.duskdev.skillhub.model;

import java.io.Serializable;

public class Student implements Serializable {

    private int id;
    private String fullName;
    private String email;
    private String mobile;
    private String course;

    public Student(int id, String fullName, String email, String mobile, String course) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.mobile = mobile;
        this.course = course;
    }

    public int getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getMobile() {
        return mobile;
    }

    public String getCourse() {
        return course;
    }
}
