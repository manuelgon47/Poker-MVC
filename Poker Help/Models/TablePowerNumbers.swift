//
//  Hand2.swift
//  Poker Help
//
//  Created by Manuel Gonzalez Villegas on 22/4/16.
//  Copyright © 2016 Manuel Gonzalez Villegas. All rights reserved.
//

import Foundation
import UIKit

class TablePowerNumbers {
    
    func initTabla() -> [Int: [Card: NSArray]] {
        let tabla:[Int:[Card: NSArray]] = [
            0:  [Card.CARD_A: [100, 100, 100, 100, 100, 50, 37, 32, 28, 31, 27, 26, 24]],
            1:  [Card.CARD_K: [100, 100, 100, 75, 66, 44, 17, 15, 14, 13, 11, 10, 9]],
            2:  [Card.CARD_Q: [100, 48, 100, 75, 58, 38, 16, 11, 10, 8, 8, 8, 8]],
            3:  [Card.CARD_J: [50, 31, 26, 100, 58, 39, 21, 12, 7, 7, 7, 7, 5]],
            4:  [Card.CARD_T: [36, 19, 17, 22, 100, 43, 26, 15, 10, 9, 7, 5, 4]],
            5:  [Card.CARD_9: [27, 12, 9, 9, 11, 100, 31, 17, 10, 9, 3, 2, 0]],
            6:  [Card.CARD_8: [24, 10, 8, 8, 10, 10, 66, 19, 15, 10, 9, 0, 0]],
            7:  [Card.CARD_7: [22, 9, 6, 5, 6, 7, 10, 58, 15, 10, 9, 0, 0]],
            8:  [Card.CARD_6: [18, 9, 6, 4, 3, 3, 4, 7, 51, 11, 10, 4, 0]],
            9:  [Card.CARD_5: [21, 9, 6, 4, 0, 0, 0, 0, 0, 44, 11, 8, 0]],
            10: [Card.CARD_4: [18, 8, 5, 3, 0, 0, 0, 0, 0, 0, 39, 6, 0]],
            11: [Card.CARD_3: [16, 8, 5, 3, 0, 0, 0, 0, 0, 0, 0, 33, 0]],
            12: [Card.CARD_2: [15, 7, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 28]]
        ]
        
        return tabla
    }
}