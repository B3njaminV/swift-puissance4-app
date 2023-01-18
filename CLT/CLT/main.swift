//
//  main.swift
//  CLT
//
//  Created by Benjamin on 16/01/2023.
//

import Foundation
import puissance4

func insertPiece(id:Int, column:Int, b: inout Board)
    let result = board.insertPiece(id: id, column: column)
    switch result{
    case .ok:
        print("OK")
    case .failed(let reason):
        switch reason{
        case .columnFull:
            print("Column \(column) is full")
        case .boardFull:
            print("Board \(columnà) is full")
        case .unknown:
            print("Unknown")
        }
    default:
        print("Rien")
    }
}
if var board = Board(withGrid: [[1,2,1], [2,1,nil], [nil,nil,nil]]){
    print(board)
    insertPiece(id: 1, column: 0, &board)
    insertPiece(id: 1, column: 0, &board)
    insertPiece(id: 1, column: 0, &board)
    insertPiece(id: 1, column: 0, &board)
    insertPiece(id: 1, column: 0, &board)
}
