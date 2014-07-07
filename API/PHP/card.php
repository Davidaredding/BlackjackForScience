<?php 
class card
{
	
	private static $ranks = null;	
	private static $suits = null;
			
	
	public static function Ranks(){
		if(self::$ranks==null)
		{
			self::$ranks =  array(
				(object) array('Name' => 'Ace', 'Value' => 11,'AltValue' => 1),
				(object) array('Name' => 'King', 'Value' => 10, 'AltValue' => 10),
				(object) array('Name' => 'Queen', 'Value' => 10, 'AltValue' => 10),
				(object) array('Name' => 'Jack', 'Value' => 10, 'AltValue' => 10),
				(object) array('Name' => 'Ten', 'Value' => 10, 'AltValue' => 10),
				(object) array('Name' => 'Nine', 'Value' => 9, 'AltValue'  => 9),
				(object) array('Name' => 'Eight', 'Value' => 8, 'AltValue' => 8),
				(object) array('Name' => 'Seven', 'Value' => 7, 'AltValue' => 7),
				(object) array('Name' => 'Six', 'Value' => 6, 'AltValue'  => 6),
				(object) array('Name' => 'Five', 'Value' => 5, 'AltValue'  => 5),
				(object) array('Name' => 'Four', 'Value' => 4, 'AltValue'  => 4),
				(object) array('Name' => 'Three', 'Value' => 3, 'AltValue' => 3),
				(object) array('Name' => 'Two', 'Value' => 2, 'AltValue'  => 2));
		}
		return self::$ranks;
	}

	public static function Suits(){
		if(self::$suits == null)
		{
			self::$suits = array(
				"Spades" ,
				"Hearts" ,
				"Clubs"  ,
				"Diamonds",
			);
		}
		return self::$suits;
	}


	public $Rank;
	public $Suit;
	public $Value;
	public $AltValue;

	public function __construct($rank, $suit)
	{

		$this->Rank = $rank->Name;
		$this->Suit = $suit;
		$this->Value = $rank->Value;
		$this->AltValue = $rank->AltValue;
	}

	public function __toString()
	{
		return "{$this->Rank} of {$this->Suit}";
	}
	
}

if(count(get_included_files()) <= 1){Test_Card();}

function Test_Card()
{
	$_r = $_REQUEST["rank_id"]; //Testing
	$_s = $_REQUEST["suit_id"]; //Testing

	$_r= $_r==null?0:$_r;
	$_s= $_s==null?0:$_s;

	$c = new card(card::Ranks()[$_r], card::Suits()[$_s]);

	echo json_encode($c);
}
?>