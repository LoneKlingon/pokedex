//
//  ViewController.swift
//  pokedex
//
//  Created by Anthony Youbi Sobodker on 2017-06-23.
//  Copyright © 2017 SBS. All rights reserved.
//

import UIKit
import AVFoundation


class PokeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var pokeCollectionView: UICollectionView!
    
    //Stores collectionView cells data
    var pokemonCollectionViewCellArr = [Pokemon]()
    
    //stores Filtered CollectionView cells data when search bar is used
    
    var filteredPokemonData = [Pokemon]()

    
    //Flag for when searchbar is used
    var searchFlag = false
    
    //musicplayer object
    var musicPlayer: AVAudioPlayer?
    
   
    //counts amount of times musicPlayerBtn has been pressed
    var musicCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pokeCollectionView.delegate = self
        pokeCollectionView.dataSource = self
        searchBar.delegate = self
        
        playMusic()
        
        var test: Pokemon
        
        test = Pokemon(pokemonName: "Charizard", pokemonId: "6")
        
        print (test.name)
        print (test.pokeId)
        
        parsePokemonCSV()
        
    }

    
    
    
    
    @IBAction func musicBtnPressed(_ sender: UIButton)
    {
        //to not use Count variable you can do a musicPlayer.isPlaying() check instead
        if(musicCount == 0)
        {
            musicPlayer?.pause()
            musicCount += 1
            sender.alpha = 0.5 // 0 is invisible
        }
        
        else
        {
            musicPlayer?.play()
            musicCount = 0
            sender.alpha = 1.0 // 1 is visible
            
        }
        
        
   
    }
    
    
    
    func playMusic()
    {
        //create path to music file
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        
        do
        {
            //initializing musicPlayer class object with path of music file
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
            musicPlayer?.prepareToPlay()
            musicPlayer?.numberOfLoops = -1
            musicPlayer?.play()
        }
            
            //catching the err as general error
        catch let err as NSError
        {
            print(err.debugDescription)
        }
        
    }
    
    //goes through array of dictionary csv objects
    func parsePokemonCSV()
    {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        
        do
        {
            //tries to open csv file
            let csv = try CSV(contentsOfURL: path!)
            
            //extracts all the rows in the csv; entries
            let rows = csv.rows
            
            for row in rows
            {
                
                
                var pokemonEntry = Pokemon(pokemonName: row["identifier"]!, pokemonId: row["id"]!)
                
                
                pokemonCollectionViewCellArr.append(pokemonEntry)
            }
            
            
        
        }
        
        //catches error when trying to extract csv data
        catch let err as NSError
        {
            print(err.description)
        }
        
        
    }
    
    //similar to tableview function; controls a single cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell
        {
            //if no search string is entered
            if (searchFlag == false)
            {
                cell.updateCell(pokemonObj: pokemonCollectionViewCellArr[indexPath.row])

            }
            
            //when search string is entered
            else
            {
                cell.updateCell(pokemonObj: filteredPokemonData[indexPath.row])
            }
            
            return cell
        }
            
        else
        {
            return UICollectionViewCell()
        }
        
    }
    
    //number of cells to create
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //if search string is not entered use original size of array to create cells
        if (searchFlag == false)
        {
            return pokemonCollectionViewCellArr.count
        }
        
        //if search string is entered use filteredArray to create cells
        else
        {
            return filteredPokemonData.count
        }
    }
    
    //number of cell sections 1 for most instances
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    //controls when a cell is selected behavior
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    
    //controls size of each cell; play with settings to get desired amount of cells per row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 105, height: 105)
    }
    
    //called when search text changes
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if (searchBar.text == nil || searchBar.text == "")
        {
            //do nothing; use default array
            searchFlag = false
        }
        
        else
        {
            //filter the array; use filter array
            
            let text = searchBar.text?.lowercased()
            
            //filter through original array get all the names of the pokemon and look for the search text inside them and place it into filteredPokemonData
            filteredPokemonData = pokemonCollectionViewCellArr.filter({$0.name.range(of: text!) != nil}) //$0 means the entire array structure; $0.name all names
            
            searchFlag = true
            
            
        }
        
        //refresh collectionview
        pokeCollectionView.reloadData()
    }
    
    


}

