//
//  PokeInfoVC.swift
//  pokedex
//
//  Created by Anthony Youbi Sobodker on 2017-06-27.
//  Copyright © 2017 SBS. All rights reserved.
//

import UIKit

class PokeInfoVC: UIViewController {

    //contains the info from the pokemon selected in the collectionview cell from pokeVC
    var chosenPokemon: Pokemon!
    
    
    //UI Labels and Images IBOutlets
    @IBOutlet weak var pokeNameLbl: UILabel!
    
    @IBOutlet weak var pokemonDescriptionLbl: UILabel!
    
    @IBOutlet weak var pokemonTypeLbl: UILabel!
    
    @IBOutlet weak var pokemonHeightLbl: UILabel!
    
    @IBOutlet weak var pokemonWeightLbl: UILabel!
    
    @IBOutlet weak var pokemonAttackLbl: UILabel!
    
    @IBOutlet weak var pokemonDexIdLbl: UILabel!
    
    @IBOutlet weak var pokemonDefenseLbl: UILabel!
    
    @IBOutlet weak var pokemonEvolutionLbl: UILabel!
    
    @IBOutlet weak var pokemonImage1: UIImageView!
    
    @IBOutlet weak var pokemonImage2: UIImageView!
    
    @IBOutlet weak var pokemonEvolutionImage: UIImageView!
   
  
    @IBAction func backBtnPressed(_ sender: Any)
    {
        //put code to handle when back button is pressed; will keep music player paused at exact point when pressed 
        dismiss(animated: true, completion: nil)
        
    }
    
    //update the ui with correct info
    func updateUI()
    {
        self.pokeNameLbl.text = self.chosenPokemon.name.capitalized
        self.pokemonDexIdLbl.text = self.chosenPokemon.pokeId
        self.pokemonTypeLbl.text = self.chosenPokemon.type
        self.pokemonAttackLbl.text = self.chosenPokemon.attack
        self.pokemonDefenseLbl.text = self.chosenPokemon.defense
        self.pokemonHeightLbl.text = self.chosenPokemon.height
        self.pokemonWeightLbl.text = self.chosenPokemon.weight
        self.pokemonDescriptionLbl.text = self.chosenPokemon.info
        self.pokemonImage1.image = UIImage(named: self.chosenPokemon.pokeId)
        self.pokemonImage2.image = UIImage(named: self.chosenPokemon.pokeId)
        self.pokemonEvolutionImage.image = UIImage(named: self.chosenPokemon.evolutionID)
        
        if (self.chosenPokemon.evolutionLvl == -1)
        {
            self.pokemonEvolutionLbl.text = "No Evolution"
            
        }
        
        else
        {
            self.pokemonEvolutionLbl.text = "Evolves to " + self.chosenPokemon.evolutionName + " at Level " + String(describing: self.chosenPokemon.evolutionLvl)
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pokemonImage1.image = UIImage(named: chosenPokemon.pokeId)
        
        //all the runtime code should go here
        chosenPokemon.downloadPokemonData
        {
            
                self.updateUI()
                
                
                
        }
        
        
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
