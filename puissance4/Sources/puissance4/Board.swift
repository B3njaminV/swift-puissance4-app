public struct Board {
    
    var grid : [[Int?]]
    
    private let nbLines : Int;
    private let nbColums : Int;
    
    public init?(nbL : Int, nbC : Int, description : Int) {
        if(nbL <= 0 || nbC <= 0){
            return nil;
        }
        self.nbLines = nbL;
        self.nbColums = nbC;
        grid = Array(repeating: Array(repeating: nil, count: nbC), count: nbL);
    }
    
    private insertPiece(id:Int, ligne:Int, colonne:Int){
        for i in 0
    }
    
    public insertPiece(id:Int, colonne:Int) -> Bool{
        
    }
    
    private removePiece(ligne:Int, colonne:Int){
        
    }
    
    public isFull() -> Bool{
        
    }
    
}
