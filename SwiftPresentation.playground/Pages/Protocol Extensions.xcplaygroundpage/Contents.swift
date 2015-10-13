import Foundation
//: ## Protocol Extension
//: Neben Klassen, Structs und Enums lassen sich auch Protokolle um Implementierungen erweitern (*default implemenation*).

protocol Hello {
    func sayHello() -> String
}

extension Hello {
    func sayHello() -> String {
        return "Hello, stranger"
    }
}

class MyClass: Hello {
    func sayHello() -> String {
        return ""
    }
}


let c = MyClass()
c.sayHello()

//: Damit lassen sich Traits (bwz. Mixins) realisieren.
//: ### Ein Beispiel: Ruby Enumerables
//: Wenn man in Ruby das `Enumerable` Interface implementiert und damit `each()` bereitstellt, erhält man einen ganzen Sack voller Hilfsoperationen dazu: `map(), group_by(), find_all(), drop_if()`
//: Wie lässt sich das in Swift realisieren?

protocol Enumerable {
    typealias Element // Der typealias übernimmt hier die Rolle eines Generics. Generics sind noch nicht bis in die Protocols durchgezogen :(
    func each(block: (Self.Element) -> Void) //Das große Self, ist der implementierende Typ
}

//: Hilfsmethoden als Extension bereitstellen:
extension Enumerable {
    func dropIf(predicate: (Self.Element) -> Bool) -> [Self.Element] {
        var result = [Element]()
        each { item in if !predicate(item) { result.append(item) } }
        return result
    }
    
    //    func dropWhile(predicate: (Self.Element) -> Bool) -> [Self.Element] {
    //        ...
    //    }
    //
    //    func findAll(predicate: (Self.Element) -> Bool) -> [Self.Element] {
    //        ...
    //    }
    
    /* many more methods here */
}

struct Family {
    let name = "Smith"
    let father = "Bob"
    let mother = "Alice"
    let child = "Carol"
}

//Protokoll Implementierungen werden oft als Extension realisiert, um die Implementierungen zu gruppieren
extension Family : Enumerable {
    func each(block: (String) -> Void) {
        for i in 0...2 {
            switch i {
            case 0: block("\(self.father) \(self.name)")
            case 1: block("\(self.mother) \(self.name)")
            case 2: block("\(self.child) \(self.name)")
            default: break
            }
        }
    }
}

let f = Family()
let withoutBob = f.dropIf { p in p.hasPrefix("Bob") }
withoutBob

//: [Zurück](@previous) | [Weiter](@next)
