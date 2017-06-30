//
//  constants.swift
//  pokedex
//
//  Created by Anthony Youbi Sobodker on 2017-06-29.
//  Copyright © 2017 SBS. All rights reserved.
//

let BASE_URL = "https://pokeapi.co/"
let API_CALL = "api/v1/pokemon/"

//used for asynchrounous calls; acts a bit like a timer to track when the calls are completed
typealias downloadCompleted = () -> ()
