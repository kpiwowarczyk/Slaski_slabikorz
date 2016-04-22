//
//  CollectionViewCell.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 18.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    @IBOutlet var silesianImage: UIImageView!
    @IBOutlet weak var silesianLabel: UILabel!
    @IBOutlet var cardView: UIView!
    @IBOutlet var silesianImageBack: UIImageView!
    
    //var silesianImageBack: UIImageView!
    var showingBack = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //print("Karol")
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.numberOfTapsRequired = 1
        cardView.userInteractionEnabled = true
        cardView.addGestureRecognizer(tap)
        //print(showingBack)

        
        
    }
    
    var silesianWords: Word! {
        didSet {
            silesianImage.image = silesianWords.featuredImage
            silesianLabel.text = silesianWords.title
            silesianImageBack.image = silesianWords.backImage
        }
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        
        if (showingBack == true) {
            print("Karol1")
            UIView.transitionFromView(silesianImage, toView: silesianImageBack, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack = false
            print(showingBack)

        } else if (showingBack == false) {
            print("Karol2")
            UIView.transitionFromView(silesianImageBack, toView: silesianImage, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack = true
            print(showingBack)

        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}











