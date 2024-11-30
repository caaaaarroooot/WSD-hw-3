<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="top.jsp" %>
</style>
</head>
<body>
<div class="mother-div">
    <div>
        <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
            <!-- SVG Symbols here -->
        </svg>
        <div class="container d-flex f-direction-row justify-content-between">
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}" class="nav-link active" aria-current="page">Home</a>
                </li>
                <li class="nav-item">
                    <a href="write" class="nav-link">Add</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0 d-flex f-direction-row" method="get" action="list">
                <input class="form-control mr-sm-2" type="search" name="position" placeholder="Search by Position" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <h2>Section title</h2>
        <div class="table-responsive small">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">국적</th>
                    <th scope="col">나이</th>
                    <th scope="col">이름</th>
                    <th scope="col">소속팀</th>
                    <th scope="col">포지션</th>
                    <th scope="col">주발</th>
                    <th scope="col">액션</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="u">
                        <tr>
                            <td>${u.id}</td>
                            <td>${u.country}</td>
                            <td>${u.birthyear}</td>
                            <td>${u.name}</td>
                            <td>${u.club}</td>
                            <td>${u.position}</td>
                            <td>${u.mainfoot}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view?id=${u.id}" class="btn btn-primary btn-sm">view</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp" %>
