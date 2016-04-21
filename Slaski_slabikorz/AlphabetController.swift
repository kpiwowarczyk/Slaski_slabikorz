//
//  AlphabetController.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 20.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit

var alphabetIndexPathRow:Int = 0

class AlphabetController: UICollectionViewController {
    
    var arrayWithAplhabet =  [String]()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            arrayWithAplhabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "W", "Y", "Z"]
    }
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let secondViewController:HomeController = segue.destinationViewController as! HomeController
        secondViewController.text = "Karol"
    }
*/
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayWithAplhabet.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        let button = cell.viewWithTag(1) as! UILabel
        button.text = arrayWithAplhabet[indexPath.row]
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        alphabetIndexPathRow = indexPath.row
        print(alphabetIndexPathRow)
        //getIndexPathRow()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondViewController:HomeController = segue.destinationViewController as! HomeController
        secondViewController.itemNumber = alphabetIndexPathRow
    }
}

