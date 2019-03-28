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
    @IBOutlet weak var ImageView: UIImageView!
    
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var previousNumber: Int? // used in randomNumber()
    
    func randomNumber(number: Int) -> Int {
        var randomNumber = Int(arc4random_uniform(UInt32(number)))
        while previousNumber == randomNumber {
            randomNumber = Int(arc4random_uniform(UInt32(number)))
        }
        previousNumber = randomNumber
        return randomNumber
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //set Firebase reference
        ref = Database.database().reference()
        
        let GameNumber = randomNumber(number: 9)
        
        var imagesListArray = [UIImage]()
        
//        for imageName in 1...3
//        {
//            imagesListArray.append(UIImage(named: "\(imageName).png")!)
//        }
        
        // You can also use below code to add images if not want to use loop
         imagesListArray.append(UIImage(named: "verstoppertje.png")!)
         imagesListArray.append(UIImage(named: "Spel_beginscherm.jpg")!)
//         imagesListArray.append(UIImage(named: "3.png")!)
        
        self.ImageView.animationImages = imagesListArray
        self.ImageView.animationDuration = 10
        self.ImageView.startAnimating()

        
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
