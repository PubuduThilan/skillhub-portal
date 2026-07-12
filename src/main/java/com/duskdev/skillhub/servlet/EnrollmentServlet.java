package com.duskdev.skillhub.servlet;

import com.duskdev.skillhub.model.Course;
import com.duskdev.skillhub.model.Enrollment;
import com.duskdev.skillhub.model.Student;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class EnrollmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext context = getServletContext();

        List<Student> students = (List<Student>) context.getAttribute("students");

        List<Course> courses = (List<Course>) context.getAttribute("courses");

        List<Enrollment> enrollments = (List<Enrollment>) context.getAttribute("enrollments");

        request.setAttribute("students", students);
        request.setAttribute("courses", courses);
        request.setAttribute("enrollments", enrollments);

        request.getRequestDispatcher("/enrollments.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String studentIdText = request.getParameter("studentId");
        String courseIdText = request.getParameter("courseId");

        if (studentIdText == null || studentIdText.isBlank()) {
            request.setAttribute(
                    "error",
                    "Student must be selected."
            );

            doGet(request, response);
            return;
        } else if (courseIdText == null || courseIdText.isBlank()) {
            request.setAttribute(
                    "error",
                    "Course must be selected."
            );

            doGet(request, response);
            return;
        }

        int studentId;
        int courseId;

        try {
            studentId = Integer.parseInt(studentIdText);
            courseId = Integer.parseInt(courseIdText);
        } catch (NumberFormatException e) {
            request.setAttribute(
                    "error",
                    "Invalid student or course selection."
            );

            doGet(request, response);
            return;
        }

        ServletContext context = getServletContext();

        List<Student> students = (List<Student>) context.getAttribute("students");

        List<Course> courses = (List<Course>) context.getAttribute("courses");

        List<Enrollment> enrollments = (List<Enrollment>) context.getAttribute("enrollments");

        Student selectedStudent = students.stream().filter(student -> student.getId() == studentId).findFirst().orElse(null);

        Course selectedCourse = courses.stream().filter(course -> course.getId() == courseId).findFirst().orElse(null);

        if (selectedStudent == null) {
            request.setAttribute(
                    "error",
                    "Selected student was not found"
            );

            doGet(request, response);
            return;
        } else if (selectedCourse == null) {
            request.setAttribute(
                    "error",
                    "Selected course was not found"
            );

            doGet(request, response);
            return;
        }

        if (enrollments.stream().anyMatch(enrollment -> enrollment.getStudentId() == studentId && enrollment.getCourseId() == courseId)) {
            request.setAttribute(
                    "error",
                    "This student is already enrolled in the selected course."
            );

            doGet(request, response);
            return;
        }

        int nextId = enrollments.stream().mapToInt(Enrollment::getId).max().orElse(0) + 1;

        Enrollment enrollment = new Enrollment(
                nextId,
                selectedStudent.getId(),
                selectedStudent.getFullName(),
                selectedCourse.getId(),
                selectedCourse.getName(),
                LocalDate.now(),
                "ACTIVE"
        );

        enrollments.add(enrollment);

        response.sendRedirect(request.getContextPath() + "/portal/enrollments");
    }
}
