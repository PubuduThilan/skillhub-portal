package com.duskdev.skillhub.listener;

import com.duskdev.skillhub.model.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        ServletContext context = sce.getServletContext();

        List<User> users = Collections.synchronizedList(new ArrayList<>());

        users.add(new User(
                "System Administrator",
                "admin@skillhub.com",
                "admin",
                "ADMIN"
                ));

        users.add(new User(
                "Demo Student",
                "student@skillhub.com",
                "student",
                "STUDENT"
        ));

        context.setAttribute("users", users);

        context.setAttribute(
                "courses",
                Collections.synchronizedList(new ArrayList<>())
        );

        context.setAttribute(
                "student",
                Collections.synchronizedList(new ArrayList<>())
        );

        context.setAttribute(
                "trainers",
                Collections.synchronizedList(new ArrayList<>())
        );

        context.setAttribute(
                "enrollments",
                Collections.synchronizedList(new ArrayList<>())
        );

        context.setAttribute(
                "attendanceRecords",
                Collections.synchronizedList(new ArrayList<>())
        );

        context.setAttribute(
                "applicationStartTime",
                LocalDateTime.now()
        );

        context.log("SkillHub portal started successfully.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().log("SkillHub portal stopped.");
    }
}
