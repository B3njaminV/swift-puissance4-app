import Foundation

public class ClassicRules : Rules {

    public static var minRow: Int = 6

    public static var minCol: Int = 5

    public static var nbToWin: Int = 4

    /// Initialise les règles du jeu
    /// - Parameter board:
    ///  - Board : tableau de jeu
    public init?(inBoard board : inout Board) {
        guard board.nbRows >= ClassicRules.minRow && board.nbColums >= ClassicRules.minCol else {
            return nil
        }
    }

    /// Vérifie si un joueur a gagné
    /// - Parameter board:
    /// - Board : tableau de jeu
    /// - Returns:
    /// - Bool : true si un joueur a gagné
    public func verifGagnant(in board: inout Board) -> Bool {
        var nbJetonsAlignes = 0
        var jeton = 0
        // Vérif colonnes
        for column in 0..<board.nbColums{
            for row in 0..<board.nbRows{
                if(board.grid[row][column] != nil){
                    if(jeton == board.grid[row][column]!){
                        nbJetonsAlignes += 1
                    }else{
                        jeton = board.grid[row][column]!
                        nbJetonsAlignes = 1
                    }
                }else{
                    nbJetonsAlignes = 0
                }
                if(nbJetonsAlignes == ClassicRules.nbToWin){
                    return true
                }
            }
        }
        // Vérif lignes
        for row in 0..<board.nbRows{
            for column in 0..<board.nbColums{
                if(board.grid[row][column] != nil){
                    if(jeton == board.grid[row][column]!){
                        nbJetonsAlignes += 1
                    }else{
                        jeton = board.grid[row][column]!
                        nbJetonsAlignes = 1
                    }
                }else{
                    nbJetonsAlignes = 0
                }
                if(nbJetonsAlignes == ClassicRules.nbToWin){
                    return true
                }
            }
        }
        return false
    }
}
