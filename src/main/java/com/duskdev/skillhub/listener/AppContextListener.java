package com.duskdev.skillhub.listener;

import com.duskdev.skillhub.model.*;
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

        List<Course> courses = Collections.synchronizedList(new ArrayList<>());

        courses.add(new Course(
                1,
                "Java Web Development",
                "Technology",
                "2 Months",
                "Tharaka Sankalpa"
        ));

        courses.add(new Course(
                2,
                "Business Management",
                "Business",
                "1 Months",
                "Chathurika Sirivardana"
        ));

        context.setAttribute("courses", courses);

        List<Student> students = Collections.synchronizedList(new ArrayList<>());

        students.add(new Student(
                1,
                "Pubudu Thilan",
                "pubudu@gmail.com",
                "0778886665",
                "Java Web Deveopment"
        ));

        students.add(new Student(
                2,
                "Amal perera",
                "amal@gmail.com",
                "0788885556",
                "Business Management"
        ));

        context.setAttribute("students",students);

        List<Trainer> trainers = Collections.synchronizedList(new ArrayList<>());

        trainers.add(new Trainer(
                1,
                "Tharka Sankalpa",
                "tharaka@gmail.com",
                "0771112233",
                "Java Web Development"

        ));

        trainers.add(new Trainer(
                2,
                "Chathurika Sirivardana",
                "chaturanga@gmail.com",
                "0714455667",
                "Business Management"
        ));

        context.setAttribute("trainers", trainers);

        List<Enrollment> enrollments = Collections.synchronizedList(new ArrayList<>());

        context.setAttribute("enrollments", enrollments);

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
