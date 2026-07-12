package com.duskdev.skillhub.servlet;

import com.duskdev.skillhub.model.Student;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class StudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext context = getServletContext();

        List<Student> students = (List<Student>) context.getAttribute("students");

        request.setAttribute("students", students);

        request.getRequestDispatcher("/students.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String course = request.getParameter("course");

        if (fullName == null || fullName.isBlank()) {
            request.setAttribute(
                    "error",
                    "Name fields are required."
            );

            doGet(request, response);
            return;
        } else if (email == null || email.isBlank()) {
            request.setAttribute(
                    "error",
                    "Email fields are required."
            );

            doGet(request, response);
            return;
        } else if (mobile == null || mobile.isBlank()) {
            request.setAttribute(
                    "error",
                    "Mobile fields are required."
            );

            doGet(request, response);
            return;
        } else if (course == null || course.isBlank()) {
            request.setAttribute(
                    "error",
                    "Course Name fields are required."
            );

            doGet(request, response);
            return;
        }

        ServletContext context = getServletContext();

        List<Student> students = (List<Student>) context.getAttribute("students");

        if (students.stream().anyMatch(student -> student.getEmail().equalsIgnoreCase(email.trim()))) {
            request.setAttribute(
                    "error",
                    "A student with this email already exists."
            );

            doGet(request, response);
            return;
        }

        int nextId = students.stream().mapToInt(Student::getId).max().orElse(0) + 1;

        Student student = new Student(
                nextId,
                fullName,
                email,
                mobile,
                course
        );

        students.add(student);

        response.sendRedirect(request.getContextPath() + "/portal/students");
    }
}
