package controllers;

import entities.Category;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.beanCategory;

public class categoryController implements IController {

    beanCategory bc = new beanCategory();

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String url = "/WEB-INF/admin/categoryList.jsp";

        Category c = new Category();

        if ("edit".equals(request.getParameter("task"))) {
            url = "/WEB-INF/admin/categoryEdit.jsp";
            if (request.getParameter("id") != null) {
                c = bc.findById(Long.valueOf(request.getParameter("id")));
                session.setAttribute("category", c);
            }
        }
        if (request.getParameter("confirm") != null) {
            if (session.getAttribute("category") == null) {
                c.setName(request.getParameter("nameCategory"));
                c.setActive(true);
                bc.create(c);
            } else {
                c = (Category) session.getAttribute("category");
                c.setName(request.getParameter("nameCategory"));
                bc.update(c);
                session.removeAttribute("category");
            }
        }

        if ("delete".equals(request.getParameter("task"))) {
            c = bc.findById(Long.valueOf(request.getParameter("id")));
            bc.delete(c);
            url = "/WEB-INF/admin/categoryList.jsp";
        }

        request.setAttribute("categories", bc.findAll());
        return url;
    }

    @Override
    public String execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

}