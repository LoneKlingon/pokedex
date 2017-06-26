//
//  Pokemon.swift
//  pokedex
//
//  Created by Anthony Youbi Sobodker on 2017-06-23.
//  Copyright © 2017 SBS. All rights reserved.
//

import Foundation

class Pokemon
{
    var _name: String!
    var _pokeId: String!
    
    
    var name:String
    {
        return _name
    }
    
    var pokeId: String
    {
        return _pokeId
    }
    
    init ( pokemonName: String, pokemonId: String)
    {
        
        self._name = pokemonName
        self._pokeId = pokemonId
    }
    
    
    
}
