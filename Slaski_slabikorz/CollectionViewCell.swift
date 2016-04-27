//
//  CollectionViewCell.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 18.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit



    
    struct GlobalVariable {
    static var silesianImageGlobal = UIImageView()
    static var silesianImageBackGlobal = UIImageView()
    static var showingBack = true
    }

    class CollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
        
        @IBOutlet var cardView: UIView!
        @IBOutlet var silesianImageBack: UIImageView!
        @IBOutlet var silesianImage: UIImageView!
        @IBOutlet var silesianLabel: UILabel!
    /*
    @IBOutlet var silesianImage: UIImageView!
    @IBOutlet weak var silesianLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet var silesianImageBack: 
*/
    
    //var silesianImageBack: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //print("Karol") 
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.numberOfTapsRequired = 1
        cardView.userInteractionEnabled = true
        //silesianImage.silesianImageBackGlobal.userInteractionEnabled = true

        cardView.addGestureRecognizer(tap)
       
        //GlobalVariable.silesianImageBackGlobal.addGestureRecognizer(tap)

        
        
    }

    
    var silesianWords: Word! {
        didSet {
            silesianImage.image = silesianWords.featuredImage
            silesianLabel.text = silesianWords.title
            silesianImageBack.image = silesianWords.backImage
            //GlobalVariable.myStuct.append(silesianLabel.text!)
            
            //GlobalVariable.myStuct.append(silesianLabel.text)
            //GlobalVariable.silesianImageGlobal = silesianImage
            //GlobalVariable.silesianImageBackGlobal = silesianImageBack
            //print(GlobalVariable.myStuct)
        }
    }
    
    
   
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        
        if (GlobalVariable.showingBack == true) {
            //print(GlobalVariable.myStuct)
            UIView.transitionFromView(silesianImage, toView: silesianImageBack, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            
            silesianImageBack.centerXAnchor.constraintEqualToAnchor(cardView.centerXAnchor).active = true
            silesianImageBack.centerYAnchor.constraintEqualToAnchor(cardView.centerYAnchor).active = true
            GlobalVariable.showingBack = false
           
        } else if (GlobalVariable.showingBack == false) {
            //print("Karol2")
            UIView.transitionFromView(silesianImageBack, toView: silesianImage, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            
            silesianImage.centerXAnchor.constraintEqualToAnchor(cardView.centerXAnchor).active = true
            silesianImage.centerYAnchor.constraintEqualToAnchor(cardView.centerYAnchor).active = true
            GlobalVariable.showingBack = true

        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

















