<?php
	session_start();
	require('../../MODEL/model.php');

	if (isset($_SESSION['co'])) {

		include('../VIEW/change_account.php');

	} else {

		header('location: ../index.php');
	}
?>