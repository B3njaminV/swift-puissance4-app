import Foundation

public protocol Player{
    
    var id: Int { get set }
    var name: String { get set }
    var board: Board { get set }
    
    func play() -> Int
    
}
