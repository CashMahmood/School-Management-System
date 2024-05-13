<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $exam_id = $_POST["exam_id"];
    $class_id = $_POST["class_id"];
    $teacher_id = $_POST["teacher_id"];
    $student_id = $_POST["student_id"];
    $subject_code = $_POST["subject_code"];
    $score = $_POST["score"];
    $grade = $_POST["grade"];
    $date = $_POST["date"];

    // Database connection
    $servername = "localhost";
    $username = "root";
    $password = ""; // Default password for XAMPP
    $dbname = "school_management"; // Replace with your actual database name

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare SQL statement
    $sql = "INSERT INTO Result (exam_id, class_id, teacher_id, student_id, subject_code, score, grade, date)
            VALUES ('$exam_id', '$class_id', '$teacher_id', '$student_id', '$subject_code', '$score', '$grade', '$date')";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";

        // Fetch and display the table
        $result = $conn->query("SELECT * FROM Result");
        if ($result->num_rows > 0) {
            echo "<table border='1'>
                <tr>
                    <th>Result ID</th>
                    <th>Exam ID</th>
                    <th>Class ID</th>
                    <th>Teacher ID</th>
                    <th>Student ID</th>
                    <th>Subject Code</th>
                    <th>Score</th>
                    <th>Grade</th>
                    <th>Date</th>
                </tr>";
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>" . $row["result_id"] . "</td>
                    <td>" . $row["exam_id"] . "</td>
                    <td>" . $row["class_id"] . "</td>
                    <td>" . $row["teacher_id"] . "</td>
                    <td>" . $row["student_id"] . "</td>
                    <td>" . $row["subject_code"] . "</td>
                    <td>" . $row["score"] . "</td>
                    <td>" . $row["grade"] . "</td>
                    <td>" . $row["date"] . "</td>
                </tr>";
            }
            echo "</table>";
        } else {
            echo "0 results";
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close connection
    $conn->close();
}
?>
