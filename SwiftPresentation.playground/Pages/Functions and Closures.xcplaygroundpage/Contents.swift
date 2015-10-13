import Foundation
//: ## Functions and Closures
//: `func` für Funktionen. Die Typen stehen wie in der Variablen-Deklaration hinter dem Namen. Hinter `->` kommt der Rückgabetyp. `->` ist optional, wenn die Funktion keinen Rückgabetyp hat.
//: Parameter können auch Default-Werte haben.
func greet(name name: String, tag day: String = "Wednesday") -> String {
    return "Hello \(name), today is \(day)."
}
greet(name: "Bob", tag: "Tuesday")
greet(name: "Tobi")

/*:
### Exkurs: Tupel
Tupel sind zusammengefasste Werte zu einem anonymen Typen. Die Werte können benannt werden.
Wenn man genau hin sieht, ist die Parameterdefinition einer Funktion eine Tupeldefinition. Der Aufruf einer Funktion ist die Instanz des Tupels.
*/
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.0)

//: Implizite Arrays in Funktionsaufrufen
//:
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

//: Funktionen kann man auch verschachteln (muss man aber nicht).
//:
func add() -> String {
    return ""
}

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}


returnFifteen()

//: Funktionen sind first-class types.
//:
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//: Dann lass uns mal Funktionen weiterreichen.
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)

//: Funktionen sind benannte Closures. Es geht auch ohne Namen...
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

//: Wenn ein closures-Typ bereits klar ist, kann man die Parameter und die Rückgabetyp-Definition weglassen. Bei Einzeilern kann auch das `return` weg.
//:
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//: Noch kürzer und abgefahrener...
//:

let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)



//: [Zurück](@previous) | [Weiter](@next)

