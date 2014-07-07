
<?php
	require_once 'card.php';
	class deck{
		public $Shoe;
		public $Discard;



		public function __construct($size = 1)
		{
			$this->Shoe = array();
			$this->buildDeck($size);
			shuffle($this->Shoe);	
		}

		public function Deal()
		{
			return array_shift($this->Shoe);
		}

		private function buildDeck($size)
		{
			for($i=0; $i<$size; $i++)
			{
				foreach(card::Ranks() as $r)
				{
					foreach(card::Suits() as $s)
					{
						array_push($this->Shoe,new Card($r,$s));
					}
				}
			}
		}
		
	}

	if(count(get_included_files()) <= 2){Test_Deck();}

	function Test_Deck()
	{
		$d = new deck();
		echo json_encode($d->Shoe);
	}
?>