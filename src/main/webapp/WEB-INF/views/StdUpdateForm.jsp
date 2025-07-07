<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.SBDemoPrg.Entity.StudentDetailsEntity" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 60px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .not-found {
            text-align: center;
            color: #d00;
            font-weight: bold;
            margin-top: 50px;
        }
        
        .back-button {
		    display: inline-block;
		    padding: 10px 20px;
		    background-color: #607D8B;
		    color: white;
		    text-decoration: none;
		    border-radius: 6px;
		    font-size: 14px;
		    font-weight: bold;
		    margin-top: 20px;
		    transition: background-color 0.3s ease, transform 0.2s ease;
		}
		
		.back-button:hover {
		    background-color: #455A64;
		    transform: scale(1.05);
		}
		        
			        
    </style>
</head>
<body>

<%
    StudentDetailsEntity student = (StudentDetailsEntity) request.getAttribute("student");
    if (student != null) {
%>
    <div class="container">
        <h1>Update Student Details</h1>
        <form action="/student-details/update" method="post">
            <input type="hidden" name="id" value="<%= student.getId() %>">

            <label for="name">Name:</label>
            <input type="text" name="name" value="<%= student.getName() %>" required>

            <label for="rollNo">Roll No:</label>
            <input type="text" name="rollNo" value="<%= student.getRollNo() %>" required>

            <label for="dept">Department:</label>
            <input type="text" name="dept" value="<%= student.getDept() %>" required>

            <label for="cgpa">CGPA:</label>
            <input type="text" name="cgpa" value="<%= student.getCgpa() %>" required>

            <label for="attprecent">Attendance %:</label>
            <input type="text" name="attprecent" value="<%= student.getAttprecent() %>" required>

            <input type="submit" value="Update">
            <div style="text-align: center;">
			    <a href="/student-details/Student-db-details" class="back-button">Back</a>
			</div>

        </form>
    </div>
<%
    } else {
%>
    <div class="not-found">
        <p>Student not found.</p>
    </div>
<%
    }
%>

</body>
</html>
