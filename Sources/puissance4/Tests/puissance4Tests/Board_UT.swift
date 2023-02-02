import XCTest
@testable import puissance4

final class Board_UT: XCTestCase {
    func testInitAvecParam() throws {
        func expect(nbRows : Int, nbColums : Int, notNil : Bool){
            let board = Board(nbR: nbRows, nbC: nbColums)
            if !notNil{
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(board?.nbRows, nbRows)
            XCTAssertEqual(board?.nbColums, nbColums)
        }
        expect(nbRows: 6, nbColums: 7, notNil: true)
        expect(nbRows: 0, nbColums: 7, notNil: false)
        expect(nbRows: 6, nbColums: 0, notNil: false)
        expect(nbRows: 0, nbColums: 0, notNil: false)
    }

    func testInitAvecGrid() throws {
        func expect(grid : [[Int?]], notNil : Bool){
            let board = Board(withGrid: grid)
            if !notNil{
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(board?.nbRows, board?.grid.count)
            XCTAssertEqual(board?.nbColums, board?.grid[0].count)
        }
        expect(grid: [[], []], notNil: true)
        expect(grid: [[nil, nil, nil], [nil, nil, nil], [nil, 1, 2]], notNil: true)
    }

    func testFull() throws {
        func expect(grid : [[Int?]], notNil : Bool){
            let board = Board(withGrid: grid)
            if !notNil {
                XCTAssertTrue(board!.isFull())
            } else {
                XCTAssertFalse(board!.isFull())
            }
        }
        expect(grid: [[1, 1, 2], [2, 2, 1], [2, 1, 2]], notNil: false)
    }
}
