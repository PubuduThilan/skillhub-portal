package com.duskdev.skillhub.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        filterConfig.getServletContext().log("AuthenticationFilter initialized.");
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }


    @Override
    @SuppressWarnings("DuplicatedCode")
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;

        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

        HttpSession httpSession = httpServletRequest.getSession(false);

        if (httpSession == null || httpSession.getAttribute("user") == null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login");
            return;
        }

        filterChain.doFilter(servletRequest,servletResponse);
    }
}
