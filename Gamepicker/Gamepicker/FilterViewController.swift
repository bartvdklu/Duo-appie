//
//  FilterViewController.swift
//  Gamepicker
//
//  Created by Bart van de Klundert on 22/03/2019.
//  Copyright © 2019 Bart van de Klundert. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FilterViewController: UIViewController {
    
    var ref: DatabaseReference?

    @IBOutlet weak var lblAantal: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var sliderValue: Int?
    
    @IBAction func sliderAantal(_ sender: UISlider) {
        lblAantal.text = String(Int(sender.value))
        sliderValue = Int(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func Gamefilter() {
        ref = Database.database().reference().child("Spellen")
        let query = ref?.queryOrdered(byChild: "spelers").queryStarting(atValue: sliderValue)
        query?.observe(.value, with: { (snapshot) in
            for childSnapshot in snapshot.children{
                let snap = childSnapshot as! DataSnapshot
                let key = snap.key
                gamesRandom.append(key)
            }
            print(gamesRandom)
        })
    }
    
    @IBAction func filterGames() {
        Gamefilter()
    }
    
}
