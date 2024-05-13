<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $subject_code = $_POST["subject_code"];
    $subject_name = $_POST["subject_name"];
    $teacher_id = $_POST["teacher_id"];

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
    $sql = "INSERT INTO Subjects (subject_code, subject_name, teacher_id)
            VALUES ($subject_code, '$subject_name', $teacher_id)";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";

        // Fetch and display all records from the Subjects table
        $result = $conn->query("SELECT * FROM Subjects");
        if ($result->num_rows > 0) {
            echo "<h2>Subjects Table</h2>";
            echo "<table border='1'>";
            echo "<tr><th>Subject Code</th><th>Subject Name</th><th>Teacher ID</th></tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["subject_code"] . "</td>";
                echo "<td>" . $row["subject_name"] . "</td>";
                echo "<td>" . $row["teacher_id"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "No records found in the Subjects table";
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close connection
    $conn->close();
}
?>
