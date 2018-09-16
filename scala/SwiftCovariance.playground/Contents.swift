//: Playground - noun: a place where people can play

import UIKit

class Animal {
    let age:Int
    init(age:Int) {
        self.age = age
    }
}

class Dog:Animal {
    var name:String
    init (age:Int, name:String) {
        self.name = name
        super.init(age: age)
    }
}
class Cat:Animal {
    var name:String
    init (age:Int, name:String) {
        self.name = name
        super.init(age: age)
    }
}

class GreatDane:Dog {
}

func getAnimalAge(animal:Animal) -> Int {
    return animal.age
}

func getGreatDaneAge(greatDane:GreatDane) -> Int {
    return greatDane.age
}

func createAnimal() -> Animal  {
    return Animal(age:10)
}

func createGreatDane() -> GreatDane  {
    return GreatDane(age:10, name:"Rover")
}

let fido = Dog(age:4,name:"Fido")
let marmaduke = GreatDane(age:7,name:"Marmaduke")

//How do I to get the age of Fido
getAnimalAge(animal:fido) // works because Fido is an Animal. ie the argument can be a super type (contravariant)

//getGreatDaneAge(fido) // fails because Fido is a Dog but not necessarily a GreatDane

//How do I create a dog?
let myDog:Dog = createGreatDane() //this works because a GreatDane is a kind of Dog. ie the result can be a sub type (covariant)
//let myDog:Dog = createAnimal() //this fails because an Animal is not necessarily a Dog

//You can create an immutable list of animals using a list of dogs. ie covariant
let dogList:Array<Dog> = [fido, marmaduke]
let list:Array<Animal> = dogList
list[1] // element 1 is still a GreatDane

//You can create a mutable list of animals using a list of dogs. i.e. is not invariant
var dogMutableList:Array<Dog> = [fido, marmaduke]
var mutablelist:Array<Animal> = dogMutableList
let snowball = Cat(age:7, name:"Snowball")
mutablelist.append(snowball)
dogMutableList

