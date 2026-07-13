package com.duskdev.skillhub.servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();
        request.setAttribute(
                "courseCount",
                getListSize(context.getAttribute("courses"))
        );

        request.setAttribute(
                "studentCount",
                getListSize(context.getAttribute("students"))
        );

        request.setAttribute(
                "trainerCount",
                getListSize(context.getAttribute("trainers"))
        );

        request.setAttribute(
                "enrollmentCount",
                getListSize(context.getAttribute("enrollments"))
        );

        request.setAttribute(
                "attendanceCount",
                getListSize(context.getAttribute("attendances"))
        );

        request.setAttribute(
                "applicationStartTime",
                context.getAttribute("applicationStartTime")
        );

        request.getRequestDispatcher(
                "/WEB-INF/view/dashboard.jsp"
        ).forward(request,response);
    }

    private int getListSize(Object attribute) {
        if (attribute instanceof List<?>) {
            return ((List<?>) attribute).size();
        }
        return 0;
    }
}
