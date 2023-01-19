//
//  main.swift
//  CLT
//
//  Created by Benjamin on 16/01/2023.
//

import Foundation
import puissance4

func insertPiece(id:Int, column:Int, b: inout Board){
    let result = b.insertPiece(id: id, column: column)
    switch result{
    case .ok:
        print("OK")
    case .failed(let reason):
        switch reason{
        case .columnFull:
            print("Column \(column) is full")
        case .boardFull:
            print("Board \(column) is full")
        case .unknown:
            print("Unknown")
        }
    default:
        print("Rien")
    }
}
if var board = Board(withGrid: [[nil,nil,nil,nil,nil], [nil,nil,nil,nil,nil], [nil,nil,nil,nil,nil], [nil,nil,nil,nil,nil], [nil,nil,nil,nil,nil]]){
    print(board)
    insertPiece(id: 1, column: 1, b: &board)
    insertPiece(id: 1, column: 2, b: &board)
    insertPiece(id: 2, column: 4, b: &board)
    print(board)
}
