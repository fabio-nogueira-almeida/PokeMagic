//
//  Pokemon.swift
//  
//
//  Created by Fábio Nogueira de Almeida on 18/07/15.
//
//

import Foundation
import CoreData

class Pokemon: NSManagedObject {

    @NSManaged var nome: String
    @NSManaged var apelido: String
    @NSManaged var image: NSData

}
