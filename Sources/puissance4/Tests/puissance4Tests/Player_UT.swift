import XCTest
@testable import puissance4

final class Player_UT: XCTestCase {

    func testInitHuman() throws {
        let human1 = Human(withId: 1, andName: "Joueur 1", playIn: Board(nbR: 5, nbC: 8)!, andReadWith: Lecteur())
        let human2 = Human(withId: 2, andName: "Joueur 2", playIn: Board(nbR: 5, nbC: 8)!, andReadWith: Lecteur())

        func expect(human : Human, resultId: Int){
            XCTAssertNotNil(human)
            XCTAssertEqual(resultId, human.id)
        }
        expect(human: human1, resultId: 1)
        expect(human: human2, resultId: 2)
    }

    func testInitIA() throws {
        let ia = IA(withId: 2, andName: "IA", playIn: Board(nbR: 5, nbC: 8)!)
        func expect(ia : IA, resultId: Int){
            XCTAssertNotNil(ia)
            XCTAssertEqual(resultId, ia.id)
        }
        expect(ia: ia, resultId: 2)
    }

}
