//
//  Poker_HelpTests.swift
//  Poker HelpTests
//
//  Created by Manuel Gonzalez Villegas on 18/4/16.
//  Copyright © 2016 Manuel Gonzalez Villegas. All rights reserved.
//

import XCTest
@testable import Poker_Help

class Poker_HelpTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var vc: ViewController!
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let nav: UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        vc = nav.topViewController as! ViewController
        
        
        let smallBlind: Double = 100
        let bigBlind: Double = 200
        let ante: Double = 0
        let stack: Double = 1000
        let players: Double = 9
        let leftOpponents: Double = 5
        
        
        vc.calculatePN(smallBlind, bigBlindValue: bigBlind, anteValue: ante, stackValue: stack, playersValue: players, leftOpponentsValue: leftOpponents)
        
        XCTAssert(vc.pnValue == 16)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
