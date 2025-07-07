<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f6f8;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 50px;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            flex-direction: column;
            gap: 20px;
        }

        .btn-link {
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h1>Student Management System</h1>

    <div class="container">
        <a href="/student-details/Student-db-details" class="btn-link">View Student Details</a>
        <a href="/student-details/getdetails" class="btn-link">Student Details Entry</a>
        <a href="/login" class="btn-link">Logout</a>
    </div>

</body>
</html>
