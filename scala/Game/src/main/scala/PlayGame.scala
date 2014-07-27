class PlayGame(updateVals:List[String]){
	def this() = this(List("X","O"))

	def play():Unit = {

		val myBoard = new Board()
		val myGame = new TicTacToeGame(myBoard)

		val endGame = playRecur(myGame,1,updateVals)
		
		println(endGame)
		if(endGame.tiedGame) println("Tied Game")
		if(endGame.xWins) println("X Wins!") else println("O Wins")
		
	}

	def playRecur(game:TicTacToeGame,turnNum:Int,updateVals:List[String]):TicTacToeGame = {
		
		println(game)

		if(turnNum > 9) game

		val gameOver:Boolean = game.xWins || game.oWins || game.tiedGame
 
		if(gameOver) game
		else {

			println("Player is " + updateVals((turnNum-1)%2))
			println("Enter a Value from 1-9")
			val position = Console.readLine

			if(game.getBoard(position.toInt-1) == "X" || game.getBoard(position.toInt-1) == "O"){
				println("The position is already taken, try again.")
				playRecur(game,turnNum,updateVals)
			}
			else
			if (position.toInt>0 && position.toInt<10){

				val updateVal = updateVals((turnNum-1) % 2)
				val updatePosition = (position.toInt-1)
				val updateBoard = new Board(game.getBoard.updated(updatePosition,updateVal))

				playRecur(new TicTacToeGame(updateBoard),turnNum+1,updateVals)

			} 
			else {
				
				println("Enter a Value from 1-9:")
				playRecur(game,turnNum,updateVals)
				
			}
			
		}

	}

	
} 