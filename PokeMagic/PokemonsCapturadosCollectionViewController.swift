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

    
    var pokemons : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokemons Capturados"
        self.navigationController?.navigationBarHidden = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.pokemons = Pokemon.MR_findAll()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemons.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        
        var pokemon = self.pokemons.objectAtIndex(indexPath.row) as! Pokemon
        
        var pokemonImageView = UIImageView(image: UIImage(data: pokemon.image))
        pokemonImageView.frame = cell.frame
        
        cell.backgroundView = pokemonImageView
        return cell
    }
}
