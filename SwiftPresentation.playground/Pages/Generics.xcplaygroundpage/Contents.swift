import Foundation
//: ## Generics
//:
//: Generics sind für Java-Entwickler nichts Neues.
//:
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes { //_ wird als Platzhalter für Werte verwendet, die gar nicht benötigt werden
         result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes:4)

//: Sie funktionieren für Funktionen, Methoden, Klassen, Enumerationen und Strukturen.
//:
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

//: Mit der `where`-Klausel lassen sich Typen weiter einschränken.
//:
func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
anyCommonElements([1, 2, 3], [3])


//: [Zurück](@previous) | [Weiter](@next)

