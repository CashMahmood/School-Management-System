<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $date_of_birth = $_POST["date_of_birth"];
    $gender = $_POST["gender"];
    $email = $_POST["email"];
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
    $sql = "INSERT INTO Teacher (first_name, last_name, date_of_birth, gender, email, salary)
            VALUES ('$first_name', '$last_name', '$date_of_birth', '$gender', '$email', '$salary')";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";

        // Fetch and display all records from the Teacher table
        $result = $conn->query("SELECT * FROM Teacher");
        if ($result->num_rows > 0) {
            echo "<h2>Teacher Table</h2>";
            echo "<table border='1'>";
            echo "<tr><th>Teacher ID</th><th>First Name</th><th>Last Name</th><th>Date of Birth</th><th>Gender</th><th>Email</th><th>Salary</th></tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["teacher_id"] . "</td>"; 
                echo "<td>" . $row["first_name"] . "</td>";
                echo "<td>" . $row["last_name"] . "</td>";
                echo "<td>" . $row["date_of_birth"] . "</td>";
                echo "<td>" . $row["gender"] . "</td>";
                echo "<td>" . $row["email"] . "</td>";
                echo "<td>" . $row["salary"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "No records found in the Teacher table";
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close connection
    $conn->close();
}
?>
