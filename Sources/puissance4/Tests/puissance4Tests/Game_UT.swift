import XCTest
@testable import puissance4

final class Game_UT: XCTestCase {
    func testInit() throws {
        let board = Board(nbR: 5, nbC: 8)!
        XCTAssertNotNil(board)
        let lecteur = Lecteur()
        XCTAssertNotNil(lecteur)
        let afficheur = Afficheur()
        XCTAssertNotNil(afficheur)
        let player1 = Human(withId: 1, andName: "Joueur 1", playIn: board, andReadWith: lecteur)
        XCTAssertNotNil(player1)
        let player2 = IA(withId: 2, andName: "IA", playIn: board)
        XCTAssertNotNil(player2)
        func expect(board : Board, players: [Player], afficheur: Afficheur){
            var game = Game(withBoard: board, playWith: players, display: afficheur)
            XCTAssertNotNil(game)
            XCTAssertNil(game?.getWinner())
        }
        expect(board: board, players: [player1, player2], afficheur: afficheur)
    }

}
