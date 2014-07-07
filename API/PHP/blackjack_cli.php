<?php
		require_once("deck.php");
		require_once("player.php");

		$cli_handle = fopen("php://stdin", "r");
		$Deck = new deck(1);
		
		$Dealer = new player("Dealer");
		$Playing = true;
		echo "Welcome to PHP BlackJack\n";
		echo "Please enter your name: ";
		$line = trim(fgets($cli_handle));

		$Player1 = new player($line);
		echo "Welcome, Sugartits!\n";

		while(true)
		{
			echo "Dealing\n";
			array_push($Player1->Hand->Cards,$Deck->Deal(),$Deck->Deal());
			array_push($Dealer->Hand->Cards, $Deck->Deal(),$Deck->Deal());
			$Player1->Hand->CalculateValue();
			$Dealer->Hand->CalculateValue();

			echo "{$Dealer->Name} is showing {$Dealer->Hand->Cards[0]}\n";
			
			while($Player1->Hand->Value <= 21)
			{
				echo "Your total is {$Player1->Hand->Value}, would you like to [H]it or [S]tand?\n";
				$line = trim(fgets($cli_handle));
				if($line == "S" || $line == "s")
				{
					echo "You stand on {$Player1->Hand->Value}.\n";
					break;
				}
				$c = $Deck->Deal();
				array_push($Player1->Hand->Cards,$c);
				$Player1->Hand->CalculateValue();

				echo "{$Player1->Name} hits and gets {$c}\n";
				if($Player1->Hand->Value > 21)
				{
					echo "\033[34mBusted!!!\033[0m with a {$Player1->Hand->Value}\n";
					break;
				}
				
			}
			$Player1->ClearHand();
			$Dealer->ClearHand();
			echo "New Round!!\n\n";


		}
		//$handle = fopen("php://stdin", "r");
		//$line = fgets($handle);
		
	
?>