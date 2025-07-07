<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.SBDemoPrg.Entity.StudentDetailsEntity" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fa;
        }

        .navbar {
            background-color: #333;
            padding: 15px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo h2 {
            margin: 0;
            font-size: 22px;
        }

        .nav-items p {
            display: inline-block;
            margin: 0 10px;
        }

        .nav-items button {
            padding: 8px 16px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .nav-items button:hover {
            background-color: #45a049;
        }

        h1 {
            text-align: center;
            margin: 30px 0 10px;
            color: #333;
        }

        .outdiv {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        table {
            width: 90%;
            max-width: 1000px;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
        

        tr:hover {
            background-color: #f2f2f2;
        }

        tr:last-child td {
            border-bottom: none;
        }

        td[colspan="4"] {
            text-align: center;
            padding: 20px;
            color: #888;
        }

        .filters {
            text-align: center;
            margin: 20px;
        }

        .filters form {
            display: inline-block;
            margin: 0 10px;
        }

        .filters input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .filters select {
            padding: 8px;
            border-radius: 5px;
        }

        .filters input[type="submit"] {
            padding: 8px 12px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        .action-buttons {
        display: flex;
        gap: 8px;
        justify-content: center;
    }

    .action-buttons form {
        display: inline;
    }

    .action-buttons input[type="submit"] {
        padding: 6px 12px;
        background-color: #2196F3;
        border: none;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        font-size: 13px;
        transition: background-color 0.3s ease;
    }

    .action-buttons input[type="submit"]:hover {
        background-color: #0b7dda;
    }

    .action-buttons input[value="Delete"] {
        background-color: #f44336;
    }

    .action-buttons input[value="Delete"]:hover {
        background-color: #d32f2f;
    }
    
    </style>
</head>
<body>

    <div class="navbar">
        <div class="logo">
            <h2>Student Details Registration</h2>
        </div>
        <div class="nav-items">
            <p><button onclick="location.href='/student-details/home'">Home</button></p>
            <p><button onclick="location.href='/student-details/getdetails'">Get Details</button></p>
        </div>
    </div>

    <div class="filters">
        <form action="/student-details/Student-db-details" method="get">
            <input name="searchparam" type="text" value="<%= request.getParameter("searchparam") != null ? request.getParameter("searchparam") : "" %>" placeholder="Enter the Search Name" required>
            <input type="submit" value="Search">
        </form>

        <!-- <form action="/student-details/searchquery" method="get">
            <label>View</label>
            <select name="viewby" onchange="this.form.submit()">
                <option value="name">By Name</option>
                <option value="dept">By Department</option>
                <option value="cgpa">By CGPA</option>
                <option value="attprecent">By Attendance %</option>
            </select>
        </form> -->

        <!-- <form action="/student-details/sortby" method="get">
            <label>Sort By</label>
            <select name="sortby" onchange="this.form.submit()">
                <option value="asnd">Ascending</option>
                <option value="dsnd">Descending</option>
            </select>
        </form> -->
    </div>

    <h1>Student Details</h1>

    <div class="outdiv">
    <table>
        <tr>
            <th>Roll No</th>
            <th>Name</th>
            <th>Department</th>
            <th>CGPA</th>
            <th>Attendance Percentage</th>
            <th>Action</th>
        </tr>

        <%
            List<StudentDetailsEntity> students = (List<StudentDetailsEntity>) request.getAttribute("students");
            if (students != null && !students.isEmpty()) {
                for (StudentDetailsEntity student : students) {
        %>
            <tr>
                <td><%= student.getRollNo() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getDept() %></td>
                <td><%= student.getCgpa() %></td>
                <td><%= student.getAttprecent() %></td>
                <td>
				    <div class="action-buttons">
				        <form action="/student-details/update-form" method="get">
				            <input type="hidden" name="id" value="<%= student.getId() %>">
				            <input type="submit" value="Update">
				        </form>
				
				        <form action="/student-details/delete" method="post">
				            <input type="hidden" name="id" value="<%= student.getId() %>">
				            <input type="submit" value="Delete" onclick="return confirm('Are you sure?');">
				        </form>
				    </div>
				</td>

            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="6">No students found.</td></tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>
