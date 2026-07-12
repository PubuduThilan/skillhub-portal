package com.duskdev.skillhub.model;

import java.io.Serializable;

public class Course implements Serializable {

    private int id;
    private String name;
    private String category;
    private String duration;
    private String trainerName;

    public Course(int id, String name, String category, String duration, String trainerName) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.duration = duration;
        this.trainerName = trainerName;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getDuration() {
        return duration;
    }

    public String getTrainerName() {
        return trainerName;
    }
}
