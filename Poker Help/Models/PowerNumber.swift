//
//  PowerNumber.swift
//  Poker Help
//
//  Created by Manuel Gonzalez Villegas on 22/4/16.
//  Copyright © 2016 Manuel Gonzalez Villegas. All rights reserved.
//

import Foundation

class PowerNumber {
    
    var card1: Card
    var card2: Card
    var pn: Int
    var enabled: Bool
    var representation: String?
    
    init(card1: Card, card2: Card, pn: Int, enabled: Bool, representation: String?) {
        self.card1 = card1
        self.card2 = card2
        self.pn = pn
        self.enabled = enabled
        self.representation = representation ?? String(pn)
    }
}