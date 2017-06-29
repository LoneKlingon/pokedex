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
    
    @IBOutlet weak var pokeNameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pokeNameLbl.text = chosenPokemon.name.capitalized
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
