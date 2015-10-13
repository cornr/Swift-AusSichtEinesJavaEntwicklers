import Foundation
//: ## Control Flow
//: Wie soll es anders sein: `if`, `switch` für Bedingungen und `for`-`in`, `for`, `while`, `repeat`-`while` für Loops. Runde Klammern sind optional, Geschweifte sind pflicht. 😀
//:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//: ### Exkurs: `Optionals`❓❗️ByeBye NullPointerException...
//: Variablen die optional (sprich `nil`, aka null) sein können, müssen mit einem ? markiert werden
var optionalString: String? = "ssd"
print(optionalString == nil)

var optionalName: String? = "Jonas"
var greeting = "Hello!"
//if let packt ein "Optional" aus
if let name = optionalName {
    greeting = "Hello, \(name)"
}

//: `if let` von `nil` wertet sich zu `false` und wird damit nicht ausgeführt.

//: Switches funktionieren über alle einfachen Datentypen und müssen "exhaustive" sein, d.h. alle möglichen Werte berücksichtigen. `break` ist optional.
//:
let vegetable = "green pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

//:
//: `for`-`in` im Detail.
//: Dictionaries sind im übrigen unsortiert.
//:
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//:
//: Mehr Beispiele:
//:
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat { //repeat hieß mal 'do', dazu später mehr
    m = m * 2
} while m < 100
print(m)

//: `..<` erzeugt Range exclusiv
//: `...` erzeugt Range inclusiv
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += i
}
print(secondForLoop)

//: [Zurück](@previous) | [Weiter](@next)
