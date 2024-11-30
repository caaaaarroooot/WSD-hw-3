<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.springcrudservice.PersonDAO" %>
<%@ page import="com.example.springcrudservice.PersonVO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 1jam2
  Date: 2024-11-29
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="./inc/top.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./inc/my.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="list py-3 mb-4 border-bottom justify-content-center">
    <div class="d-flex justify-content-between align-items-center mb-3 mb-lg-0 me-lg-auto text-decoration-none">
        <div class="fs-4">Friend List</div>
        <div>
            <button type="button" class="btn btn-primary" onclick="location.href='write'">Add</button>
        </div>
    </div>
</div>
<div class="container">
    <div class="search-container">
        <input type="text" class="search-input" id="searchInput" placeholder="Search by name">
        <button type="button" class="btn btn-secondary" onclick="searchFriend()">Search</button>
    </div>

    <div class="table-responsive small">
        <table class="table table-striped table-sm" id="friendTable">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Relationship</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Birthday</th>
                <th scope="col">Menu</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
                <tr onclick="location.href='./view/${u.id}'" style="cursor:pointer;">
                    <td>${u.name}</td>
                    <td>${u.relationship}</td>
                    <td>${u.phone}</td>
                    <td>${u.email}</td>
                    <td>${u.address}</td>
                    <td>${u.birthday}</td>
                    <td>
                        <a href="edit/${u.id}">
                            <img src="https://cdn-icons-png.flaticon.com/512/4226/4226577.png" alt="pencil" width="15"
                                 height="15" style="cursor:pointer;">
                        </a>
                        <a href="javascript:delete_ok('${u.id}')">
                            <img src="https://cdn-icons-png.flaticon.com/512/1214/1214428.png" alt="trash" width="15"
                                 height="15" style="cursor:pointer;">
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    function delete_ok(id) {
        var a = confirm("정말로 삭제하시겠습니끼?");
        if (a) location.href = 'deleteok/' + id;
    }

    function searchFriend() {
        const input = document.getElementById('searchInput').value.toLowerCase();
        const table = document.getElementById('friendTable');
        const rows = table.getElementsByTagName('tr');

        for (let i = 1; i < rows.length; i++) {
            const nameCell = rows[i].getElementsByTagName('td')[0];
            if (nameCell) {
                const name = nameCell.textContent || nameCell.innerText;
                rows[i].style.display = name.toLowerCase().includes(input) ? '' : 'none';
            }
        }
    }
</script>
</body>
</html>
<%@ include file="./inc/bottom.jsp" %>