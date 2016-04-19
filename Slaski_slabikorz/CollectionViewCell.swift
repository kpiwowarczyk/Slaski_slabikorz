//
//  CollectionViewCell.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 18.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var silesianImage: UIImageView!
    @IBOutlet weak var silesianLabel: UILabel!


    var silesianWords: Word! {
        didSet {
            silesianImage.image = silesianWords.featuredImage
            silesianLabel.text = silesianWords.title
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


