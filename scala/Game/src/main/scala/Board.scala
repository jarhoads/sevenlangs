class Board(gameBoard:List[String]){

	def this() = this(List("1","2","3","4","5","6","7","8","9"))

	val rows: List[List[String]] = List(
					List(gameBoard(0), gameBoard(1), gameBoard(2)),
					List(gameBoard(3), gameBoard(4), gameBoard(5)),
					List(gameBoard(6), gameBoard(7), gameBoard(8))
					)

	val cols: List[List[String]] = List(
					List(gameBoard(0), gameBoard(3), gameBoard(6)),
					List(gameBoard(1), gameBoard(4), gameBoard(7)),
					List(gameBoard(2), gameBoard(5), gameBoard(8))
					)

	val diags: List[List[String]] = List(
					List(gameBoard(0), gameBoard(4), gameBoard(8)),
					List(gameBoard(2), gameBoard(4), gameBoard(6))
					)

	override def toString():String = {

		val row1 = rows(0).mkString(" | ") + "\n"
		val row2 = rows(1).mkString(" | ") + "\n"
		val row3 = rows(2).mkString(" | ")

		val seperator:String = "---------\n"

		row1 + 
		seperator +
		row2 +
		seperator +
		row3

	}

	def getBoard:List[String] = { gameBoard }

}
