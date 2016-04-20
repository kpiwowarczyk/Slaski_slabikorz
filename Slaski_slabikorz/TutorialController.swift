//
//  TutorialController.swift
//  Slaski_slabikorz
//
//  Created by Karol Piwowarczyk on 20.04.2016.
//  Copyright © 2016 karolpiwowarczyk.pl. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class TutorialController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Video background
        let videoURL: NSURL = NSBundle.mainBundle().URLForResource("video", withExtension: "mov")!
        
        player = AVPlayer(URL: videoURL)
        player?.actionAtItemEnd = .None
        player?.muted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        view.layer.addSublayer(playerLayer)
        player?.play()
        
        //loop video
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "loopVideo",
            name: AVPlayerItemDidPlayToEndTimeNotification,
            object: nil)

        
        
        //MARK: Ustawienie rozmiaru scrollView do rozmiaru kontrollera (ekranu iPhone'a)
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        
        //MARK: Ustawienie tekstu na widoku 1 oraz dodanie zaokrąglenia do przycisku
        textView.textAlignment = .Center
        textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        textView.textColor = .blackColor()
        self.startButton.layer.cornerRadius = 4.0
        
        //MARK: Dodanie grafik do slajdów oraz ustawienie ich w odpowiednich miejscach (obok siebie)
        //wykorzystujemy tutaj stałe scrollViewWidth oraz scrollViewHeight
        let imgOne = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "slide 1")
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "slide 2")
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0,scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "slide 3")
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0,scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "slide 4")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        
        //MARK: ustawienie nowego rozmiaru dla całości (4 slajdy)
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 4, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControll.currentPage = 0
        
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        self.pageControll.currentPage = Int(currentPage);
        
        if Int(currentPage) == 0{
            textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        }else if Int(currentPage) == 1{
            textView.text = "I write mobile tutorials mainly targeting iOS"
        }else if Int(currentPage) == 2{
            textView.text = "And sometimes I write games tutorials about Unity"
        }else{
            textView.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.startButton.alpha = 1.0
            })
        }
    }
    
    func loopVideo() {
        player?.seekToTime(kCMTimeZero)
        player?.play()
    }

}
