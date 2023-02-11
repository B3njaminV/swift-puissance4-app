import Foundation

public class Human : Player {
    
    public var id: Int
    public var name: String
    public var board: Board
    private var lecteur: Lecteur
    
   public init(withId id: Int, andName name: String, playIn board: Board, andReadWith lecteur: Lecteur){
       self.id = id
       self.name = name
       self.board = board
       self.lecteur = lecteur
    }
    
    public func play() -> Int {
        lecteur.lireEntier() ?? 0
    }
    
    
}
