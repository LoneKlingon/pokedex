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
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pokeNameLbl.text = chosenPokemon.name.capitalized
        
        //run the download function
        chosenPokemon.downloadPokemonData
        {
            //run updating code here 
            
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
