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
    var imageFromCell = CollectionViewCell()

    
    //MARK: Variables
    var indexPathNumber:Int = 0
    var contentOffsetX: Int = 0
    var contentWidth: Int = 0
    var permissionToChange: Int = 0
    var itemNumber = 0
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
        print("koniec animacji")
        if indexPathNumber == 3 {
            cardImage.image =  UIImage(named: "p5")
        } else {
            print("Nie udało się")
        }
        
        
        
    }
    
        //MARK: Change cell size (fullscreen)
        func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return self.mainCollectionView.frame.size;
        }
    
        //MARK: Check access to change background image
        func checkTrueNumberOffVisibleCell() {
        if (indexPathNumber * contentWidth) == contentOffsetX {
            print("Można zmienić")
            permissionToChange = 1
            
        } else {
            permissionToChange = 0
            print("Nie można zmienić")
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
            print("")
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
            //print("1")
        } else {
            //print("2")
        }
        return cell
        //print(indexPathNumber)
        
        //let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        //cell.userInteractionEnabled = true
        //cell.addGestureRecognizer(tap)
    }
    
    func collectionView(collectionView: UICollectionView,
        didHighlightItemAtIndexPath indexPath: NSIndexPath) {
            print(indexPathNumber)
    }
    
    /*
    func scrollToItemAtIndexPath(indexPath: NSIndexPath, atScrollPosition scrollPosition: UICollectionViewScrollPosition,
        animated true: Bool) {
            return indexPath = 2
    } */
    
    
    func flipImage() {
        if (GlobalVariable.showingBack == false) {
            print("Widać tył")
    
            UIView.transitionFromView(GlobalVariable.silesianImageBackGlobal, toView: GlobalVariable.silesianImageGlobal, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
                GlobalVariable.showingBack = true
            
            /*GlobalVariable.silesianImageGlobal.centerXAnchor.constraintEqualToAnchor(cardImage.centerXAnchor).active = true
            GlobalVariable.silesianImageGlobal.centerYAnchor.constraintEqualToAnchor(cardImage.centerYAnchor).active = true */
            
            GlobalVariable.silesianImageGlobal.frame = CGRectMake(((view.frame.size.width  / 2) - (GlobalVariable.silesianImageGlobal.image!.size.width / 2)), ((view.frame.size.height / 2) - (GlobalVariable.silesianImageGlobal.image!.size.height / 2)), 141, 141)
            
            GlobalVariable.silesianImageBackGlobal.frame = CGRectMake(((view.frame.size.width  / 2) - (GlobalVariable.silesianImageBackGlobal.image!.size.width / 2)), ((view.frame.size.height / 2) - (GlobalVariable.silesianImageBackGlobal.image!.size.height / 2)), 141, 141)
            
                   } else if (GlobalVariable.showingBack == true){
            print("Widać przód")
            
        }

    }
   
    
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
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        //GlobalVariable.myStuct.hidden = true
        print("Przód - \(GlobalVariable.showingBack)")
        
        /*
        if (GlobalVariable.showingBack == false) {
        UIView.transitionFromView(GlobalVariable.silesianImageBackGlobal, toView: GlobalVariable.silesianImageGlobal, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
             GlobalVariable.showingBack = true
        } */
        /*
        GlobalVariable.silesianImageGlobal.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        GlobalVariable.silesianImageGlobal.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
            GlobalVariable.showingBack = true
        } */
        
    }
}






