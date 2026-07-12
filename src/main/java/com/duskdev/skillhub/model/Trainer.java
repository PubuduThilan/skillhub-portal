package com.duskdev.skillhub.model;

import java.io.Serializable;

public class Trainer implements Serializable {

    private int id;
    private String fullName;
    private String email;
    private String mobile;
    private String specialization;

    public Trainer(int id, String fullName, String email, String mobile, String specialization) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.mobile = mobile;
        this.specialization = specialization;
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

    public String getSpecialization() {
        return specialization;
    }
}
