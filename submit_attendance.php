<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $date = $_POST["date"];
    $class_id = $_POST["class_id"];
    $student_id = $_POST["student_id"];
    $is_present = isset($_POST["is_present"]) ? 1 : 0; // Check if checkbox is checked
    
    // Database connection
    $servername = "localhost";
    $username = "root";
    $password = "password";
    $dbname = "school_management";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare SQL statement
    $sql = "INSERT INTO Attendance (date, class_id, student_id, is_present)
            VALUES ('$date', $class_id, $student_id, $is_present)";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "Attendance recorded successfully<br>";

        // Fetch and display the table
        $result = $conn->query("SELECT * FROM Attendance");
        if ($result->num_rows > 0) {
            echo "<table border='1'>
                <tr>
                    <th>Attendance ID</th>
                    <th>Date</th>
                    <th>Class ID</th>
                    <th>Student ID</th>
                    <th>Is Present</th>
                </tr>";
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>" . $row["attendance_id"] . "</td>
                    <td>" . $row["date"] . "</td>
                    <td>" . $row["class_id"] . "</td>
                    <td>" . $row["student_id"] . "</td>
                    <td>" . ($row["is_present"] ? 'Yes' : 'No') . "</td>
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
