import Foundation
//: ## Protocols and Extensions
//:
//: `protocol` die swiftsche Schnittstelle
//:
protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}

//: Classes, enumerations und structs können alle Protokolle implementieren.
//:
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//: Das `mutating` keyword kennzeichnet Methoden, die Structures verändern.

//: Mit `extension` kann man vorhandenen Typen Funktionalität hinzufügen.
//:
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
 }
print(7.simpleDescription)


//: Refernzen auf Schnittstellen, verbergen den dahinterliegenden Typen, ganz wie in Java.
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)  // Fehler

//: [Zurück](@previous) | [Weiter](@next)

