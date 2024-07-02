import UIKit

//피카츄, 파이리, 꼬부기

let pokemons: [String] = ["피카츄", "파이리", "꼬부기"]

//피카츄, No. 25, 전기 속성
//파이리, No. 4, 불꽃 속성
//꼬부기, No. 7, 물 속성

//기본타입: Character, String, Int, Double, Bool

class Poketmon {
    var 이름: String = ""
    var 번호: Int = 0
    var 속성: String = ""
}

var 포켓몬 = Poketmon()
포켓몬.이름 = "피카츄"
포켓몬.번호 = 25
포켓몬.속성 = "전기"

print("이름:", 포켓몬.이름)
print("번호:", 포켓몬.번호)
print("속성:", 포켓몬.속성)

//class Student {
//    var name: String
//    var grade: Int
//
//    init(이름: String, 학년: Int) {
//        name = 이름
//        grade = 학년
//    }
//}

//let 학생1 = Student(이름: "엘사", 학년: 5)
//print("학생의 이름:", 학생1.name)
//print("학생의 학년:", 학생1.grade)

class Student {
    var name: String
    var grade: Int

    init(name: String, grade: Int) {
        self.name = name
        self.grade = grade
    }
}


let 학생2 = Student(name: "엘사", grade: 5)
print("학생의 이름:", 학생2.name)
print("학생의 학년:", 학생2.grade)

print("----------------------------------")

//피카츄, No. 25, 전기 속성
//파이리, No. 4, 불꽃 속성
//꼬부기, No. 7, 물 속성

class PocketMonster {
    var name: String
    var number: Int
    var type: String
    
    init(name: String, number: Int, type: String) {
        self.name = name
        self.number = number
        self.type = type
    }
}

var pikachu = PocketMonster(name: "피카츄", number: 25, type: "전기")
var charmander = PocketMonster(name: "파이리", number: 4, type: "불꽃")
var squirtle = PocketMonster(name: "꼬부기", number: 7, type: "물")

var pocketMonsters = [pikachu, charmander, squirtle]

for pokemon in pocketMonsters {
    print("내 이름은 \(pokemon.name)야")
    print("나는 \(pokemon.number)번이고, \(pokemon.type) 속성이야")
}
