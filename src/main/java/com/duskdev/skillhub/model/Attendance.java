package com.duskdev.skillhub.model;

import java.io.Serializable;
import java.time.LocalDate;

public class Attendance implements Serializable {

    private int id;
    private int enrollmentId;
    private String studentName;
    private String courseName;
    private LocalDate attendanceDate;
    private String status;

    public Attendance(int id, int enrollmentId, String studentName, String courseName, LocalDate attendanceDate, String status) {
        this.id = id;
        this.enrollmentId = enrollmentId;
        this.studentName = studentName;
        this.courseName = courseName;
        this.attendanceDate = attendanceDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public int getEnrollmentId() {
        return enrollmentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getCourseName() {
        return courseName;
    }

    public LocalDate getAttendanceDate() {
        return attendanceDate;
    }

    public String getStatus() {
        return status;
    }
}
