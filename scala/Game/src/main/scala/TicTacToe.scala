object TicTacToe{

	def main(args: Array[String]){

		println("Enter X or O for the first player")
		val firstPlayer = Console.readLine.toUpperCase

		val validInput = (firstPlayer == "X" || firstPlayer == "O")
		if(!validInput) main(args)
		else{
		
			val game = if(firstPlayer == "X") new PlayGame() else new PlayGame(List("O","X"))

			game.play
			
		}

			
	}
	
}