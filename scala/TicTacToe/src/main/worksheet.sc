//import java.awt.print.Printable

class Square(val content:String)

class Row(val square:(Square, Square, Square)) {

  def updateSquare(x:Int, newSquare:Square) :Row = x match {
    case 1 => new Row((newSquare, this.square._2, this.square._3) )
    case 2 => new Row((this.square._1, newSquare, this.square._3) )
    case 3 => new Row((this.square._1, this.square._2, newSquare) )
  }

  def printSelf(): Unit = {
    println(square._1.content + "|" + square._2.content + "|" + square._3.content)
  }

  def isWinningRow(blankSquare:Square)  :Boolean = {
    (square._1 != blankSquare) & (square._1 == square._2) & (square._1 == square._3)

  }
}

class Rows(val row:(Row,Row,Row)) {

  def updateSquare(x:Int, y:Int, newSquare:Square ) :Rows = y match {
    case 1 => new Rows( (this.row._1.updateSquare(x,newSquare), this.row._2, this.row._3 ))
    case 2 => new Rows( (this.row._1, this.row._2.updateSquare(x,newSquare), this.row._3 ))
    case 3 => new Rows( (this.row._1, this.row._2, this.row._3.updateSquare(x,newSquare) ))
  }

  def printSelf() {
    row._1.printSelf()
    row._2.printSelf()
    row._3.printSelf()
  }

  def reset(square:Square): Rows = {
    new Rows(new Row((square, square, square)),new Row((square, square, square)),new Row((square, square, square)))
  }

  def col1 = new Row(row._1.square._1,row._2.square._1,row._3.square._1)
  def col2 = new Row(row._1.square._2,row._2.square._2,row._3.square._2)
  def col3 = new Row(row._1.square._3,row._2.square._3,row._3.square._3)

  def diagonal1 = new Row(row._1.square._1,row._2.square._2,row._3.square._3)
  def diagonal2 = new Row(row._1.square._3,row._2.square._2,row._3.square._1)
}

class Game(val blankSquare:Square, xSquare:Square, oSquare:Square)  {

  var board = new Rows(new Row((blankSquare, blankSquare, blankSquare)),new Row((blankSquare, blankSquare, blankSquare)),new Row((blankSquare, blankSquare, blankSquare)))

  def placeX(x:Int, y:Int) {
    updateSquare(x,y, xSquare)
  }
  def placeO(x:Int, y:Int) {
    updateSquare(x,y, oSquare)
  }
  def updateSquare(x:Int, y:Int, newSquare:Square ) {
    board = board.updateSquare(x,y,newSquare)
  }
  def print() {
    board.printSelf()
  }
  def reset(): Unit = {
    board = board.reset(blankSquare)
  }

  def containsWinningRow(blankSquare:Square):Boolean = {
    aRowIsAWinner(blankSquare)|aColumnIsAWinner(blankSquare)|aDiagonalIsAWinner(blankSquare)
  }
  def aRowIsAWinner(blankSquare:Square):Boolean = {
    board.row._1.isWinningRow(blankSquare)|board.row._2.isWinningRow(blankSquare)|board.row._3.isWinningRow(blankSquare)
  }
  def aColumnIsAWinner(blankSquare:Square):Boolean = {
    board.col1.isWinningRow(blankSquare)|board.col2.isWinningRow(blankSquare)|board.col3.isWinningRow(blankSquare)
  }
  def aDiagonalIsAWinner(blankSquare:Square):Boolean = {
    board.diagonal1.isWinningRow(blankSquare)|board.diagonal2.isWinningRow(blankSquare)
  }
}

//set up some basic test data
val blankSquare = new Square(content = "_")
val OSquare = new Square(content = "O")
val XSquare = new Square(content = "X")

println("Test game looks OK with some random Xs and Os")
val game = new Game(blankSquare, XSquare, OSquare)
game.placeO(1,1)
game.placeX(2,2)
game.placeX(3,3)
game.print()

println("Test resetting the game")
game.reset()
game.print()

println("Test empty board doesn't contain a winner")
game.containsWinningRow(blankSquare)

println("Test first row all Xs is a winner")
game.updateSquare(1,1,XSquare)
game.updateSquare(2,1,XSquare)
game.updateSquare(3,1,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test second row all Xs is a winner")
game.reset()
game.updateSquare(1,2,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(3,2,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test third row all Xs is a winner")
game.reset()
game.updateSquare(1,3,XSquare)
game.updateSquare(2,3,XSquare)
game.updateSquare(3,3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test first column all Xs is a winner")
game.reset()
game.updateSquare(1,1,XSquare)
game.updateSquare(1,2,XSquare)
game.updateSquare(1,3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test second col all Xs is a winner")
game.reset()
game.updateSquare(2,1,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(2,3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test third col all Xs is a winner")
game.reset()
game.updateSquare(3,1,XSquare)
game.updateSquare(3,2,XSquare)
game.updateSquare(3,3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test right-to-left diagonal all Xs is a winner")
game.reset()
game.updateSquare(1,1,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(3,3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test left-to-right diagonal all Xs is a winner")
game.reset()
game.updateSquare(3,1,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(1,3,XSquare)
game.print()
game.containsWinningRow(blankSquare)
