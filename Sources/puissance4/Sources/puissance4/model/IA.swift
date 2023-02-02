import Foundation

public class IA: Player {
    
    public var id: Int
    public var name: String
    public var board: Board
    
    public init(withId id: Int, andName name: String, playIn board: Board){
        self.id = id
        self.name = name
        self.board = board
     }
    
    public func play() -> Int {
        Int.random(in: 0..<(board.nbColums))
    }
    
    
}
