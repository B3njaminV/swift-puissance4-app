//
//  File.swift
//  
//
//  Created by Benjamin on 19/01/2023.
//

import Foundation

public class Player{
    
    let id: Int
    let nom: String
    
    public init?(id : Int, nom : String = ""){
        self.id = id
        self.nom = nom
    }
}
