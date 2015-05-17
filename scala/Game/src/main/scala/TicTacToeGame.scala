class TicTacToeGame(gameBoard:Board){
	
	// Using WinsMatch will remove the need to use wins(direction)
	def winsMatch(direction:List[List[String]]):Boolean = {
		direction.exists(dir => dir match {
			case ["X","X","X"] => true
			case ["O","O","O"] => true
			case _ => false  
			} 
		)
	}
	def wins(direction: List[List[String]])(symb:String):Boolean = {

		direction.exists(dir => dir.forall(e => e == symb))
		//direction.map(dir => dir.forall(e => e == symb))
		//			  .exists(x => x == true)
	}

	def rowsWin:String => Boolean = wins(gameBoard.rows) _
	def colsWin:String => Boolean = wins(gameBoard.cols) _
	def diagsWin:String => Boolean = wins(gameBoard.diags) _

	def rowsWinX:Boolean = rowsWin("X")
	def colsWinX:Boolean = colsWin("X")
	def diagsWinX:Boolean = diagsWin("X")

	def rowsWinO:Boolean = rowsWin("O")
	def colsWinO:Boolean = colsWin("O")
	def diagsWinO:Boolean = diagsWin("O")

	def xWins:Boolean = rowsWinX || colsWinX || diagsWinX
	def oWins:Boolean = rowsWinO || colsWinO || diagsWinO

	def tiedGame:Boolean = {
		!xWins && !oWins &&
		(gameBoard.rows.forall(row => 
			row.forall(element => 
				(element == "X" || element == "O")))) 

	}

	def getBoard:List[String] = { gameBoard.getBoard }

	override def toString:String = gameBoard.toString
	
}