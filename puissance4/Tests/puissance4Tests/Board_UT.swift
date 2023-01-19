import XCTest
@testable import puissance4

final class Board_UT: XCTestCase {
    func testinit() throws {
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
}
