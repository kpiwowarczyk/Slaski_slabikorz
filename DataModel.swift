//
//  DataModel.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 18.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit

class Word
{
    // MARK: - Public API
    var silesianWordTable = []
    var id = ""
    var title = ""
    var featuredImage: UIImage!
    var backImage: UIImage!
    
    init(id: String, title: String, featuredImage: UIImage!, backImage: UIImage!)
    {
        self.id = id
        self.title = title
        self.featuredImage = featuredImage
        self.backImage = backImage
    }
    
    // MARK: - Private
    static func selectedWords() -> [Word]
    {
        return [
            Word(id: "k1", title: "p2", featuredImage: UIImage(named: "k1"), backImage: UIImage(named: "k2")!),
            Word(id: "k2", title: "p3", featuredImage: UIImage(named: "k2"), backImage: UIImage(named: "k3")!),
            Word(id: "k3", title: "p4", featuredImage: UIImage(named: "k3"), backImage: UIImage(named: "kx")!),
            Word(id: "k4", title: "p3", featuredImage: UIImage(named: "k4"), backImage: UIImage(named: "k3")!),
            Word(id: "k5", title: "p4", featuredImage: UIImage(named: "kx"), backImage: UIImage(named: "k2")!),
            //Word(id: "k4", title: "p5", featuredImage: UIImage(named: "k4"), backImage: UIImage(named: "k4")!),
        ]
    }
}



