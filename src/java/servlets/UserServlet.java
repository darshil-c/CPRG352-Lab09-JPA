/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import services.RoleService;
import services.UserService;

/**
 *
 * @author Chaudhari
 */
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService us = new UserService();
        RoleService rs = new RoleService();
        try {
            List<User> users = us.getAll();
            request.setAttribute("users", users);
        } catch (Exception ex) {
            request.setAttribute("message", "An error has occcured.");
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService us = new UserService();

        String addUserButton = request.getParameter("addUser");
        String editUser = request.getParameter("editUser");
        String deleteUserButton = request.getParameter("deleteUser");
        String editUserButton = request.getParameter("editUserB");
        String cancelButton = request.getParameter("cancelB");

        if (addUserButton != null) {
            String email = (String) request.getParameter("email");
            String firstName = (String) request.getParameter("firstname");
            String lastName = (String) request.getParameter("lastname");
            String password = (String) request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));
            boolean active = Boolean.parseBoolean(request.getParameter("status"));
            try {
                us.insert(email, active, firstName, lastName, password, role);
            } catch (Exception ex) {
                request.setAttribute("message", "An error has occured.");
            }
        } else if (editUser != null) {
            String email = editUser;
            boolean isActive;
            try {
                User user = us.get(email);
                request.setAttribute("editemail", user.getEmail());
                request.setAttribute("editfirstname", user.getFirstName());
                request.setAttribute("editlastname", user.getLastName());
                request.setAttribute("editpassword", user.getPassword());
                request.setAttribute("role", user.getRoleId());
                if (user.isActive()) {
                    isActive = true;
                } else {
                    isActive = false;
                }
                request.setAttribute("editstatus", isActive);
            } catch (Exception ex) {
                request.setAttribute("message", "An error has occcured.");
            }
        } else if (deleteUserButton != null) {
            String email = deleteUserButton;
            try {
                us.delete(email);
            } catch (Exception ex) {
                request.setAttribute("message", "An error has occcured.");
            }
        } else if (editUserButton != null) {
            String email = (String) request.getParameter("editemail");
            String firstName = (String) request.getParameter("editfirstname");
            String lastName = (String) request.getParameter("editlastname");
            String password = (String) request.getParameter("editpassword");
            int role = Integer.parseInt(request.getParameter("editrole"));
            boolean active = Boolean.parseBoolean(request.getParameter("editstatus"));
            try {
                us.update(email, active, firstName, lastName, password, role);
            } catch (Exception ex) {
                request.setAttribute("message", "An error has occured.");
            }
        } else if (cancelButton != null) {
            try {
                List<User> users = us.getAll();
                request.setAttribute("users", users);
            } catch (Exception ex) {
                request.setAttribute("message", "An error has occcured.");
            }

            getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        }

        try {
            List<User> users = us.getAll();
            request.setAttribute("users", users);
        } catch (Exception ex) {
            request.setAttribute("message", "An error has occcured.");
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

}
