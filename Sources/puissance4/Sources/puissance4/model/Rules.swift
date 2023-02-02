import Foundation

protocol Rules {
    
    static var minNbRows: Int { get }
    static var maxNbRows: Int { get }
    
    static var minNbCols : Int { get }
    static var maxNbCols : Int { get }
    
    static var nbAlignePiece : Int { get }
    
}
