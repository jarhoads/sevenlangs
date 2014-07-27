import java.nio.charset.CodingErrorAction
import scala.io._
import scala.actors._
import Actor._

object PageLoader{
	def getPageSize(url:String) = {

			getSource(url).length
	}

	def getPageLinks(url:String):List[String] = {
		
		val source = getSource(url)
		val matches = """(?i)\b(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]""".r
		val links = matches.findAllIn(source).toList
		links			
	}  

	private def getSource(url:String):String = {
		
		// I added this because amazon is sending a character that causes an exception
		// the implicit codec will replace it
		implicit val codec = Codec("UTF-8")
		codec.onMalformedInput(CodingErrorAction.REPLACE)
		codec.onUnmappableCharacter(CodingErrorAction.REPLACE)

		try{
			Source.fromURL(url).mkString
		}
		catch{
			// if there is an exception, return 0
			case e: Exception => ""
		}

	}
}

val urls = List("http://www.amazon.com",
				"http://www.facebook.com",
				"http://www.twitter.com",
				"http://www.google.com",
				"http://www.cnn.com")

def timeMethod(method:() => Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime

	println("method took " + (end - start)/1000000000.0 + " seconds.")
} 

def getPageSizeSequentially() = {
	for(url <- urls){
		println("size for " + url + ": " + PageLoader.getPageSize(url))
		val pageLinks = PageLoader.getPageLinks(url)

		println("number of links for " + url + ": " + pageLinks.size)
		for(link <- pageLinks){
			println("from " + url + " link " + link + ": " + PageLoader.getPageSize(link))
		}
	}
}

def getPageSizeConcurrently() = {
	val caller = self

	for(url <- urls){
		actor{ caller ! (url,PageLoader.getPageSize(url))}

		val pageLinks = PageLoader.getPageLinks(url)

		actor{ caller ! (url,pageLinks) }

		for(link <- pageLinks){	
			actor{ caller ! (link,PageLoader.getPageSize(link)) }
		}
	}

	for(i<-1 to (urls.size*2)){
		receive{
			case(url,size:Int) =>
				println("size for " + url + ": " + size)
			case(url,links:List[String]) => {
				println("number of links for " + url + ": " + links.size)

				for(i<-1 to links.size){
					receive{
						case(link,s:Int) =>
							println("from " + url + " link " + link + ": " + s)
					}
				}
			}
		}	
		
	}
}