//
//  ResultController.swift
//  Poker Help
//
//  Created by Manuel Gonzalez Villegas on 18/4/16.
//  Copyright © 2016 Manuel Gonzalez Villegas. All rights reserved.
//

import UIKit

class ResultController: ParentController {
    
    @IBOutlet weak var cpr: UITextField!
    @IBOutlet weak var csi: UITextField!
    @IBOutlet weak var pn: UITextField!
    
    var cprValue:Double = 0
    var csiValue:Double = 0
    var pnValue:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cpr.text = cprValue.description
        csi.text = csiValue.description
        pn.text = pnValue.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
