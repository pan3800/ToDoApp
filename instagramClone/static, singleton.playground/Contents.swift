import UIKit

//static

class Car {
    var carname = "포르쉐"
    func printCarname() {
        print("차 이름은 \(carname)입니다.")
    }
    
    static var carBrand = ["현대", "포르쉐", "테슬라"]
    static func randomBrand() {
        let brand = carBrand.randomElement()
        print("랜덤으로 고른 브랜드:", brand)
    }
}

let car = Car()
car.carname
car.printCarname()

Car.carBrand
Car.randomBrand()

//Singleton

class Person {
    var username = "엘사"
}

let person1 = Person()
person1.username = "피카츄"
print(person1.username)

let person2 = Person()
print(person2.username)

class Dog {
    var name = "멍멍이"
    static let shared = Dog()
}

let dog1 = Dog.shared
dog1.name = "야옹이"

let dog2 = Dog.shared
print(dog2.name)

