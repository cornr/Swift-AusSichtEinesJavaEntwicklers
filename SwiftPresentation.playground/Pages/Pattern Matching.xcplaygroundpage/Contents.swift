import Foundation
//: ## Pattern Matching
//: Pattern Matching ist eine Erweitung der Conditions die sich auf `switch, ifs, for .. in` anwenden lässt.

enum Animal {
    case Dog, Cat, Troll, Dragon
}

for animal: Animal in [.Dog, .Cat, .Troll] where animal == .Dog {
    print(animal)
}

//Union-Typ
enum Either<T1, T2> {
    case First(T1)
    case Second(T2)
}
// Union für Alternative Ergebnisse einer Funktion
func test() -> Either<Animal, String> {
    return Either.First(.Dog)
}

let either = test()

switch either {
    case .First(let animal):
        print(animal)
    case .Second(let string):
        print("nothing heere")
}

if case .First(let animal) = either where animal == .Dog {
    print("test")
}

//: [Zurück](@previous) | [Weiter](@next)

