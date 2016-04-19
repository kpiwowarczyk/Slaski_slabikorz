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
    
    init(id: String, title: String, featuredImage: UIImage!)
    {
        self.id = id
        self.title = title
        self.featuredImage = featuredImage
    }
    
    // MARK: - Private
    static func selectedWords() -> [Word]
    {
        return [
            Word(id: "k1", title: "p2", featuredImage: UIImage(named: "k1")!),
            Word(id: "k2", title: "p3", featuredImage: UIImage(named: "k2")!),
            Word(id: "k3", title: "p4", featuredImage: UIImage(named: "k3")!),
            Word(id: "k4", title: "p5", featuredImage: UIImage(named: "k4")!),
        ]
    }
}



