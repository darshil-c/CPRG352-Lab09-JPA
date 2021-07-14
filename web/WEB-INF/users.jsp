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
        <link type="text/css" rel="stylesheet" href="./assets/styles/style.css">
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
                    <input type="checkbox" name="status" id="status" value="true">
                    <label for="status">Active</label>
                    <br>
                    <input type="submit" value="Add User">
                    <input type="hidden" name="addUser">
                </form>
            </div>
        </c:if>
        <div>
            <h1>Manage Users</h1>
        </div>
        <div>
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
                    <form method="POST" action="">
                        <td>
                            <input type="submit" value="Edit">
                            <input type="hidden" name="editUser" value="${user.email}">
                        </td>
                    </form>
                    <form method="POST" action="">
                        <td>
                            <input type="submit" value="Delete">
                            <input type="hidden" name="deleteUser" value="${user.email}">
                        </td>
                    </form>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div>
            <h1>Edit User</h1>
            <form method="POST" action="">
                <input type="text" name="editemail" value="${editemail}" placeholder="Email" readonly="">
                <br>
                <input type="text" name="editfirstname" placeholder="First Name" value="${editfirstname}">
                <br>
                <input type="text" name="editlastname" placeholder="Last Name" value="${editlastname}">
                <br>
                <input type="password" name="editpassword" placeholder="Password" value="${editpassword}">
                <br>
                <select name="editrole">
                    <option value="1" <c:if test="${role == 1}">selected</c:if>>System Admin</option>
                    <option value="2" <c:if test="${role == 2}">selected</c:if>>Regular User</option>
                    <option value="3" <c:if test="${role == 3}">selected</c:if>>Company Admin</option>
                    </select>
                    <br>
                    <input type="checkbox" name="editstatus" id="editstatus" <c:if test="${editstatus == true}">checked</c:if> value="true">
                    <label for="editstatus">Active</label>
                    <br>
                    <input type="submit" value="Edit User">
                    <input type="hidden" name="editUserB">
                    <input type="submit" value="Cancel">
                    <input type="hidden" name="cancelB">
                </form>
            </div>
            <div>${message}</div>
    </body>
</html>
