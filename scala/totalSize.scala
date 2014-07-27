def totalSize(words:List[String]):Int = {
	(0 /: words) { (size,s) => size + s.length }
}