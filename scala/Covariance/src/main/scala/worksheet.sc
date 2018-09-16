class Animal(var age:Int)

class Dog( age:Int, val name:String) extends Animal(age) {
}
class Cat( age:Int, val name:String) extends Animal(age) {
}

class GreatDane( age:Int, name:String) extends Dog(age, name)

def getAnimalAge(animal:Animal): Int = {
    animal.age
}

def getGreatDaneAge(greatDane:GreatDane): Int = {
    greatDane.age
}

def createAnimal() : Animal = {
    new Animal(10)
}

def createGreatDane() : GreatDane = {
    new GreatDane(10, "Rover")
}

val fido = new Dog(4,"Fido")
val marmaduke = new GreatDane(7,"Marmaduke")

//How do I to get the age of Fido
getAnimalAge(fido) // works because Fido is an Animal. ie the argument can be a super type (contravariant)

//getGreatDaneAge(fido) // fails because Fido is a Dog but not necessarily a GreatDane

//How do I create a dog?
val myDog:Dog = createGreatDane() //this works because a GreatDane is a kind of Dog. ie the result can be a sub type (covariant)
//val myDog:Dog = createAnimal() //this fails because an Animal is not necessarily a Dog

//You can create an immutable list of animals using a list of dogs. ie covariant
val dogList:List[Dog] = List(fido, marmaduke)
val list:List[Animal] = dogList
list(1) // element 1 is still a GreatDane

import scala.collection.mutable.ListBuffer //Scala mutable list

//You cannot create a mutable list of animals using a list of dogs. i.e. invariant
val dogMutableList:ListBuffer[Dog] = ListBuffer(fido, marmaduke)
//val mutablelist:ListBuffer[Animal] = dogMutableList

