val list = List("dog","cat","elephant")
//Using the /: notation
(0 /: list){(sum,stringItem) => sum + stringItem.length}

//Using the  foldLeft[T](z:T)(op: (T,U) =>T) T
list.foldLeft(0)((sum, stringItem) => sum + stringItem.length)

