import Foundation

public class Human{

    let id: Int
    let nom: String
    
    public init?(withId id : Int, andName nom : String = ""){
        self.id = id
        self.nom = nom
    }    
}
