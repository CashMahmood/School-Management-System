<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $exam_name = $_POST["exam_name"];
    $date = $_POST["date"];
    $time = $_POST["time"];

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
    $sql = "INSERT INTO Exams (exam_name, date, time)
            VALUES ('$exam_name', '$date', '$time')";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";

        // Fetch and display the table
        $result = $conn->query("SELECT * FROM Exams");
        if ($result->num_rows > 0) {
            echo "<table border='1'>
                <tr>
                    <th>Exam ID</th>
                    <th>Exam Name</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>";
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>" . $row["exam_id"] . "</td>
                    <td>" . $row["exam_name"] . "</td>
                    <td>" . $row["date"] . "</td>
                    <td>" . $row["time"] . "</td>
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
