//
//  FilterViewController.swift
//  Gamepicker
//
//  Created by Bart van de Klundert on 22/03/2019.
//  Copyright © 2019 Bart van de Klundert. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var lblAantal: UILabel!
    
    @IBAction func sliderAantal(_ sender: UISlider) {
        lblAantal.text = String(Int(sender.value))
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
