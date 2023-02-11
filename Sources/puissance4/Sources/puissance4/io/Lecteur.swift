import Foundation

public class Lecteur {
    
    public init() {}
    
    public func lireEntier() -> Int?{
        if let ligne = readLine() {
            return Int(ligne)
        } else {
            return -1
        }
    }
    
    public func lireString() -> String? {
        readLine()
    }
}
