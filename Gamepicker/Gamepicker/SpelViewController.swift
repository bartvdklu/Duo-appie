//
//  SpelViewController.swift
//  Gamepicker
//
//  Created by Bart van de Klundert on 22/03/2019.
//  Copyright © 2019 Bart van de Klundert. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SpelViewController: UIViewController {
    
    @IBOutlet weak var TxtBeschrijving: UITextView!
    @IBOutlet weak var TxtMaterialen: UITextView!
    @IBOutlet weak var TxtTijd: UITextView!
    @IBOutlet weak var lblSpel: UITextView!
    
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var GameNumber = 1;

    override func viewDidLoad() {
        super.viewDidLoad()
        //set Firebase reference
        ref = Database.database().reference()
        
        //retrieve content for games and listen for changes
        databaseHandle = ref?.child("Spellen").child(String(Int(GameNumber))).child("naam").observe(.value, with: { (DataSnapshot) in
            
            self.lblSpel.text = DataSnapshot.value as? String
        })
        
        databaseHandle = ref?.child("Spellen").child(String(Int(GameNumber))).child("beschrijving").observe(.value, with: { (DataSnapshot) in
            
            self.TxtBeschrijving.text = DataSnapshot.value as? String
        })
        
        databaseHandle = ref?.child("Spellen").child(String(Int(GameNumber))).child("materialen").observe(.value, with: { (DataSnapshot) in
            
            self.TxtMaterialen.text = DataSnapshot.value as? String
        })
        
        databaseHandle = ref?.child("Spellen").child(String(Int(GameNumber))).child("tijd").observe(.value, with: { (DataSnapshot) in
            
            self.TxtTijd.text = DataSnapshot.value as? String
        })
            
    }

}
