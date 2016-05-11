<?php 

// this is   VAR2  on  12:06  omn May 11 for test GitHub

// modified version 3 !!!!
//
//	Lotto 2016 * Acceptor 
//	
//	http://localhost/
//

//      http://localhost/PHP2016/acceptorLotto.php?smsID=1&MSISDN=359899866747&msp=87&smsBody=5LF1

//
//	set error reporting
error_reporting(E_ALL);

//
//	open connection
$link = mysql_connect('localhost', 'root', '');

if(!$link)
{
	//
	//	print error and exit()
	echo "-ERR MySQL Error: ".mysql_error();
	exit();
}

//
//	select db
mysql_select_db("DBlotto");

//
//	get data from _GET
$smsID = $_GET["smsID"];
$MSISDN = $_GET["MSISDN"];
$mobileSP = $_GET["msp"];
$smsBody = $_GET["smsBody"];

//
//	prepare data (delete space and etc.)
$smsBody = str_replace(" ","", $smsBody);

//
//	add slashes
$smsID = addslashes($smsID);
$MSISDN = addslashes($MSISDN);
$mobileSP = addslashes($mobileSP);
$smsBody = addslashes($smsBody);

//
//	search SQL in codes
$selectSQL = "
	SELECT 
		* 
	FROM 
		codes AS c, 
		prizeTypes AS p 
	WHERE 
		codeID = '$smsBody' AND 
		p.prizeTypeID = c.prizeTypeID 
";

//
//	exec SQL
$rSelect = mysql_query($selectSQL);

//  check result
if($rSelect == false)
{
	//
	//	print error and exit()
	echo "-ERR MySQL Error: ".mysql_error()."\nSQL: $selectSQL";
	exit();
}   
else 
{
	//
	//	get row count
	$count = mysql_num_rows($rSelect);   

	//
	//	check row count
	if($count == 0)
	{
		//
		//	print text for invalid code
		echo "+OK Invalid code.";
		exit();
	}

	//
	//	fetch data
	$row = mysql_fetch_array($rSelect);

	//
	//	get data
	$codeID = $row['codeID'];
	$statusID = $row['statusID'];
	$prizeTypeID = $row['prizeTypeID'];
	$prizeName = $row['prizeName'];

	//
	//	check statusID
	if($statusID == 1)
	{
		//
		//	print text for reused code
		echo "+OK Code is already used.";
		exit();
	}

	//
	//	update SQL
	$updateSQL = "
		UPDATE 
			codes 
		SET 
			statusID = 1 
		WHERE 
			codeID = '$codeID'
	";

	//
	//	exec SQL
	$rUpdate = mysql_query($updateSQL);

	//
	//	check result2
	if($rUpdate == false)
	{
		//
		//	print error and exit()
		echo "-ERR MySQL Error: ".mysql_error()."\nSQL: $updateSQL";
		exit();
	}

	//
	//	insert SQL
	$insertSQL = "
		INSERT INTO logs 
			(inboxID, mobileSP, MSISDN, codeID, prizeTypeID, dt) 
		VALUES 
			('$smsID', '$mobileSP', '$MSISDN', '$codeID', '$prizeTypeID', NOW())
	";

	//
	//	exec SQL
	$rInsert = mysql_query($insertSQL);

	//
	//	check result2
	if($rInsert == false)
	{
		//
		//	print error and exit()
		echo "-ERR MySQL Error: ".mysql_error()."\nSQL: $insertSQL";
		exit();
	}

	//
	//	check for prize type
	if($prizeTypeID != 0)
	{
		//
		//	print text won prize
		echo "+OK Congratulations!  You won $prizeName.";
	}
	else
	{
		//
		//	print text won prize
		echo "+OK Sorry, this time you does not win. Try again!";
	}
}

//
//	close connection
mysql_close($link);

?>