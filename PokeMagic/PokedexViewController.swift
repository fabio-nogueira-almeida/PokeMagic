//
//  PokedexViewController.swift
//  PokeMagic
//
//  Created by Fábio Nogueira de Almeida on 11/07/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var apelidoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    
    // MARK:ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokédex"
    }
    
    // MARK: IBOutlets Methods
    
    @IBAction func deleteTouched(sender: AnyObject) {
    }

    @IBAction func saveTouched(sender: AnyObject) {
    }
}
