//
//  ViewController.swift
//  PokeMagic
//
//  Created by Fábio Nogueira de Almeida on 10/07/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var imageView = UIImageView()
    var pokebolaImageView = UIImageView(image: UIImage(named: "pokebola"))
    var congratualtionLabel = UILabel(frame: CGRectMake(0, 0, 100, 100))
    
    let pokemons = ["bulbasaur", "snorlax", "charmander", "megaCharizard", "squirtle"]

    var imageViewInitialFrame: CGRect!
    var pokebolaInitialFrame: CGRect!
    
    // MARK: ViewController Methods
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageViewInitialFrame = CGRectMake(-100, 30, 100, 100)
        self.pokebolaInitialFrame = CGRectMake(0, self.view.frame.size.height, 25, 25)
        
        self.imageView.frame = self.imageViewInitialFrame
        self.pokebolaImageView.frame = self.pokebolaInitialFrame
        
        self.congratualtionLabel.text = "Capturado!"
        self.congratualtionLabel.textColor = UIColor.yellowColor()
        self.congratualtionLabel.textAlignment = NSTextAlignment.Center
        self.congratualtionLabel.backgroundColor = UIColor.blackColor()
        self.congratualtionLabel.alpha = 0;
        
        self.view.addSubview(self.imageView);
        self.view.addSubview(self.pokebolaImageView)
        self.view.addSubview(self.congratualtionLabel)
        
        self.changePokemon()        
        self.jungleAnimated()
    }

    // MARK; Private Methods
    
    func catchPokemon() {
        MagicalRecord.saveWithBlock { (localContext : NSManagedObjectContext!) -> Void in
            var pokemonCatched = Pokemon.MR_createEntityInContext(localContext)
            pokemonCatched.image = UIImagePNGRepresentation(self.imageView.image)
        }
    }
    
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
        let imageViewFrame = self.imageView.layer.presentationLayer().frame;
        self.imageView.layer.removeAllAnimations();
        self.imageView.frame = imageViewFrame;
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.pokebolaImageView.frame = imageViewFrame;
            
            }) { (finish) -> Void in
                if (finish == true) {
                    self.congratualtionLabel.alpha = 1;
                    self.congratualtionLabel.frame = imageViewFrame;
                    self.catchPokemon()
                }
        };
        
    }

    @IBAction func searchTouched(sender: AnyObject) {
        self.congratualtionLabel.alpha = 0
        self.imageView.frame = self.imageViewInitialFrame
        self.pokebolaImageView.frame = self.pokebolaInitialFrame
        self.changePokemon()
        self.jungleAnimated()
    }
    
    @IBAction func resetTouched(sender: AnyObject) {
        Pokemon.MR_truncateAll();
    }
}

