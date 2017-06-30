//
//  Pokemon.swift
//  pokedex
//
//  Created by Anthony Youbi Sobodker on 2017-06-23.
//  Copyright © 2017 SBS. All rights reserved.
//

import UIKit
import Alamofire


class Pokemon
{
    var _name: String!
    var _pokeID: String!
    
    var _type:String!
    var _height:String!
    var _weight:String!
    var _attack:String!
    var _defense:String!
    var _info:String!
    var _evolutionID:String!
    var _evolutionName:String?
    var _evolutionLvl:Int?


    
    var name:String
    {
        return _name
    }
    
    var pokeId: String
    {
        return _pokeID
    }
    
    var type:String
    {
        if (_type == nil)
        {
            _type = ""
        }
        
        return _type
    }
    
    var height:String
    {
        if (_height == nil)
        {
            _height = ""
        }
        return _height
        
    }
    
    var weight:String
    {
        if (_weight == nil)
        {
            _weight = ""
        }
        return _weight
    }
    
    var attack:String
    {
        if (_attack == nil)
        {
            _attack = ""
        }
        
        return _attack
    }
    
    var defense:String
    {
        if (_defense == nil)
        {
            _defense = ""
        }
        
        return _defense
    }
    
    var info:String
    {
        if (_info == nil)
        {
            _info = ""
        }
        
        return _info
    }
    
    var evolutionID:String
    {
        if (_evolutionID == nil)
        {
            _evolutionID = ""
        }
        
        return _evolutionID
    }
    
    var evolutionName:String
    {
        if (_evolutionName == nil)
        {
            _evolutionName = ""
        }
        
        return _evolutionName!
    }
    
    var evolutionLvl:Int
    {
        if (_evolutionLvl == nil)
        {
            _evolutionLvl = 0
        }
        
        return _evolutionLvl!
        
    }
    
    var firstMove:String!
    
    //downloads and parses json data
    func downloadPokemonData(completed: @escaping downloadCompleted)
    {
        //create the API TO JSON URL
        let url = BASE_URL + API_CALL + _pokeID + "/"
        let pokemonURL = URL(string: url)
        
        print ("Url: " + url)
        
        //request JSON DATA from Alamofire

        Alamofire.request(pokemonURL!).responseJSON
        {
            response in
            let result = response.result
            
           
            print(result) //displays SUCCESS when API call is successful
            
            var pokeDict = result.value as? Dictionary<String, AnyObject>

            for(key, value) in pokeDict!
            {
                if (key == "attack")
                {
                    //always use explicit casting when possible; instead of as? type
                    self._attack =  String(describing: value)
                    
                    print("Attack = " + self._attack)

                }
                
                if (key == "moves")
                {
                    var movesList = value as? [Dictionary<String, AnyObject>]
                    
                    
                    self.firstMove = String(describing: (movesList?[0]["name"])!) //make sure to unwrap entire array of dict at the end (array[list])! or else it will display optional
                    
                    print("Move:" + self.firstMove!)

                    
                }
                
                if (key == "height")
                {
                    self._height = String(describing: value)
                    print("Height: " + self._height)
                    
                }
                
                if (key == "defense")
                {
                    self._defense = String(describing: value)
                    print("Defense: " + self._defense)
                }
                
                if (key == "weight")
                {
                    self._weight = String(describing: value)
                    print("Weight: " + self._weight)
                }
                
                if (key == "types")
                {
                    
                    var pokeTypes = value as? [Dictionary<String, AnyObject>]
                    var typeArr = [String]()
                    
                    
                    //going through array of type dict (JSON PULL DATA FORMAT)
                    for pokeType in pokeTypes!
                    {
                        //selecteting dictionary value with key name
                        var type = (pokeType["name"])!
                        
                        //adding this to my pokemon type array
                        typeArr.append(String(describing: type).capitalized)
                        
                    }
                    
                    //create a single string with the pokemon types
                    self._type = typeArr.joined(separator: ", ")
                
                    
                    print("Type: " + self._type)
                    
                }
                
                if (key == "evolutions")
                {
                    var evolutionsDict = value as? [Dictionary<String, AnyObject>]
                    
                    //JSON returns blank dict for pokemon with no evolution
                    if (evolutionsDict?.isEmpty == false)
                    {
                        var method = String(describing: (evolutionsDict?[0]["method"])!)
                        print("Method: " + method)
                        
                        //only show pokemon who evolve through leveling
                        if (method == "level_up")
                        {
                            var nextEvolution = (evolutionsDict?[0]["to"])!
                            
                            self._evolutionName = String(describing: nextEvolution)
                            print("Evolves to: " + self._evolutionName!)
                        }
                        
                        else
                        {
                            //remove this and else branch in final version
                            print("No evolution")
                            
                            //do nothing keep _evolutonName default value of ""
                        }
                        
                        
                    }
                    
                    else
                    {
                        //remove this and else branch in final version
                        print("No evolution")
                        
                        //do nothing keep _evolutonName default value of ""
                    }
                   
                   
                    
                    
                }
                
                

                
                
                
                
            }
            
            
            //Called at the very end; remember this is to know when asynchronous call is complete
            completed()
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    init ( pokemonName: String, pokemonId: String)
    {
        
        self._name = pokemonName
        self._pokeID = pokemonId
    }
    
    
    
}
