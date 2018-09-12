
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

//takes a list of any type and converts into a mutable hashmap of type:type
//this would be used to take the list created by reading a file into the list of words
def listToMap[T](m:Map[T,T], l:List[T]) :Map[T,T] = {
  val newKey = l.head
  val newValue = l.tail.head
  val newMap =  m ++ Map(newKey -> newValue)
  val remainingList = l.tail.tail
  if (remainingList.isEmpty) {
      newMap
  }  else {
      listToMap(newMap ,remainingList)
  }
}
val l = List("Shoot","Pucky","Darn","Beans")
listToMap(Map[String,String](),l)