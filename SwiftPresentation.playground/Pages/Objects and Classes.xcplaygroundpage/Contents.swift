import Foundation
//: ## Objects and Classes
//:
//: `class` für Java-Entwickler, gibt es hier nicht viel Neues.
//:
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//: Instanzen erzeugt man durch den Konstruktor-Aufruf (allerdings ohne `new`)
//:
var shape = Shape()
shape.numberOfSides = 7
//var shapeDescription = shape.simpleDescription()

//: Oben fehlte der Konstruktor (ist er leer, kann weggelassen werden).
//:
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/*:
Beachte:
* Alle properties müssen nach dem Instanziieren gesetzt sein.
* `this` heißt in Swift `self`
* `deint` als Gegenstück zum Konstruktor, kann genutzt werden um Ressourcen freizugeben. A propos: freigeben...


*/

//: ### Exkurs: Automatic Reference Counting (ARC)
//: * Es gibt keinen Garbage-Collector aus (ehemals) Speicher- und CPU-Effizienzgründen
//: * Stattdesen zählt das System Referenzen
//: * Zeigt niemand mehr auf ein Objekt, wird es sofort aufgeräumt


//: Vererbung mit `:` und Supertype. Mehrfachvererbung gibt es nicht.
//: Überschrieben von Methoden mit `override`-Schlüsselwort
//:
final class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 4
    }
    
    final func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//: *Calculated Properties* (aka getter / setter)
//:
class EquilateralTriangle: NamedShape {
    private var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            print("perimeter")
            return Double(self.numberOfSides) * sideLength
        }
        set {
            sideLength = newValue / Double(self.numberOfSides)
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
print(triangle.perimeter)
triangle.perimeter = 9.9
triangle.perimeter = 10.9
print(triangle.sideLength)

//: *Property Observer*
//:
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//: Ergänzung zu Optionals: *Optional Chaining*
//:
var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
optionalSquare = nil
optionalSquare?.simpleDescription()



//: [Zurück](@previous) | [Weiter](@next)

