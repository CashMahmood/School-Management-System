<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $class_name = $_POST["class_name"];
    $section = $_POST["section"];
    $teacher_id = $_POST["teacher_id"];
    $room_number = $_POST["room_number"];

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
    $sql = "INSERT INTO Classes (class_name, section, teacher_id, room_number)
            VALUES ('$class_name', '$section', $teacher_id, '$room_number')";

    // Execute SQL statement
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully<br>";

        // Fetch and display the table
        $result = $conn->query("SELECT * FROM Classes");
        if ($result->num_rows > 0) {
            echo "<table border='1'>
                <tr>
                    <th>Class ID</th>
                    <th>Class Name</th>
                    <th>Section</th>
                    <th>Teacher ID</th>
                    <th>Room Number</th>
                </tr>";
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>" . $row["class_id"] . "</td>
                    <td>" . $row["class_name"] . "</td>
                    <td>" . $row["section"] . "</td>
                    <td>" . $row["teacher_id"] . "</td>
                    <td>" . $row["room_number"] . "</td>
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
