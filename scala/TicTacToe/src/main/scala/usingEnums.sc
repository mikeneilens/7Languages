//import java.awt.print.Printable

class Square(val content:String)

object ColId extends Enumeration {
    type ColId = Value
    val _1, _2, _3 = Value
}
object RowId extends Enumeration {
    type RowId = Value
    val _1, _2, _3 = Value
}

class Row(val square:(Square, Square, Square)) {

    def updateSquare(x:ColId.ColId, newSquare:Square) :Row = x match {
        case ColId._1 => new Row((newSquare, this.square._2, this.square._3) )
        case ColId._2 => new Row((this.square._1, newSquare, this.square._3) )
        case ColId._3 => new Row((this.square._1, this.square._2, newSquare) )
    }

    def printSelf(): Unit = {
        println(square._1.content + "|" + square._2.content + "|" + square._3.content)
    }

    def isWinningRow(blankSquare:Square)  :Boolean = {
        (square._1 != blankSquare) & (square._1 == square._2) & (square._1 == square._3)

    }
}

class Board(val row:(Row,Row,Row)) {

    def updateSquare(x:ColId.ColId, y:RowId.RowId, newSquare:Square ) :Board = y match {
        case RowId._1 => new Board( (this.row._1.updateSquare(x,newSquare), this.row._2, this.row._3 ))
        case RowId._2 => new Board( (this.row._1, this.row._2.updateSquare(x,newSquare), this.row._3 ))
        case RowId._3 => new Board( (this.row._1, this.row._2, this.row._3.updateSquare(x,newSquare) ))
    }

    def printSelf() {
        row._1.printSelf()
        row._2.printSelf()
        row._3.printSelf()
    }

    def reset(square:Square): Board = {
        new Board(new Row((square, square, square)),new Row((square, square, square)),new Row((square, square, square)))
    }

    def col1 = new Row(row._1.square._1,row._2.square._1,row._3.square._1)
    def col2 = new Row(row._1.square._2,row._2.square._2,row._3.square._2)
    def col3 = new Row(row._1.square._3,row._2.square._3,row._3.square._3)

    def diagonal1 = new Row(row._1.square._1,row._2.square._2,row._3.square._3)
    def diagonal2 = new Row(row._1.square._3,row._2.square._2,row._3.square._1)
}

class Game(val blankSquare:Square, xSquare:Square, oSquare:Square)  {

    var board = new Board(new Row((blankSquare, blankSquare, blankSquare)),new Row((blankSquare, blankSquare, blankSquare)),new Row((blankSquare, blankSquare, blankSquare)))

    def placeX(x:ColId.ColId, y:RowId.RowId) {
        updateSquare(x,y, xSquare)
    }
    def placeO(x:ColId.ColId, y:RowId.RowId) {
        updateSquare(x,y, oSquare)
    }
    def updateSquare(x:ColId.ColId, y:RowId.RowId, newSquare:Square ) {
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
game.placeO(ColId._1,RowId._1)
game.placeX(ColId._2,RowId._2)
game.placeO(ColId._2,RowId._3)
game.placeX(ColId._3,RowId._3)
game.print()

println("Test resetting the game")
game.reset()
game.print()

println("Test empty board doesn't contain a winner")
game.containsWinningRow(blankSquare)

println("Test first row all Xs is a winner")
game.updateSquare(ColId._1,RowId._1,XSquare)
game.updateSquare(ColId._2,RowId._1,XSquare)
game.updateSquare(ColId._3,RowId._1,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test second row all Xs is a winner")
game.reset()
game.updateSquare(ColId._1,RowId._2,XSquare)
game.updateSquare(ColId._2,RowId._2,XSquare)
game.updateSquare(ColId._3,RowId._2,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test third row all Xs is a winner")
game.reset()
game.updateSquare(ColId._1,RowId._3,XSquare)
game.updateSquare(ColId._2,RowId._3,XSquare)
game.updateSquare(ColId._3,RowId._3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test first column all Xs is a winner")
game.reset()
game.updateSquare(ColId._1,RowId._1,XSquare)
game.updateSquare(ColId._1,RowId._2,XSquare)
game.updateSquare(ColId._1,RowId._3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test second col all Xs is a winner")
game.reset()
game.updateSquare(ColId._2,RowId._1,XSquare)
game.updateSquare(ColId._2,RowId._2,XSquare)
game.updateSquare(ColId._2,RowId._3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test third col all Xs is a winner")
game.reset()
game.updateSquare(ColId._3,RowId._1,XSquare)
game.updateSquare(ColId._3,RowId._2,XSquare)
game.updateSquare(ColId._3,RowId._3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test right-to-left diagonal all Xs is a winner")
game.reset()
game.updateSquare(ColId._1,RowId._1,XSquare)
game.updateSquare(ColId._2,RowId._2,XSquare)
game.updateSquare(ColId._3,RowId._3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test left-to-right diagonal all Xs is a winner")
game.reset()
game.updateSquare(ColId._3,RowId._1,XSquare)
game.updateSquare(ColId._2,RowId._2,XSquare)
game.updateSquare(ColId._1,RowId._3,XSquare)
game.print()
game.containsWinningRow(blankSquare)

println("Test left-to-right diagonal all Xs and Os in centre is not a winner")
game.reset()
game.updateSquare(ColId._3,RowId._1,XSquare)
game.updateSquare(ColId._2,RowId._2,OSquare)
game.updateSquare(ColId._1,RowId._3,XSquare)
game.print()
game.containsWinningRow(blankSquare)
