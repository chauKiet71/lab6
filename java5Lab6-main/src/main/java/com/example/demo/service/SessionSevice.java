package com.example.demo.service;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SessionSevice {
    @Autowired
    HttpSession session;

    //read attribute in session
    public <T> T get(String name) {
        return (T) session.getAttribute(name);
    }

    //change or create attribute in session
    public <T> void set(String name, Object value) {
        session.setAttribute(name, value);
    }

    //remove attribute in session
    public void remove(String name) {
        session.removeAttribute(name);
    }
}
