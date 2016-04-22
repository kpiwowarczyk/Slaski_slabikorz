//
//  ViewController.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 18.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var mainCollectionView: UICollectionView!
    @IBOutlet weak var cardImage: UIImageView!
    
    //MARK: Data Source
    var silesianWords = Word.selectedWords()
    
    //MARK: Variables
    var indexPathNumber:Int = 0
    var contentOffsetX: Int = 0
    var contentWidth: Int = 0
    var permissionToChange: Int = 0
    var itemNumber = 0
    //var selectedItem = NSIndexPath(forItem: liczba, inSection: 0)


    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Cell register (nib/xib)
        mainCollectionView!.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"silesianCell")

        }
    
    var selectedIndexes = [NSIndexPath]() {
        didSet {
            mainCollectionView.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        //itemNumber = itemNumberFromAlphabet
        self.mainCollectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: itemNumber, inSection: 0), atScrollPosition: .Left, animated: true)
            }

    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        if indexPathNumber == 3 {
            cardImage.image =  UIImage(named: "p5")
        } else {
            print("Nie udało się")
        }
    }
    
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        // just creating an alert to prove our tap worked!
        let tapAlert = UIAlertController(title: "hmmm...", message: "this actually worked?", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    } 
    
        //MARK: Change cell size (fullscreen)
        func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return self.mainCollectionView.frame.size;
        }
    
        //MARK: Check access to change background image
        func checkTrueNumberOffVisibleCell() {
        if (indexPathNumber * contentWidth) == contentOffsetX {
            permissionToChange = 1
            //print("Access \(permissionToChange)")
        } else {
            permissionToChange = 0
            //print("Not access \(permissionToChange)")
            }
        }
    
        //MARK: change background (if permissionToChange == 1)
        func changeBackground() {
        let decision = (indexPathNumber, permissionToChange)
        switch decision {
        case (0, 1):
            cardImage.image =  UIImage(named: "p2")
        case (1, 1):
            cardImage.image =  UIImage(named: "p3")
        case (2, 1):
            cardImage.image =  UIImage(named: "p4")
        case (3, 1):
            cardImage.image =  UIImage(named: "p5")

        default:
            print("bez zmiany obrazka")
        }
    }
}

extension HomeController: UICollectionViewDataSource {
    //MARK: Number of sections in CollectionView (default: 1)
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //MARK: Number of items in one sections
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return silesianWords.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        // ...
        if let indexSelecionado = selectedIndexes.indexOf(indexPath) {
            selectedIndexes.removeAtIndex(indexSelecionado)
        } else {
            selectedIndexes.append(indexPath)
        }
    }
    
    //MARK: Date to cells
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("silesianCell", forIndexPath: indexPath)
            as! CollectionViewCell
        
        cell.silesianWords = self.silesianWords[indexPath.item]
        indexPathNumber = Int(indexPath.item)
        
        if self.selectedIndexes.indexOf(indexPath) == nil {
            print("1")
        } else {
            print("2")
        }
        return cell
        //print(indexPathNumber)
        
        //let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        //cell.userInteractionEnabled = true
        //cell.addGestureRecognizer(tap)
    }
    
    /*
    func scrollToItemAtIndexPath(indexPath: NSIndexPath, atScrollPosition scrollPosition: UICollectionViewScrollPosition,
        animated true: Bool) {
            return indexPath = 2
    } */
    
    
    }


//MARK: Calculation scrollView size (all cell's width), contentOffest.x
extension HomeController : UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height{
            contentWidth = Int(scrollView.contentSize.width) / silesianWords.count
            contentOffsetX = Int(scrollView.contentOffset.x)
            
            checkTrueNumberOffVisibleCell()
            changeBackground()
        }
    }
}






