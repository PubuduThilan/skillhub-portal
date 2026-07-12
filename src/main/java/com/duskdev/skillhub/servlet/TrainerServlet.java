package com.duskdev.skillhub.servlet;

import com.duskdev.skillhub.model.Trainer;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class TrainerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext context = getServletContext();

        List<Trainer> trainers = (List<Trainer>) context.getAttribute("trainers");

        request.setAttribute("trainers", trainers);

        request.getRequestDispatcher("/trainers.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String specialization = request.getParameter("specialization");

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
        } else if (specialization == null || specialization.isBlank()) {
            request.setAttribute(
                    "error",
                    "Specialization fields are required."
            );

            doGet(request, response);
            return;
        }

        ServletContext context = getServletContext();

        List<Trainer> trainers = (List<Trainer>) context.getAttribute("trainers");

        if (trainers.stream().anyMatch(trainer -> trainer.getEmail().equalsIgnoreCase(email.trim()))){
            request.setAttribute(
                    "error",
                    "A trainer with email already exists."
            );

            doGet(request,response);
            return;
        }

        int nextInt = trainers.stream().mapToInt(Trainer::getId).max().orElse(0) + 1;

        Trainer trainer = new Trainer(
                nextInt,
                fullName,
                email,
                mobile,
                specialization
        );

        trainers.add(trainer);

        response.sendRedirect(request.getContextPath()+"/portal/trainers");

    }
}
