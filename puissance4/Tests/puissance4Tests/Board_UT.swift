import XCTest
@testable import puissance4

final class Board_UT: XCTestCase {
    func testinit() throws {
        func expect(nbRows : Int, nbColums : Int, notNil : Bool){
            let board = Board(nbR: 6, nbC: 7)
            if !notNil{
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(board?.nbRows, 6)
            XCTAssertEqual(board?.nbColums, 7)
        }
        expect(nbRows: 6, nbColums: 7, notNil: true)
        expect(nbRows: 0, nbColums: 7, notNil: false)
        expect(nbRows: 6, nbColums: 0, notNil: false)
        expect(nbRows: 0, nbColums: 0, notNil: false)
    }
}
