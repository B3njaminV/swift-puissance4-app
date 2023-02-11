import XCTest
@testable import puissance4

final class Game_UT: XCTestCase {

    func testInit() throws {
        var board = Board(nbR: 6, nbC: 8)!
        var game : Game?
        XCTAssertNotNil(board)
        let lecteur = Lecteur()
        XCTAssertNotNil(lecteur)
        let afficheur = Afficheur()
        XCTAssertNotNil(afficheur)
        let player1 = Human(withId: 1, andName: "Joueur 1", playIn: board, andReadWith: lecteur)
        XCTAssertNotNil(player1)
        let player2 = IA(withId: 2, andName: "IA", playIn: board)
        XCTAssertNotNil(player2)
        let regle = ClassicRules(inBoard: &board)
        XCTAssertNotNil(regle)
        game = Game(withBoard: &board, playWith: [player1, player2], display: afficheur, andRules: regle!)
        XCTAssertNotNil(game)
        XCTAssertNil(game?.getWinner())
    }

    func testTour() throws {
        var board = Board(nbR: 6, nbC: 8)!
        let lecteur = Lecteur()
        let regle = ClassicRules(inBoard: &board)
        let player1 = Human(withId: 1, andName: "Joueur 1", playIn: board, andReadWith: lecteur)
        let player2 = Human(withId: 2, andName: "Joueur 2", playIn: board, andReadWith: lecteur)
        var game = Game(withBoard: &board, playWith: [player1, player2], display: Afficheur(), andRules: regle!)
        XCTAssertNotNil(board)
        XCTAssertFalse(board.isFull())
        game.joueurSuivant()
        XCTAssertEqual(1, game.numeroJoueur)
        game.joueurSuivant()
        XCTAssertEqual(0, game.numeroJoueur)
        game.joueurSuivant()
        XCTAssertEqual(1, game.numeroJoueur)
    }

}
