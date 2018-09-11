trait AbleToCensor[T] {
    val theWord:T
    def censor(censorList:Map[T,T]) :T = {

        if (censorList.contains(theWord) ) {
            censorList(theWord)
        } else {
            theWord
        }
    }
}

class CensorableWord(override val theWord:String) extends AbleToCensor[String]

//This replaces the default companion object used by "new"
object CensorableWord {
    def apply(theWord:String) = new CensorableWord(theWord)
}

val listofWords =  List(CensorableWord("Oh"),CensorableWord("Shoot"),CensorableWord("I banged my"), CensorableWord("Darn"),CensorableWord("foot"))
val censorData = Map("Shoot" -> "Pucky", "Darn"->"Beans")

listofWords.map((censorableWord)=> censorableWord.censor(censorData) )

