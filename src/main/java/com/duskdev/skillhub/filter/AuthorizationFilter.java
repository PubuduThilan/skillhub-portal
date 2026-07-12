package com.duskdev.skillhub.filter;

import com.duskdev.skillhub.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthorizationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

        HttpSession session = httpRequest.getSession(false);

        if (session == null || session.getAttribute("user") == null){
            httpResponse.sendRedirect(httpRequest.getContextPath()+"/login");
            return;
        }

        User user =(User) session.getAttribute("user");

        if (!"ADMIN".equals(user.getRole())){
            httpResponse.sendRedirect(httpRequest.getContextPath()+"/portal/access-denied");

            return;
        }

        filterChain.doFilter(servletRequest,servletResponse);
    }
}
