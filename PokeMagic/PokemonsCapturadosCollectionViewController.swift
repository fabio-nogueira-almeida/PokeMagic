//
//  PokemonsCapturadosCollectionViewController.swift
//  PokeMagic
//
//  Created by Fábio Nogueira de Almeida on 11/07/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit

let reuseIdentifier = "PokemonCell"

class PokemonsCapturadosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokemons Capturados"
        self.navigationController?.navigationBarHidden = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
    
        var pokemonImageView = UIImageView(image: UIImage(named: "snorlax"))
        pokemonImageView.frame = cell.frame
        
        cell.backgroundView = pokemonImageView
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let pokedexViewController = self.storyboard!.instantiateViewControllerWithIdentifier("PokedexIdentify") as! PokedexViewController
        
        self.navigationController?.pushViewController(pokedexViewController, animated: true)
    }
}
