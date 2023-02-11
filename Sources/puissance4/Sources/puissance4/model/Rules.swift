import Foundation

public protocol Rules {
    
    static var minRow: Int { get }
    static var minCol: Int { get }
    static var nbToWin: Int { get }

    func verifGagnant(in board: inout Board) -> Bool
    func gameOver(in board: inout Board) -> Bool

}
