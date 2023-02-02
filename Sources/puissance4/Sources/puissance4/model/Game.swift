import Foundation

public struct Game {
    
    private var board: Board
    private var players: [Player]   // tableau de players
    private var numeroJoueur: Int = 0
    private var afficheur: Afficheur
    private var winner: Player?
    
    public init?(withBoard board: Board, playWith players: [Player], display afficheur: Afficheur) {
        self.board = board
        self.players = players
        self.afficheur = afficheur
    }
    
    public mutating func tour(){
        let playerCourant = players[numeroJoueur]
        var boardResult = BoardResult.unknown
        while(boardResult != BoardResult.ok){
            afficheur.afficher(withTxt: "\(playerCourant.name) -> Colonne :")
            boardResult = board.insertPiece(id: playerCourant.id, column: playerCourant.play())
        }
        joueurSuivant();
        afficheur.afficher(withTxt: board.description)
    }
        
    public mutating func joueurSuivant() {
        numeroJoueur = (numeroJoueur + 1) % players.count
    }
        
    public func getWinner() -> Player? {
        return winner;
    }
}
