//
//  GameModel.swift
//  Gamepicker
//
//  Created by Bart van de Klundert on 22/03/2019.
//  Copyright © 2019 Bart van de Klundert. All rights reserved.
//

class GameModel {
    
    var beschrijving: String?
    var foto: String?
    var naam: String?
    var omgeving: String?
    var spelers: Int?
    var tijd: Int?
    var materialen: Array<String>?
    
    init(beschrijving: String?, foto: String?, naam: String?, omgeving: String?, spelers: Int?, tijd: Int?, materialen: Array<String>?) {
        
        self.beschrijving = beschrijving;
        self.foto = foto;
        self.naam = naam;
        self.omgeving = omgeving;
        self.spelers = spelers;
        self.tijd = tijd;
        self.materialen = materialen;
        
    }
}
