class TicTacToeGame(gameBoard:Board){
	
	def wins(direction: List[List[String]])(symb:String):Boolean = {
		direction.map(dir => dir.forall(e => e == symb))
					  .exists(x => x == true)
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
		(gameBoard.rows.forall(row => row.forall(element => (element == "X" || element == "O")))) &&
		!xWins && !oWins
	}

	def getBoard:List[String] = { gameBoard.getBoard }

	override def toString:String = gameBoard.toString
	
}