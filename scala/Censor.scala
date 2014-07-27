import scala.io._

/*
	I wasn't exactly sure what this was asking me to do.
	I think this is at least close...

*/
trait Censor{

	val splitLines = Source.fromFile("censor.txt").getLines().map(l => i.split(" "))

	// I don't like this being a var... I'll change it eventually
	var replace = scala.collection.mutable.Map[String,String]()
	splitLines.foreach{line => replace += (line(0)->line(1))}
	
	def replaceWord(checkWord:String):String = replace.getOrElse(checkWord,checkWord)
}

class StringReader(inString:String){
	def splitSpace():Array[String] = inString.split(" ")
}

object CensorTest{

	def main(args: Array[String]){
		
		val testString = "This is a darn test string so this is shoot"
		println("test string: " + testString)

		val sr = new StringReader(testString) with Censor

		val censored:String = sr.splitSpace.map(s => sr.replaceWord(s)).mkString(" ")
		println("censored: " + censored)
	}

	
}

