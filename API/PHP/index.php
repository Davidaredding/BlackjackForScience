<?php 
class card
{
	
	public $Suit;
	public $Index;
	
	
}

$c = new card;
$c->Suit = $_REQUEST['suit'];
$c->Index = $_REQUEST['value'];

header("Content-type:application/JSON");
echo json_encode($c);
?>