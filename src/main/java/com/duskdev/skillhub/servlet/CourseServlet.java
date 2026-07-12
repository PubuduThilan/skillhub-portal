package com.duskdev.skillhub.servlet;

import com.duskdev.skillhub.model.Course;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class CourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext context = getServletContext();

        List<Course> courses = (List<Course>) context.getAttribute("courses");

        request.setAttribute("courses", courses);

        request.getRequestDispatcher("/courses.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String duration = request.getParameter("duration");
        String trainerName = request.getParameter("trainerName");

        if (name == null || name.isBlank()) {
            request.setAttribute(
                    "error",
                    "Name fields are required."
            );

            doGet(request, response);
            return;
        } else if (category == null || category.isBlank()) {
            request.setAttribute(
                    "error",
                    "Category fields are required."
            );

            doGet(request, response);
            return;
        } else if (duration == null || duration.isBlank()) {
            request.setAttribute(
                    "error",
                    "Duration fields are required."
            );

            doGet(request, response);
            return;
        } else if (trainerName == null || trainerName.isBlank()) {
            request.setAttribute(
                    "error",
                    "Trainer Name fields are required."
            );

            doGet(request, response);
            return;
        }

        ServletContext context = getServletContext();

        List<Course> courses = (List<Course>) context.getAttribute("courses");

        int nextId = courses.size() + 1;

        Course course = new Course(
                nextId,
                name,
                category,
                duration,
                trainerName
        );
        courses.add(course);

        response.sendRedirect(request.getContextPath() + "/portal/courses");
    }
}
