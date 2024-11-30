<%--
  Created by IntelliJ IDEA.
  User: 1jam2
  Date: 2024-11-29
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2>Add a New Friend</h2>
            <p class="lead">Please enter your new friend's details.</p>
        </div>
        <div class="d-flex justify-content-center">
            <form action="addok" method="post" class="needs-validation" novalidate>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                        <div class="invalid-feedback">Please enter name.</div>
                    </div>

                    <div class="col-md-5">
                        <label for="relationship" class="form-label">Relationship</label>
                        <select class="form-select" id="relationship" name="relationship" required>
                            <option value="">Choose...</option>
                            <option value="Family">Family</option>
                            <option value="Classmate">Classmate</option>
                            <option value="Friend">Friend</option>
                            <option value="Neighbor">Neighbor</option>
                            <option value="etc">Other</option>
                        </select>
                        <div class="invalid-feedback">Please select a valid relationship.</div>
                    </div>

                    <div class="col-sm-6">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="000-0000-0000" required>
                        <div class="invalid-feedback">Please enter a valid phone number.</div>
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label">Email <span class="text-body-secondary">(Optional)</span></label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com">
                    </div>

                    <div class="col-12">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="1234 Main St" required>
                        <div class="invalid-feedback">Please enter the address.</div>
                    </div>

                    <div class="col-sm-6">
                        <label for="birthday" class="form-label">Birthday</label>
                        <input type="text" class="form-control" id="birthday" name="birthday" placeholder="yyyy.mm.dd" required>
                        <div class="invalid-feedback">Please enter a valid birthdate.</div>
                    </div>
                </div>

                <hr class="my-4">

                <button class="w-100 btn btn-primary btn-lg" type="submit">Add</button>
                <button class="w-100 btn btn-primary btn-lg" type="button" onclick="location.href='list'">List</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>
