<?php

$connect = new mysqli("localhost","root","","demo1");

if($connect){
	 
}else{
	echo "Fallo, revise ip o firewall";
	exit();
}