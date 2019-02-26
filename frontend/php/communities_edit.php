<?php 

    $name = htmlspecialchars($_POST["name"]);
    $email = htmlspecialchars($_POST["email"]);
    $location = htmlspecialchars($_POST["location"]);
    $size = htmlspecialchars($_POST["size"]);
    $description = htmlspecialchars($_POST["description"]);
    echo "Name: $name, Email: $email, Location: $location, Size: $size, Description: $description.\n";
    
    //function test($name, $email, $location, $size, $description)
    //{
    //    echo "Name: $name, Email: $email, Location: $location, Size: $size, Description: $description.\n";
    //}
?>