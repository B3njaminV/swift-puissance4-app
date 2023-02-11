import Foundation

public class ClassicRules : Rules {

    public static var minRow: Int = 6

    static var minCol: Int = 5

    static var nbToWin: Int = 4

    public init?(inBoard board : inout Board) {
        if(board.nbRows >= ClassicRules.minRow && board.nbColums >= ClassicRules.minCol){
            return nil
        }
    }

    func verifGagnant(in board: inout Board) -> Bool {
        var nbJetonsAlignes = 0
        var jeton = 0
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
        return false
    }

    func gameOver(in board: inout Board) -> Bool {
        board.isFull()
    }


}
