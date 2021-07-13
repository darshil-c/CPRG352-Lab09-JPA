<%-- 
    Document   : users
    Created on : 1-Jul-2021, 9:48:47 AM
    Author     : Chaudhari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <c:if test="${selectedUser == null}">
            <div>
                <h1>Add User</h1>
                <form method="POST" action="">
                    <input type="text" name="email" placeholder="E-Mail" value="">
                    <br>
                    <input type="text" name="firstname" placeholder="First Name" value="">
                    <br>
                    <input type="text" name="lastname" placeholder="Last Name" value="">
                    <br>
                    <input type="password" name="password" placeholder="Password" value="">
                    <br>
                    <select name="role">
                        <option value="1">System Admin</option>
                        <option value="2">Regular User</option>
                        <option value="3">Company Admin</option>
                    </select>
                    <br>
                    <input type="submit" value="Add User">
                    <input type="hidden" name="addUser">
                </form>
            </div>
        </c:if>
        <div>
            <h1>Manage Users</h1>
            <form method="POST" action="">
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>
                            ${user.firstName}
                        </td>
                        <td>
                            ${user.lastName}
                        </td>
                        <td>
                            <input type="submit" value="Edit">
                            <input type="hidden" name="editUser" value="${user.email}">
                        </td>
                        <td>
                            <input type="submit" value="Delete">
                            <input type="hidden" name="deleteUser" value="${user.email}">
                        </td>
                    </tr>
                </c:forEach>
            </table>
            </form>
        </div>
        <div>
            <h1>Edit User</h1>
        </div>
    </body>
</html>
