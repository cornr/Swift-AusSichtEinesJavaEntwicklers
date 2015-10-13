import Foundation
//: ## Enumerations and Structures
//:
//: Enums können wie jeder benannte Typ Funktionen haben.
//: Über einen "super"-Typ lassen sich Raw-Values festlegen. Im Beispiel Integer beginnent bei 1, alternativ kann jeder Wert ein speziellen Raw-Value haben.
//:
enum Rank: String {
    case Ace = "Ass"
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.King
let aceRawValue = ace.rawValue

//: Über den Raw-Value lässt sich der entsprechende Enum-Wert instanziieren.
if let convertedRank = Rank(rawValue: "Assjasd") {
    let threeDescription = convertedRank.simpleDescription()
}

//: Wenn der "super"-Typ wegelassen wird, sind die Werte der Raw-Value.
//:
enum Suit: String {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
            case .Spades: //self ist vom Typ Suit, also brauch man das auch nicht hinschreiben
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()


//: `associated values`: Eine Enum-Instanz kann auch zugehörige Werte haben.
enum ServerResponse {
    case Result(sunrise: String, sunset: String)
    case Error(String)
}

let success = ServerResponse.Result(sunrise: "6:00 am", sunset: "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
    case let .Result(sunrise, sunset):
        let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    case let .Error(error):
        let serverResponse = "Failure...  \(error)"
}

//Das funktioniert soger rerkursiv. whoa...
enum SimpleTree<T> {
    case Leaf(T)
    indirect case Node(SimpleTree, SimpleTree)
}

let leaf = SimpleTree.Leaf(1)
let tree = SimpleTree.Node(leaf, SimpleTree.Node(SimpleTree.Leaf(2), SimpleTree.Leaf(3)))


//: `struct` erstellt Structures. Fast wie Classes: mit Methods, Initializer und Properties ABER: keiner Vererbung und Call-By-Value-Semantik. Das heißt Structures werden beim "herumgeben" immer kopiert.
//:
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
}
let threeOfSpades = Card(rank: .Three, suit: .Spades) //Konstruktoren werden generiert
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


//: Structs sollten immer Equatable implementieren.
//: Denn auf Werten gilt intuitiv immer die Reflexivität, Symmertrie und Transitivität

struct MyInt: Equatable {
    var value: Int
}

func ==(lhs: MyInt, rhs: MyInt) -> Bool {
    return lhs.value == rhs.value
}


MyInt(value: 2).value
MyInt(value: 2) == MyInt(value: 2)

//Beispiel: UndoStack
var undoStack: [MyInt] = []
var model = MyInt(value: 1)
undoStack.append(model)

model.value = 2
undoStack.append(model)

model.value = 3
undoStack.append(model)

model.value = 4

model = undoStack.removeLast()
model.value
undoStack

//: [Zurück](@previous) | [Weiter](@next)

