<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f4f8;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: #ffffff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        width: 400px;
        text-align: center;
    }

    h1 {
        margin-bottom: 20px;
        color: #333333;
    }

    .note-box {
	    background-color: #e8f0fe;
	    border: 1px solid #a0c4ff;
	    padding: 15px;
	    border-radius: 8px;
	    font-size: 14px;
	    color: #333;
	    margin-top:20px;
	    margin-bottom: 15px;
	    text-align: left;
	}


    label {
        font-weight: bold;
        color: #555;
        align-self: flex-start;
        margin-left: 5%;
    }

    input[type="text"] {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 20px;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Student Management System</h1>
        <form action="/student-details/add-student-details-to-db" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="rollNo">Roll No:</label>
            <input type="text" id="rollNo" name="rollNo" required>

            <label for="dept">Department:</label>
            <input type="text" id="dept" name="dept" required>

            <label for="cgpa">CGPA:</label>
            <input type="text" id="cgpa" name="cgpa">

            <label for="attprecent">Attendance Percent:</label>
            <input type="text" id="attprecent" name="attprecent">

            <input type="submit" value="Submit">
        </form>
        <div class="note-box">
		    Note: CGPA and Attendance Percent can be left blank for new students.
		</div>
    </div>
</body>
</html>
