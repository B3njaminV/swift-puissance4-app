import Foundation
import puissance4

/*
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
 */

let lecteur = Lecteur()
let afficheur = Afficheur()

if var board = Board(nbR: 6, nbC: 8){
    let player1 = Human(withId: 1, andName: "Joueur 1", playIn: board, andReadWith: lecteur)
    let player2 = Human(withId: 2, andName: "Joueur 2", playIn: board, andReadWith: lecteur)
    var game : Game?

    var partie = 0
    while (partie != 1 && partie != 2){
        afficheur.afficher(withTxt: "Tapez 1 pour jouer avec un ami sinon 2 pour jouer avec une IA")
        partie = lecteur.lireEntier() ?? -1
    }
    afficheur.afficher(withTxt: "Vous avez choisi de jouer contre un \(partie == 1 ? "ami" : "IA")")

    let regle = ClassicRules(inBoard: &board)

    if partie == 1 {
        game = Game(withBoard: &board, playWith: [player1, player2], display: afficheur, andRules: regle!)
    } else {
        game = Game(withBoard: &board, playWith: [player1, IA(withId: 2, andName: "IA", playIn: board)], display: afficheur, andRules: regle!)
    }

    while game?.getWinner() == nil {
        game?.tour()
    }
}

