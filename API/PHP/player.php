<?php
	require_once "hand.php";
	class player
	{
		public $Hand;
		public $SplitHand;
		public $Name;
		public $Busted=false;

		public function __construct($name)
		{
			$this->Name = $name;
			$this->Hand = new hand;
			$this->SplitHand = new hand;

		}

		public function ClearHand()
		{
			$this->Hand->Clear();
			$this->SplitHand->Clear();
		}
	}

	if(count(get_included_files()) <= 3){Test_Player();}

	function Test_Player()
	{
		$c1 = new card(card::Ranks()[0], card::Suits()[0]);
		$c2 = new card(card::Ranks()[1], card::Suits()[1]);
		$c3 = new card(card::Ranks()[0], card::Suits()[2]);
		$c4 = new card(card::Ranks()[1], card::Suits()[3]);
		
		$p1 = new player("Dave");

		array_push($p1->Hand->Cards, $c1,$c2,$c3,$c4); //should equate to 22
		$p1->Hand->CalculateValue();
		$p1->Busted = $p1->Hand->Value > 21;

		echo json_encode($p1);

	}

?>