//
//  ViewController.swift
//  PokeMagic
//
//  Created by Fábio Nogueira de Almeida on 10/07/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView()
    
    let pokemons = ["bulbasaur", "snorlax", "charmander", "megaCharizard", "squirtle"]
    
    // MARK: ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.frame = CGRectMake(-100, 30, 100, 100);
        self.view.addSubview(self.imageView);
        
        self.changePokemon()        
        self.jungleAnimated()
    }

    // MARK; Private Methods
    
    func changePokemon() {
        self.imageView.image = UIImage(named: self.getRandomPokemon())
    }
    
    func jungleAnimated() {
        UIView.animateWithDuration(5, animations: { () -> Void in
            self.imageView.frame.origin.x = self.view.frame.width;
            }) { (finish) -> Void in
                if (finish == true) {
                    self.imageView.frame.origin.x = -self.imageView.frame.width;
                    self.changePokemon()
                    self.jungleAnimated()
                }
        };
    }
    
    func getRandomPokemon() -> String {
        let diceRoll = Int(arc4random_uniform(UInt32(self.pokemons.count)))
        var pokemonName = self.pokemons[diceRoll]
        return pokemonName
    }
    
    // MARK: IBOutlets Methods

    @IBAction func pokebolaVaiTouched(sender: AnyObject) {
    }
    
    @IBAction func showPokemonsCapturadosTouched(sender: AnyObject) {
    }

}

