//
//  ViewController.swift
//  ADMobs
//
//  Created by Ankita Chordia on 05/09/17.
//  Copyright © 2017 Ankita Chordia. All rights reserved.
//

import UIKit
import GoogleMobileAds

//MARK:- ~~~~~~~~~View Life Cycle~~~~~~~~~
class ViewController: UIViewController,GADRewardBasedVideoAdDelegate {
    
    @IBOutlet weak var noOfAddsSeenlbl: UILabel!
    @IBOutlet weak var emojiilbl: UILabel!
    
    @IBOutlet weak var btn3bottomCons: NSLayoutConstraint!
    @IBOutlet weak var btn2bottomCons: NSLayoutConstraint!
    @IBOutlet weak var btn1bottomCons: NSLayoutConstraint!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var start1Cons: NSLayoutConstraint!
    @IBOutlet weak var start2Cons: NSLayoutConstraint!
    @IBOutlet weak var start3Cons: NSLayoutConstraint!
    @IBOutlet weak var str1: UILabel!
    @IBOutlet weak var str2: UILabel!
    @IBOutlet weak var str3: UILabel!
    
    
    
    var count = 0
    var flag = false
    var height = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        str1.alpha = 0
        str2.alpha = 0
        str3.alpha = 0
        height = Int(self.view.frame.height) - 20
        count = UserDefaults.standard.integer(forKey: "AdCount")
        noOfAddsSeenlbl.text = String(count)
        if count > 0 && count < 2{
            if count == 1{
                emojiilbl.text = "😅"
            }else if count == 2{
                emojiilbl.text = "🙂"
            }
        }else if count > 2{
            emojiilbl.text = "😁"
        }
        GADRewardBasedVideoAd.sharedInstance().delegate = self
    }
    
    //MARK:- ~~~~~~~~~Show Adds Btn Clicked~~~~~~~~~
    @IBAction func showAddsBtnClicked(_ sender: UIButton) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    
    //MARK:- ~~~~~~~~~Adds Delegate Methods~~~~~~~~~
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        count += 1
        noOfAddsSeenlbl.text = String(count)
        if count > 0 && count < 2{
            if count == 0{
                emojiilbl.text = "😅"
            }else if count == 1{
                emojiilbl.text = "🙂"
            }else if count == 2{
                emojiilbl.text = "😇"
            }
        }else if count > 2{
            emojiilbl.text = "😁"
        }
        UserDefaults.standard.set(count, forKey: "AdCount")
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        if !flag{
            
            UIView.animate(withDuration: 0.20, animations: {
                self.btn1bottomCons.constant = 55
                self.view.layoutIfNeeded()
            }, completion: { (isTrue) in
                if isTrue{
                    UIView.animate(withDuration: 0.15, animations: {
                        self.btn2bottomCons.constant = 55
                        self.view.layoutIfNeeded()
                    }, completion: { (isTrue) in
                        if isTrue{
                            UIView.animate(withDuration: 0.10, animations: {
                                self.btn3bottomCons.constant = 55
                                self.view.layoutIfNeeded()
                            })
                        }
                    })
                }
            })
            
            
            
        }else{
            str1.alpha = 0.0
            str2.alpha = 0.0
            str3.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
                self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            })
            btn1bottomCons.constant = 0
            btn2bottomCons.constant = 0
            btn3bottomCons.constant = 0
            UIView.animate(withDuration: 0.10, animations: {
                self.view.layoutIfNeeded()
            })
        }
        flag = !flag
    }
    
    @IBAction func btn1Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        })
//        str1.alpha = 1.0
        str2.alpha = 1.0
//        str3.alpha = 1.0
        self.start2Cons.constant = CGFloat(height)
        UIView.animate(withDuration: 3.0, animations: {
            self.view.layoutIfNeeded()
            self.str1.alpha = 0.0
            self.str2.alpha = 0.0
            self.str3.alpha = 0.0
        }) { (isTrue) in
            if isTrue{
                self.start1Cons.constant = 18
                self.start2Cons.constant = 18
                self.start3Cons.constant = 18
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func btn2Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        })
        str1.alpha = 1.0
//        str2.alpha = 1.0
        str3.alpha = 1.0
        self.start1Cons.constant = CGFloat(height)
        self.start3Cons.constant = CGFloat(height)
        UIView.animate(withDuration: 3.0, animations: {
            self.view.layoutIfNeeded()
            self.str1.alpha = 0.0
            self.str2.alpha = 0.0
            self.str3.alpha = 0.0
        }) { (isTrue) in
            if isTrue{
                self.start1Cons.constant = 18
                self.start2Cons.constant = 18
                self.start3Cons.constant = 18
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func btn3Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        })
        str1.alpha = 1.0
        str2.alpha = 1.0
        str3.alpha = 1.0
        self.start1Cons.constant = CGFloat(height)
        self.start2Cons.constant = CGFloat(height)
        self.start3Cons.constant = CGFloat(height)
        UIView.animate(withDuration: 3.0, animations: {
            self.view.layoutIfNeeded()
            self.str1.alpha = 0.0
            self.str2.alpha = 0.0
            self.str3.alpha = 0.0
        }) { (isTrue) in
            if isTrue{
                self.start1Cons.constant = 18
                self.start2Cons.constant = 18
                self.start3Cons.constant = 18
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

