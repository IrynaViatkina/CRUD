<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Users</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div>
    <div class="panel panel-success">
        <div>
            <h3 class="panel-title">
                <div align="middle"><b>Users</b> </div>
            </h3>
        </div>
        <div class="panel-body">

            <c:if test="${empty model.userList}">
                List is empty
            </c:if>

            <c:if test="${not empty model.userList}">
                <table class="table table-hover table-bordered">
                    <thead style="background-color: lightgoldenrodyellow;">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>IsAdmin</th>
                        <th>Created date</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${model.userList}" var="emp">
                        <tr>
                        	<th><c:out value="${emp.id}"/></th>
                        	<th><c:out value="${emp.name}"/></th>
                        	<th><c:out value="${emp.age}"/></th>
                        	<th><c:out value="${emp.admin}"/></th>
                            <th><c:out value="${emp.createdDate}"/></th>
                        	<th><a href="editUser?id=<c:out value='${emp.id}'/>">Edit</a></th>
                        	<th><a href="deleteUser?id=<c:out value='${emp.id}'/>">Delete</a></th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <form action="searchUser">
                    <div class="row">
                        <div >Search by name <input type='text' name='searchName' id='searchName'/> </div>
                        <div ><input type='submit' value='Search'/></div>
                    </div>
                </form>

                <h4>
                    <div align="left"><a href="createUser">Add user</a></div>
                </h4>

                <ul class = "pager">
                <c:if test="${model.currentPage != 0}">
                    <li><a href="getUsersByPage?page=${model.currentPage - 1}">Previous</a></li>
                </c:if>
                    <c:forEach begin="0" end="${model.noPages}" var = "i">
                        <c:if test="${model.noPages != 0}">
                            <c:choose>
                            <c:when test="${model.currentPage eq i}">
                                <li><b>${i+1}</b></li>
                            </c:when>
                            <c:otherwise>
                         <li><a href="getUsersByPage?page=${i}">${i+1}</a></li>
                            </c:otherwise>
                            </c:choose>
                        </c:if>
                     </c:forEach>
                <c:if test="${model.currentPage lt model.noPages}">
                    <li><a href="getUsersByPage?page=${model.currentPage + 1}">Next</a></li>
                </c:if>
            </ul>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>