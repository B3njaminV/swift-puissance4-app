import Foundation
import puissance4

func insertPieceInBoard(id:Int, column:Int, b: inout Board){
    let result = b.insertPiece(id: id, column: column)
    switch result{
    case .ok:
        print("OK")
    case .failed(let reason):
        switch (reason){
        case .columnFull:
            print("Column \(column) is full")
        case .boardFull:
            print("Board is full")
        case .columnNil:
            print("Column \(column) is nil")
        case .outOfBounds:
            print("Column \(column) is out of bounds")
        case .unknown:
            print("Unknown")
        }
    default:
        print("Other")
    }
}

if var board = Board(nbR: 6, nbC: 7){
    insertPieceInBoard(id: 1, column: 1, b: &board)
    insertPieceInBoard(id: 2, column: 2, b: &board)
    insertPieceInBoard(id: 1, column: 2, b: &board)
    insertPieceInBoard(id: 2, column: 1, b: &board)
    insertPieceInBoard(id: 2, column: 2, b: &board)
    insertPieceInBoard(id: 2, column: 0, b: &board)
    insertPieceInBoard(id: 2, column: 3, b: &board)
    insertPieceInBoard(id: 1, column: 3, b: &board)
    insertPieceInBoard(id: 2, column: 3, b: &board)
    insertPieceInBoard(id: 2, column: 3, b: &board)
    print(board)
}

