//
//  AlphabetController.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 20.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit

class AlphabetController: UIViewController {
    
    @IBOutlet weak var go: UIButton!
        
        override func viewDidLoad() {
        super.viewDidLoad()
         
            // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //our variable secondViewController is of type VC2 which is the
        // second view controller, we can access variables put into there
        // destination VC2
        let secondViewController:HomeController = segue.destinationViewController as! HomeController
        
        //secondViewController.mainCollectionView.layoutIfNeeded()
        secondViewController.mainCollectionView.scrollToItemAtIndexPath(NSIndexPath(forItem:2, inSection:0), atScrollPosition: .CenteredHorizontally, animated: true)
    }
}
