//
//  ViewController.swift
//  Gamepicker
//
//  Created by Bart van de Klundert on 15/03/2019.
//  Copyright © 2019 Bart van de Klundert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblAantal: UILabel!
    @IBOutlet weak var lblTijd: UILabel!
    
    @IBAction func sliderAantal(_ sender: UISlider) {
        lblAantal.text = String(Int(sender.value));
    }
    
    
    @IBAction func sliderTijd(_ sender: UISlider) {
        lblTijd.text = String(Int(sender.value));
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

