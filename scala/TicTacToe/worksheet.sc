import java.awt.print.Printable

class Square(val content:String)

class Row(val square:(Square, Square, Square)) {
  def updateSquare(x:Int, newSquare:Square) :Row = {
    if (x == 1) {
      return new Row((newSquare, this.square._2, this.square._3) ) }
    else if (x == 2) {
      return new Row((this.square._1, newSquare, this.square._3) ) }
    else {
      return new Row((this.square._1, this.square._2, newSquare) )
    }
  }

  def printSelf: Unit = {
    println(square._1.content + "|" + square._2.content + "|" + square._3.content)
  }

  def isWinningRow(blankSquare:Square)  :Boolean = {
    if ((square._1 != blankSquare) & (square._1 == square._2) & (square._1 == square._3))  {
      return true
    } else {
      return false
    }
  }
}

class Rows(val row:(Row,Row,Row)) {
  def updateSquare(x:Int, y:Int, newSquare:Square ) :Rows = {
    if (y == 1) {
      return new Rows( (this.row._1.updateSquare(x,newSquare),this.row._2, this.row._3 ))}
    else if (y == 2) {
      return new Rows((this.row._1, this.row._2.updateSquare(x,newSquare), this.row._3))}
    else {
      return new Rows((this.row._1,this.row._2, this.row._3.updateSquare(x,newSquare)))
    }
  }
  def printSelf {
    row._1.printSelf
    row._2.printSelf
    row._3.printSelf
  }
  def reset(square:Square): Rows = {
      return new Rows(new Row((square, square, square)),new Row((square, square, square)),new Row((square, square, square)))
  }
}

class Game(var board:Rows)  {
  def updateSquare(x:Int, y:Int, newSquare:Square ): Unit = {
    board = board.updateSquare(x,y,newSquare)
  }
  def print {
    board.printSelf
  }
  def reset(square:Square): Unit = {
    board = board.reset(square)
  }

  def containsWinningRow(blankSquare:Square):Boolean = {
    if ((aRowIsAWinner(blankSquare))|(aColumnIsAWinner(blankSquare))|(aDiagonalIsAWinner(blankSquare))) {
      return true
    } else {
      return false
    }
  }
  def aRowIsAWinner(blankSquare:Square):Boolean = {
    if (board.row._1.isWinningRow(blankSquare) ) {
      return true
    }
    if (board.row._2.isWinningRow(blankSquare) ) {
      return true
    }
    if (board.row._3.isWinningRow(blankSquare) ) {
      return true
    }
    return false
  }
  def aColumnIsAWinner(blankSquare:Square):Boolean = {
    val col1 = new Row(board.row._1.square._1,board.row._2.square._1,board.row._3.square._1)
    if (col1.isWinningRow(blankSquare)) {
      return true
    }
    val col2 = new Row(board.row._1.square._2,board.row._2.square._2,board.row._3.square._2)
    if (col2.isWinningRow(blankSquare)) {
      return true
    }
    val col3 = new Row(board.row._1.square._3,board.row._2.square._3,board.row._3.square._3)
    if (col3.isWinningRow(blankSquare)) {
      return true
    }
    return false
  }
  def aDiagonalIsAWinner(blankSquare:Square):Boolean = {
    val diag1 = new Row(board.row._1.square._1,board.row._2.square._2,board.row._3.square._3)
    if (diag1.isWinningRow(blankSquare)) {
      return true
    }
    val diag2 = new Row(board.row._1.square._3,board.row._2.square._2,board.row._3.square._1)
    if (diag2.isWinningRow(blankSquare)) {
      return true
    }

    return false
  }
}

val blankSquare = new Square(content = " ")
val OSquare = new Square(content = "O")
val XSquare = new Square(content = "X")

val row1 = new Row((blankSquare, blankSquare, blankSquare))
val row2 = new Row((blankSquare, blankSquare, blankSquare))
val row3 = new Row((blankSquare, blankSquare, blankSquare))

val rows = new Rows(row1,row2,row3)

val game = new Game(rows)
game.updateSquare(1,1,OSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(3,3,XSquare)

game.print

game.reset(blankSquare)
game.print

game.containsWinningRow(blankSquare)
game.updateSquare(1,1,XSquare)
game.updateSquare(2,1,XSquare)
game.updateSquare(3,1,XSquare)
game.print
game.containsWinningRow(blankSquare)

game.reset(blankSquare)
game.updateSquare(1,2,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(3,2,XSquare)
game.print
game.containsWinningRow(blankSquare)

game.reset(blankSquare)
game.updateSquare(1,3,XSquare)
game.updateSquare(2,3,XSquare)
game.updateSquare(3,3,XSquare)
game.print
game.containsWinningRow(blankSquare)

game.reset(blankSquare)
game.updateSquare(1,1,XSquare)
game.updateSquare(1,2,XSquare)
game.updateSquare(1,3,XSquare)
game.print
game.containsWinningRow(blankSquare)

game.reset(blankSquare)
game.updateSquare(2,1,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(2,3,XSquare)
game.print
game.containsWinningRow(blankSquare)

game.reset(blankSquare)
game.updateSquare(3,1,XSquare)
game.updateSquare(3,2,XSquare)
game.updateSquare(3,3,XSquare)
game.print
game.containsWinningRow(blankSquare)

game.reset(blankSquare)
game.updateSquare(1,1,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(3,3,XSquare)
game.print
game.containsWinningRow(blankSquare)

game.reset(blankSquare)
game.updateSquare(3,1,XSquare)
game.updateSquare(2,2,XSquare)
game.updateSquare(1,3,XSquare)
game.print
game.containsWinningRow(blankSquare)
