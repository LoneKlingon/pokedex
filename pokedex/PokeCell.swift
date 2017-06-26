//
//  PokeCell.swift
//  pokedex
//
//  Created by Anthony Youbi Sobodker on 2017-06-23.
//  Copyright © 2017 SBS. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokemonNameLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func updateCell (pokemonObj: Pokemon)
    {
        pokemonImage.image = UIImage(named: pokemonObj.pokeId)
        
        pokemonNameLbl.text = String(describing: pokemonObj.name.capitalized)
        
        
    }
    
    
    
    
    
    
}
