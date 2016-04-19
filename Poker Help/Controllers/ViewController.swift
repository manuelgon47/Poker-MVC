//
//  ViewController.swift
//  Poker Help
//
//  Created by Manuel Gonzalez Villegas on 18/4/16.
//  Copyright © 2016 Manuel Gonzalez Villegas. All rights reserved.
//

import UIKit

class ViewController: ParentController {
    
    @IBOutlet weak var smallBlind: UITextField!
    @IBOutlet weak var bigBlind: UITextField!
    @IBOutlet weak var ante: UITextField!// Not required
    
    @IBOutlet weak var stack: UITextField!
    @IBOutlet weak var players: UITextField!
    @IBOutlet weak var leftOpponents: UITextField!
    
    var cprValue:Double = 0.0
    var csiValue:Double = 0.0
    var pnValue:Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ante.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateAction(sender: AnyObject) {
        if (checkInputs()) {
            openResults()
        }
    }
    
    func openResults() {
        calculateResults()
        
        self.performSegueWithIdentifier("openResults", sender: self)
    }
    
    func calculateResults() {
        // TODO
        let smallBlindValue:Double = Double(smallBlind.text!)!
        let bigBlindValue:Double = Double(bigBlind.text!)!
        let anteValue:Double = Double(ante.text!)!
        
        let stackValue:Double = Double(stack.text!)!
        let playersValue:Double = Double(players.text!)!
        let leftOpponentsValue:Double = Double(leftOpponents.text!)!
        
        // CPR (Cost Per Round)
        let cpr:Double = smallBlindValue + bigBlindValue + (playersValue * anteValue)
        self.cprValue = cpr
        
        // CSI (Your chip-status index)
        // Note: If CSI is a little more than 7 is fine
        let csi:Double = stackValue / cpr
        self.csiValue = csi
        
        // PN
        var pn:Double = csi * leftOpponentsValue
        // Si hay 9 oponentes y el ante es mayor que 1/5 * el smallBlind: Al PN le restamos un 5%
        if playersValue >= 9 && anteValue > ((4/5)*smallBlindValue) {
            pn = pn * 0.95
        }
        self.pnValue = pn
    }
    
    // MARK: Listeners
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "openResults") {
            let resultsVC = segue.destinationViewController as! ResultController;
            resultsVC.cprValue = self.cprValue
            resultsVC.csiValue = self.csiValue
            resultsVC.pnValue = self.pnValue
        }
    }

    
    // MARK: Check imputs
    func checkInputs() -> Bool {
        if smallBlind.text == "" {
            self.showAlert("\"Small Blind\" is empty")
            
            return false
        }
        
        if bigBlind.text == "" {
            self.showAlert("\"Big Blind\" is empty")
            
            return false
        }
        
        if stack.text == "" {
            self.showAlert("\"Stack\" is empty")
            
            return false
        }
        
        if players.text == "" {
            self.showAlert("\"Players\" is empty")
            
            return false
        }
        
        if leftOpponents.text == "" {
            self.showAlert("\"Left Opponents\" is empty")
            
            return false
        }
        
        return true
    }


}

