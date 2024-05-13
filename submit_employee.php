<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $date_of_birth = $_POST["date_of_birth"];
    $gender = $_POST["gender"];
    $email = $_POST["email"];
    $designation = $_POST["designation"];
    $salary = $_POST["salary"];

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
    $sql = "INSERT INTO Employee (first_name, last_name, date_of_birth, gender, email, designation, salary)
            VALUES ('$first_name', '$last_name', '$date_of_birth', '$gender', '$email', '$designation', $salary)";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";

        // Fetch and display records from the "Subjects" table
        $result = $conn->query("SELECT * FROM Subjects");
        if ($result->num_rows > 0) {
            echo "<table border='1'>
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Teacher ID</th>
                </tr>";
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>" . $row["subject_code"] . "</td>
                    <td>" . $row["subject_name"] . "</td>
                    <td>" . $row["teacher_id"] . "</td>
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
