import Foundation

public class IA: Player {
    
    public var id: Int
    public var name: String
    public var board: Board

    /// Initialise un joueur IA
    /// - Parameters:
    ///   - id: id du joueur
    ///   - name: pseudo de l'ia
    ///   - board: tableau de jeu
    public init(withId id: Int, andName name: String, playIn board: Board){
        self.id = id
        self.name = name
        self.board = board
    }

    /// Joue un tour
    /// - Returns:
    ///   - Int : numéro random de la colonne jouée
    public func play() -> Int {
        Int.random(in: 0..<(board.nbColums))
    }
    
    
}
