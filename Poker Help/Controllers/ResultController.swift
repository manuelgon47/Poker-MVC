//
//  ResultController.swift
//  Poker Help
//
//  Created by Manuel Gonzalez Villegas on 18/4/16.
//  Copyright © 2016 Manuel Gonzalez Villegas. All rights reserved.
//

import UIKit

class ResultController: ParentController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var cpr: UITextField!
    @IBOutlet weak var csi: UITextField!
    @IBOutlet weak var pn: UITextField!
    
    var cprValue:Int = 0
    var csiValue:Int = 0
    var pnValue:Int = 0

    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cpr.text = cprValue.description
        csi.text = csiValue.description
        pn.text = pnValue.description
        
        createTableItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTableItems() {
        // TODO: Refactor this shit
        items.append("")
        items.append(Card.CARD_A.rawValue)
        items.append(Card.CARD_K.rawValue)
        items.append(Card.CARD_Q.rawValue)
        items.append(Card.CARD_J.rawValue)
        items.append(Card.CARD_T.rawValue)
        items.append(Card.CARD_9.rawValue)
        items.append(Card.CARD_8.rawValue)
        items.append(Card.CARD_7.rawValue)
        items.append(Card.CARD_6.rawValue)
        items.append(Card.CARD_5.rawValue)
        items.append(Card.CARD_4.rawValue)
        items.append(Card.CARD_3.rawValue)
        items.append(Card.CARD_2.rawValue)
        
        var index = 14
        
        let pns:[Int: [Card: NSArray]] = TablePowerNumbers().initTabla()
        
        for (_, tabla) in Array(pns).sort({$0.0 < $1.0}) {
            for (_, cardPNs) in tabla {
                for pn in cardPNs {
                    if (index % 14 == 0) {
                        let resto = index / 14
                        if (resto == 1) {
                            items.append(Card.CARD_A.rawValue)
                            index += 1
                        }
                        if (resto == 2) {
                            items.append(Card.CARD_K.rawValue)
                            index += 1
                        }
                        if (resto == 3) {
                            items.append(Card.CARD_Q.rawValue)
                            index += 1
                        }
                        if (resto == 4) {
                            items.append(Card.CARD_J.rawValue)
                            index += 1
                        }
                        if (resto == 5) {
                            items.append(Card.CARD_T.rawValue)
                            index += 1
                        }
                        if (resto == 6) {
                            items.append(Card.CARD_9.rawValue)
                            index += 1
                        }
                        if (resto == 7) {
                            items.append(Card.CARD_8.rawValue)
                            index += 1
                        }
                        if (resto == 8) {
                            items.append(Card.CARD_7.rawValue)
                            index += 1
                        }
                        if (resto == 9) {
                            items.append(Card.CARD_6.rawValue)
                            index += 1
                        }
                        if (resto == 10) {
                            items.append(Card.CARD_5.rawValue)
                            index += 1
                        }
                        if (resto == 11) {
                            items.append(Card.CARD_4.rawValue)
                            index += 1
                        }
                        if (resto == 12) {
                            items.append(Card.CARD_3.rawValue)
                            index += 1
                        }
                        if (resto == 13) {
                            items.append(Card.CARD_2.rawValue)
                            index += 1
                        }
                    }
                    items.append(String(pn))
                    index += 1
                }
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // TODO: Refactor this
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PNCollectionViewCell
        
        let index = indexPath.item
        
        var color: UIColor = UIColor.whiteColor()
        if index < 14 || index % 14 == 0 {
            color = UIColor.grayColor()
        }
        
        var labelText = self.items[index]
        if let currentPN = Int(labelText) {
            if (currentPN == 100) {
                labelText = "+"
            }
            
            if (currentPN == 0) {
                labelText = ""
            }
            
            if (currentPN >= pnValue) {
                color = UIColor.greenColor()
            }
        }
        
        cell.myLabel.text = labelText
        
        
        cell.backgroundColor = color
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events at position indexPath.item
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let aux = collectionView.frame.size.width/14 - 3
        return CGSizeMake(aux, aux)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 3
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 3
    }
}
