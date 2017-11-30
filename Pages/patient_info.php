<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "patient";
$Firstname = $_POST['Firstname'];

$DOB =$_POST['DOB'];
$Gender =$_POST['Gender'];
$Smoke =$_POST['Smoke'];
$Alcohol =$_POST['Alcohol'];
$MaritialStatus =$_POST['MaritialStatus'];
$Occupation =$_POST['Occupation'];
$SpecialServices =$_POST['SpecialServices'];
$Allergies =$_POST['Allergies'];
$EmergencyStatus =$_POST['EmergencyStatus'];
$PatientType =$_POST['PatientType'];
$Insurance =$_POST['Insurance'];



// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
} 

$sql = "INSERT INTO patient_info (First_name,Last_name,DoB,Gender,Smoke,Alcohol,Maritial_Status,Occupation,Special_service_flag,Allergy_flag,Emergency_status,Patient_type,Insurance_yn)
VALUES ($Firstname,'abc',$DOB,$Gender,$Smoke,$Alcohol,$MaritialStatus,$Occupation,$SpecialServices,$Allergies,$EmergencyStatus,$PatientType,$Insurance)";

if ($conn->query($sql) === TRUE) {
   echo "New record created successfully";
} else {
   echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>

