import scala.io._

/*
	I wasn't exactly sure what this was asking me to do.
	I think this is at least close...

*/
trait Censor{

	val splitLines = Source.fromFile("censor.txt").getLines().map(l => i.split(" "))

	// I started writing a toStringMap function but 
	// then realized I was re-implementing foldLeft... oops ;-P
	val replace = (Map[String,String]() /: splitLines){(map,line) => (line(0)->line(1)) ++ map} 
	
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

