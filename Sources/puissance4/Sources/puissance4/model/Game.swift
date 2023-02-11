import Foundation

public struct Game {
    
    private var board: Board
    private var players: [Player]   // tableau de players
    public var numeroJoueur: Int = 0
    private var afficheur: Afficheur
    private var winner: Player?
    private var rules : Rules

    ///
    /// - Parameters:
    ///   - board: Board puissance 4
    ///   - players: Tableau de joueurs
    ///   - afficheur: Afficheur pour afficher les différents messages
    ///   - rules: Règles appliquées au jeu
    public init(withBoard board: inout Board, playWith players: [Player], display afficheur: Afficheur, andRules rules : Rules) {
        self.board = board
        self.players = players
        self.afficheur = afficheur
        self.rules = rules
    }

    /// Joue un tour
    public mutating func tour(){
        let playerCourant = players[numeroJoueur]
        var boardResult = BoardResult.unknown
        var win : Bool
        while(boardResult != BoardResult.ok){
            afficheur.afficher(withTxt: "\(playerCourant.name) -> Colonne :")
            boardResult = board.insertPiece(id: playerCourant.id, column: playerCourant.play())
        }
        win = rules.verifGagnant(in: &board)
        afficheur.afficher(withTxt: board.description)
        checkGagnant(isWin: win)
        joueurSuivant()
    }

    /// Change le joueur actif
    public mutating func joueurSuivant() {
        numeroJoueur = (numeroJoueur + 1) % players.count
    }

    /// Retourne le joueur gagnant
    public func getWinner() -> Player? {
        winner;
    }

    /// Retourne le numéro du joueur actif
    public func getNumeroJoueurActif() -> Int {
        numeroJoueur;
    }

    /// Permet de mettre à jour le gagnant suivant la vérif des règles
    public mutating func checkGagnant(isWin win : Bool) {
        if win {
            winner = players[numeroJoueur]
            afficheur.afficher(withTxt: "Gagnant : \(String(describing: winner!.name) )")
        }
    }



}
