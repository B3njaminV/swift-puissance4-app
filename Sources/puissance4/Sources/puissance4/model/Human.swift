import Foundation

public class Human : Player {
    
    public var id: Int
    public var name: String
    public var board: Board
    private var lecteur: Lecteur

    /// Initialise un joueur humain
    /// - Parameters:
    ///   - id: Id du joueur 1 ou 2
    ///   - name: pseudo du joueur
    ///   - board: tableau de jeu
    ///   - lecteur: lecteur pour lire les entrées clavier
    public init(withId id: Int, andName name: String, playIn board: Board, andReadWith lecteur: Lecteur){
       self.id = id
       self.name = name
       self.board = board
       self.lecteur = lecteur
    }

    /// Joue un tour
    /// - Returns:
    ///    - Int : numéro de la colonne jouée
    public func play() -> Int {
        lecteur.lireEntier() ?? 0
    }
    
    
}
