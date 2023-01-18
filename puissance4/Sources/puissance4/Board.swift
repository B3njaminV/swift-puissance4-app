public struct Board : CustomStringConvertible{

    public var grid : [[Int?]]
    // ? sa peut être vide ou un int
    
    public let nbRows : Int
    public let nbColums : Int
    private static let descriptionMapper : [Int? : String] = [nil : "-", 1 : "X", 2 : "O"]

    public var description: String {
        var string = String()
        /* Méthode 1:
        for r in (0..<nbRows).reversed(){
            for c in 0..<nbColums {
                string.append("\(grid[r][c] ?? 0) ")
            }
            string.append("\n")
        }
        */
        for row in grid.reversed(){
            for cell in row {
                string.append("\(String(describing: Board.descriptionMapper[cell] ?? "-")) ")
            }
            string.append("\n")
        }
        return string
    }

    public init?(nbR : Int = 6, nbC : Int = 7) {
        //init? rend un optionnel de Board -> si jamais j'ai pas les bonnes dimensions alors :
        guard nbR > 0 && nbC > 0 else {
            // guard bloque seulement si la condition n'est pas respecté
            return nil;
        }
        self.nbRows = nbR;
        self.nbColums = nbC;
        grid = Array(repeating: Array(repeating: nil, count: nbColums), count: nbRows);
        // Je répète x fois la création d'un tableau
    }
    
    public init?(withGrid grid : [[Int?]]){
        /* Méthode 1 :
        let numberColumns = grid[0].count
        for i in 0 ..< grid.count{  //..< permet de prendre la valeur jusqu'à la dernière valeur, dernière valeur non inclus
            if grid[i].count != numberColumns{
                return nil
            }
        }
        */
        // Méthode 2 :
        // TEST si notre grille est bien rectangulaire
        let sizes = grid.map{ return $0.count}
        // $0 = premier paramètre donc tableau de int
        let result = sizes.allSatisfy{
            $0 == grid[0].count
        }
        // prédicat = retourne un booléen
        guard result else{
            return nil
        }

        nbRows=grid.count
        nbColums=grid[0].count
        self.grid=grid
    }

    private func isColumnFull(column : Int) -> Bool{
        for row in 0..<nbRows{
            if grid[row][column] == nil{
                return false
            }
        }
        return true
    }

    private func isFull() -> Bool{
        for column in 0..<nbColums{
            if !isColumnFull(column: column){
                return false
            }
        }
        return true
    }

    private mutating func insertPiece(id:Int, row:Int, column:Int) -> BoardResult{
        guard row >= 0 && row < nbRows && column >= 0 && column < nbColums else{
            return .failed(.unknown)
        }
        guard grid[row][column] == nil else{
            return .failed(.unknown)
        }
        grid[row][column] = id
        return .ok
    }

    public mutating func insertPiece(id:Int, column:Int) -> BoardResult{
        for row in 0..<nbRows{
            return insertPiece(id: id, row: row, column: column)
        }
        return .ok
    }

    public mutating func removePiece(id:Int, row:Int, column:Int) -> Bool {
        guard row >= 0 && row < nbRows && column >= 0 && column < nbColums else{
            return false
        }
        guard grid[row][column] == id else{
            return false
        }
        grid[row][column] = nil
        return true
    }
}
