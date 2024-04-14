<?php
$root = (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'];
?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="jfksite.css">
<body>
    <div class="maincontent">
    <div class="headbox">
        <h1><span class="line">Welcome!</span> <span class="line">Enjoy your stay.</span></h1>
    </div>
    
    <div class="linkimages">
        <a href="https://pfsense.thejfk.ca/"><img src="images/pfsense.png" /></a>
        <a href="https://plex.thejfk.ca/"><img src="images/plex_logo.png" /></a>        
        <a href="https://pve.thejfk.ca/"><img src="images/proxmox.jpg" /></a>
        <a href="https://transmission.thejfk.ca/"><img src="images/transmission.png" /></a>
        <a href="https://sonarr.thejfk.ca/"><img src="images/sickbeard_logo.png" /></a>   
    </div>
    </div>
</body>
</html>
