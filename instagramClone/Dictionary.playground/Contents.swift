import UIKit


let array = ["aggma", "apple", "battle ground"]
print(array[0])
print(array[1])
print(array[2])

let dictionary: [String : String] = ["name": "aggma", "fruit": "apple", "game": "battle ground"]

print(dictionary["name"])
print(dictionary["fruit"])
print(dictionary["game"])


struct Person {
    let name: String
    let fruit: String
    let game: String
}

let person = Person(name: "aggma", fruit: "apple", game: "battle ground")
print(person.name)
print(person.fruit)
print(person.game)

