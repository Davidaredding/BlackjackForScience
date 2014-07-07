<?php
require_once 'card.php';

function sum_cards($carry, $card)
{
	$carry += $card->Value;
	return $carry;
}

function filter_altVals($var)
{
	return $var->Value != $var->AltValue;
}


	class hand
	{
		public $Cards;
		public $Value=0;

		

		public function __construct()
		{
			$this->Cards = array();
		}

		public function CalculateValue()
		{
			
			$val = array_reduce($this->Cards, "sum_cards",0);
			
			if($val > 21)
			{
				foreach(array_filter($this->Cards,"filter_altVals") as $card)
				{
					$swap = $card->Value;
					$card->Value = $card->AltValue;
					$card->AltValue = $swap;
					$val = array_reduce($this->Cards,"sum_cards",0);
					if($val<=21)
					{
						break;
					}
				} 
			}
			$this->Value = $val;
			return $val;
		}

		public function Clear()
		{
			unset($this->Cards);
			$this->Cards = array();
		}

	}
	
	if(count(get_included_files()) <= 2){Test_Hand();}

	function Test_Hand()
	{
		$c1 = new card(card::Ranks()[0], card::Suits()[0]);
		$c2 = new card(card::Ranks()[1], card::Suits()[1]);
		$c3 = new card(card::Ranks()[0], card::Suits()[2]);
		$c4 = new card(card::Ranks()[1], card::Suits()[3]);
		$h = new hand();

		//array_push($h->Cards, $c1,$c2,$c3); //should equate to 12
		array_push($h->Cards, $c1,$c2,$c3,$c4); //should equate to 22

		$h->CalculateValue();
		echo json_encode($h);

	}

?>