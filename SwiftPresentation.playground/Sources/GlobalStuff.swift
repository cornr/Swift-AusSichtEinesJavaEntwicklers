import Foundation

public enum ProgrammingLanguage {
    case ObjectiveC, Rust, Haskell, Ruby, Python, CSharp, CLU, Java
    case Swift
}

public func createAwesomeProgrammingLanguge(buildOn languages: Set<ProgrammingLanguage>) -> ProgrammingLanguage {
    for language in languages {
        print("Take best features of: \(language)")
    }
    return .Swift
}