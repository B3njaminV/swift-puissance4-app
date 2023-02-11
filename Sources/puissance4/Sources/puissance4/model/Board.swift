public struct Board : CustomStringConvertible{

    public var grid : [[Int?]]
    public let nbRows : Int
    public let nbColums : Int
    private static let descriptionMapper : [Int? : String] = [nil : "⚪", 1 : "🔴", 2 : "🟡"]
    
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
                string.append("│ \(String(describing: Board.descriptionMapper[cell] ?? "-")) ")
            }
            string.append("│\n")
        }
        return string
    }

    public init?(nbR : Int = 6, nbC : Int = 7) {
        //init? rend un optionnel de Board
        guard(nbR >= 3 && nbC >= 3) else { return nil }
        self.nbRows = nbR;
        self.nbColums = nbC;
        grid = Array(repeating: Array(repeating: nil, count: nbColums), count: nbRows);
    }
    
    public init?(withGrid grid : [[Int?]]){
        // TEST si notre grille est bien rectangulaire
        /* Méthode 1 :
        let numberColumns = grid[0].count
        for i in 0 ..< grid.count{  //..< permet de prendre la valeur jusqu'à la dernière valeur, dernière valeur non inclus
            if grid[i].count != numberColumns{
                return nil
            }
        }
        */
        // Méthode 2 :
        let sizes = grid.map{ return $0.count}
        // $0 = premier paramètre donc tableau de int
        let result = sizes.allSatisfy{
            $0 == grid[0].count
        }
        // prédicat = retourne un booléen
        guard result else{
            return nil
        }
        nbRows = grid.count
        nbColums = grid[0].count
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

    public func isFull() -> Bool{
        for column in 0..<nbColums{
            if !isColumnFull(column: column){
                return false
            }
        }
        return true
    }

    private mutating func insertPiece(id:Int, row:Int, column:Int) -> BoardResult{
        guard row >= 0 && row < nbRows && column >= 0 && column < nbColums else{
            return .failed(.outOfBounds)
        }
        guard grid[row][column] == nil else{
            return .failed(.columnNil)
        }
        grid[row][column] = id
        return .ok
    }

    public mutating func insertPiece(id:Int, column:Int) -> BoardResult{
        for i in 0...nbRows {
            if grid[i][column] == nil {
                return insertPiece(id: id, row: i, column: column)
            }
        }
        return .failed(.unknown)
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

    public mutating func clearColumn(column:Int) -> Bool {
        guard column >= 0 && column < nbColums else{
            return false
        }
        for row in 0..<nbRows{
            grid[row][column] = nil
        }
        return true
    }

    public mutating func clearBoard() -> Bool {
        for column in 0..<nbColums{
            clearColumn(column: column)
        }
        return true
    }

    public func getGrid() -> [[Int?]]{
        return grid
    }
}