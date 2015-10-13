import Foundation
//: ## Simple Values
//: Variablen und Konstanten
var myVariable = 42
myVariable = 50
let myConstant = 42

/*:
Die Typen werden automatisch bestimmt. (*type inference*)

Zu jedem Zeitpunkt ist klar welcher Typ eine Variable hat. Eine Variable kann ihren Typ nicht mehr ändern. (*strongly typed*)
*/
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//: Typen werden nicht automatisch "konvertiert".
//:
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//: Noch einfach geht es mit String Interpolation
//:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//: ### Arrays und Dictionaries
//: (vgl. List und Array, sowie Maps und Sets)
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[0] = "bottle of water"

var occupations = [
    "Malcolm": [1 : 2],
    "Kaylee": "asd",
 ]
occupations["Jayne"] = "Public Relations"

//: Leere Arrays oder Dictionaries lassen sich über die Konstruktor-Syntax erstellen.
let emptyArray = [String]()
let emptyArray2: [String] = []
let emptyDictionary = [String: Float]()

//: Wie fast überall gilt: wenn der Typ klar ist, na dann kann man in auch weglassen.
shoppingList = []
occupations = [:]

//: Unsortierte Mengen. Achtung: Typangabe ist hier Pflicht.
//: Zu Generics später mehr...
var numbers: Set<Int> = [1, 2, 3, 5, 5, 5]

//: [Zurück](@previous) | [Weiter](@next)