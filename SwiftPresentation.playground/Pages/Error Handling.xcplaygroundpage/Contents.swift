import Foundation
//: ## Error Handling
//: Bis Swift 2 gab es faktisch kein Error Handling bzw. das von Objective-C wurde kopiert:

func loadData(inout error: NSError?) -> Bool {
    //load data and eventually create an error:
    error = NSError(domain: "myDomain", code: 4711, userInfo: nil)
    return false //Konvention: Wenn false dann ist ErrorPointer gesetzt
}

var error: NSError?
if !loadData(&error) {
    if let error = error {
        print(error)
    }
}

//: Alternativ wird auch gerne in Konstruktoren `nil` geliefert.
class Person {
    let name: String
    init?(optionalName: String?) {
        if let name = optionalName {
            if name.characters.count > 0 && name.characters.count < 10 {
                self.name = name
                return
            }
        }
        self.name = "wtf?"
        return nil
    }
}
let person = Person(optionalName: "Test")?.name
let noPerson1 = Person(optionalName: "")?.name
let noPerson2 = Person(optionalName: nil)

//: Gott-Sei-Dank macht Swift 2 einiges besser.
enum PersonError: ErrorType {
    case NoName
    case NameToLong(String)
}

extension Person {
    class func createPerson(name name: String?) throws -> Person {
        if let name = name {
            if let person = Person(optionalName: name) {
                return person
            } else {
                throw PersonError.NameToLong(name)
            }
        } else {
            throw PersonError.NoName
        }
    }
}

do {
    let name = "namezulaaaaaaang"
    let person2 = try Person.createPerson(name: name)
} catch PersonError.NoName {
    print("kein Name angegeben")
} catch PersonError.NameToLong(let name) {
    print("\(name) hat mehr als 10 Zeichen.")
} catch let error {
    print("some Error \(error)")
}

//: ### Guard Statement - no more Pyramid of Doom
class ProperPerson {
    let name: String
    
    init(name: String?) throws {
        guard let name = name else {
            self.name = ""
            throw PersonError.NoName
        }
        guard name.characters.count > 0 && name.characters.count < 10 else {
            self.name = ""
            throw PersonError.NameToLong(name)
        }
        
        self.name = name
    }
}


//: [Zurück](@previous) | [Weiter](@next)

