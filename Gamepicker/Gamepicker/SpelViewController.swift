//
//  SpelViewController.swift
//  Gamepicker
//
//  Created by Bart van de Klundert on 22/03/2019.
//  Copyright © 2019 Bart van de Klundert. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SpelViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var TxtBeschrijving: UITextView!
    @IBOutlet weak var TxtMaterialen: UITextView!
    @IBOutlet weak var TxtTijd: UITextView!
    @IBOutlet weak var lblSpel: UITextView!
    @IBOutlet weak var ImageView: UIImageView!
    
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var previousNumber: Int? // used in randomNumber()
    var imagesListArray = [UIImage]()

    
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
        imagesListArray.removeAll()
        self.imagesListArray.append(UIImage(named: "spel\(GameNumber).jpg")!)
        
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

    @IBAction func cameraAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            
            imagePicker.allowsEditing = false
            
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagePicker, animated: false, completion: nil)
        }
        else {let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            
            imagePicker.allowsEditing = false
            
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: false, completion: nil)
            
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imagesListArray.append(image)
            self.ImageView.animationImages = imagesListArray
            self.ImageView.animationDuration = 10
            self.ImageView.startAnimating()

        }else {
            print("Error....")
        }
        self.dismiss(animated: false, completion: nil)
    }
}
