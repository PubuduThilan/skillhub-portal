package com.duskdev.skillhub.model;

import java.io.Serializable;
import java.time.LocalDate;

public class Enrollment implements Serializable {

    private int id;
    private int studentId;
    private String studentName;
    private int courseId;
    private String courseName;
    private LocalDate enrollmentDate;
    private String status;

    public Enrollment(int id, int studentId, String studentName, int courseId, String courseName, LocalDate enrollmentDate, String status) {

        this.id = id;
        this.studentId = studentId;
        this.studentName = studentName;
        this.courseId = courseId;
        this.courseName = courseName;
        this.enrollmentDate = enrollmentDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public int getStudentId() {
        return studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public int getCourseId() {
        return courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public LocalDate getEnrollmentDate() {
        return enrollmentDate;
    }

    public String getStatus() {
        return status;
    }
}
