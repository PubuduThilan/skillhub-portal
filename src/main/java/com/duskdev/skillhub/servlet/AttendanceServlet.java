package com.duskdev.skillhub.servlet;

import com.duskdev.skillhub.model.Attendance;
import com.duskdev.skillhub.model.Enrollment;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();

        List<Enrollment> enrollments = (List<Enrollment>) context.getAttribute("enrollments");

        List<Attendance> attendances = (List<Attendance>) context.getAttribute("attendances");

        request.setAttribute("enrollments", enrollments);
        request.setAttribute("attendances", attendances);

        request.getRequestDispatcher("/WEB-INF/view/attendance.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String enrollmentIdText = request.getParameter("enrollmentId");
        String attendanceDateText = request.getParameter("attendanceDate");
        String status = request.getParameter("status");

        if (enrollmentIdText == null || enrollmentIdText.isBlank()) {
            request.setAttribute(
                    "error",
                    "Enrollment are required."
            );

            doGet(request, response);
            return;
        } else if (attendanceDateText == null || attendanceDateText.isBlank()) {
            request.setAttribute(
                    "error",
                    "Date are required."
            );

            doGet(request, response);
            return;
        } else if (status == null || status.isBlank()) {
            request.setAttribute(
                    "error",
                    "Attendance status are required."
            );

            doGet(request, response);
            return;
        }

        int enrollmentId;
        LocalDate attendanceDate;

        try {
            enrollmentId = Integer.parseInt(enrollmentIdText);

            attendanceDate = LocalDate.parse(attendanceDateText);
        } catch (NumberFormatException e) {
            request.setAttribute(
                    "error",
                    "Invalid enrollment or attendance date."
            );

            doGet(request, response);
            return;
        }

        if (!status.equals("PRESENT") && !status.equals("ABSENT") && !status.equals("LATE")) {

            request.setAttribute(
                    "error",
                    "Invalid attendance status."
            );

            doGet(request, response);
            return;
        }

        ServletContext context = getServletContext();

        List<Enrollment> enrollments = (List<Enrollment>) context.getAttribute("enrollments");

        List<Attendance> attendances = (List<Attendance>) context.getAttribute("attendances");


        Enrollment selectedEnrollment = enrollments.stream().filter(enrollment -> enrollment.getId() == enrollmentId).findFirst().orElse(null);

        if (selectedEnrollment == null){
            request.setAttribute(
                    "error",
                    "Selected enrollment was not found."
            );

            doGet(request, response);
            return;
        }

        boolean duplicateAttendance = attendances.stream().anyMatch(attendance -> attendance.getEnrollmentId() == enrollmentId && attendance.getAttendanceDate().equals(attendanceDate));

        if (duplicateAttendance){
            request.setAttribute(
                    "error",
                    "Attendance has already been marked for this student on the selected date."
            );

            doGet(request, response);
            return;
        }

        int nextId = attendances.stream().mapToInt(Attendance::getId).max().orElse(0)+1;

        Attendance attendance = new Attendance(
                nextId,
                selectedEnrollment.getId(),
                selectedEnrollment.getStudentName(),
                selectedEnrollment.getCourseName(),
                attendanceDate,
                status
        );

        attendances.add(attendance);

        response.sendRedirect(request.getContextPath() + "/portal/attendance");
    }
}
