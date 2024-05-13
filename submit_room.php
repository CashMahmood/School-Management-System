<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $room_number = $_POST["room_number"];
    $capacity = $_POST["capacity"];
    $room_type = $_POST["room_type"];

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
    $sql = "INSERT INTO Room (room_number, capacity, room_type)
            VALUES ('$room_number', $capacity, '$room_type')";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";

        // Fetch and display all records from the Room table
        $result = $conn->query("SELECT * FROM Room");
        if ($result->num_rows > 0) {
            echo "<h2>Room Table</h2>";
            echo "<table border='1'>";
            echo "<tr><th>Room Number</th><th>Capacity</th><th>Room Type</th></tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["room_number"] . "</td>";
                echo "<td>" . $row["capacity"] . "</td>";
                echo "<td>" . $row["room_type"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "No records found in the Room table";
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close connection
    $conn->close();
}
?>
