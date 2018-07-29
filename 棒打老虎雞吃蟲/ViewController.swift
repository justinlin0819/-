//
//  ViewController.swift
//  棒打老虎雞吃蟲
//
//  Created by Justin Lin on 2018/7/28.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination
            vc.preferredContentSize=CGSize(width: 300, height: 50)
            let controller = vc.popoverPresentationController
            if controller != nil {
                controller?.delegate = self
           }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cards.shuffle()
        round = 0
        score = 0
        score_AI = 0
        label_Score.text = "0"
        label_Score_AI.text = "0"
        image_Round1.image=nil
        image_Round2.image=nil
        image_Round3.image=nil
        image_Round4.image=nil
        image_shot_AI.image=nil
        image_Shot.image=nil
        image_Win.image=nil
        image_Win_AI.image=nil
        image_draw.image=nil
        button_Bar.isEnabled=true
        button_Tiger.isEnabled=true
        button_Chicken.isEnabled=true
        button_Warm.isEnabled=true
        button_Bar.frame=CGRect(x: 38, y: 475, width: 77, height: 114)
        button_Tiger.frame=CGRect(x: 115, y: 475, width: 77, height: 114)
        button_Chicken.frame=CGRect(x: 192, y: 475, width: 77, height: 114)
        button_Warm.frame=CGRect(x: 269, y: 475, width: 77, height: 114)
        shot_confirm=0
    }
    
    func show_AI_card() {
        switch round {
        case 0:
            switch cards[0]{
            case "棒":
                image_Round1.image=UIImage(named: "bar.png")
            case "老虎":
                image_Round1.image=UIImage(named: "tiger.png")
            case "雞":
                image_Round1.image=UIImage(named: "chicken.png")
            case "蟲":
                image_Round1.image=UIImage(named: "warm.png")
            default:
                break
            }
            image_shot_AI.image=image_Round1.image!
        case 1:
            switch cards[1]{
            case "棒":
                image_Round2.image=UIImage(named: "bar.png")
            case "老虎":
                image_Round2.image=UIImage(named: "tiger.png")
            case "雞":
                image_Round2.image=UIImage(named: "chicken.png")
            case "蟲":
                image_Round2.image=UIImage(named: "warm.png")
            default:
                break
            }
            image_shot_AI.image=image_Round2.image!
        case 2:
            switch cards[2]{
            case "棒":
                image_Round3.image=UIImage(named: "bar.png")
            case "老虎":
                image_Round3.image=UIImage(named: "tiger.png")
            case "雞":
                image_Round3.image=UIImage(named: "chicken.png")
            case "蟲":
                image_Round3.image=UIImage(named: "warm.png")
            default:
                break
            }
            image_shot_AI.image=image_Round3.image!
        case 3:
            switch cards[3]{
            case "棒":
                image_Round4.image=UIImage(named: "bar.png")
            case "老虎":
                image_Round4.image=UIImage(named: "tiger.png")
            case "雞":
                image_Round4.image=UIImage(named: "chicken.png")
            case "蟲":
                image_Round4.image=UIImage(named: "warm.png")
            default:
                break
            }
            image_shot_AI.image=image_Round4.image!
            if score > score_AI {
             performSegue(withIdentifier: "showPopover", sender: nil)
            }
            else if score < score_AI {
             performSegue(withIdentifier: "showPopover_lose", sender: nil)
            }
            else {
             performSegue(withIdentifier: "showPopover_draw", sender: nil)
            }
        default:
            break
        }
    }
    
    var round = 0
    var cards = ["棒", "老虎", "雞", "蟲"]
    var shot_confirm = 0
    var score = 0
    var score_AI = 0
    
    @IBOutlet weak var label_Score: UILabel!
    @IBOutlet weak var label_Score_AI: UILabel!
    
    @IBOutlet weak var image_Round1: UIImageView!
    @IBOutlet weak var image_Round2: UIImageView!
    @IBOutlet weak var image_Round3: UIImageView!
    @IBOutlet weak var image_Round4: UIImageView!
    
    @IBOutlet weak var image_shot_AI: UIImageView!
    @IBOutlet weak var image_Shot: UIImageView!
    
    @IBOutlet weak var image_Win_AI: UIImageView!
    @IBOutlet weak var image_Win: UIImageView!
    @IBOutlet weak var image_draw: UIImageView!
    
    @IBOutlet weak var button_Bar: UIButton!
    @IBOutlet weak var button_Tiger: UIButton!
    @IBOutlet weak var button_Chicken: UIButton!
    @IBOutlet weak var button_Warm: UIButton!
    @IBOutlet weak var button_Shot_Confirm: UIButton!
    
    @IBAction func button_Cards_Selection(_ sender: UIButton) {
        switch sender {
        case button_Bar:
            button_Bar.frame=CGRect(x: 38, y: 460, width: 77, height: 114)
            button_Tiger.frame=CGRect(x: 115, y: 475, width: 77, height: 114)
            button_Chicken.frame=CGRect(x: 192, y: 475, width: 77, height: 114)
            button_Warm.frame=CGRect(x: 269, y: 475, width: 77, height: 114)
            shot_confirm=0
        case button_Tiger:
            button_Tiger.frame=CGRect(x: 115, y: 460, width: 77, height: 114)
            button_Bar.frame=CGRect(x: 38, y: 475, width: 77, height: 114)
            button_Chicken.frame=CGRect(x: 192, y: 475, width: 77, height: 114)
            button_Warm.frame=CGRect(x: 269, y: 475, width: 77, height: 114)
            shot_confirm=1
        case button_Chicken:
            button_Chicken.frame=CGRect(x: 192, y: 460, width: 77, height: 114)
            button_Bar.frame=CGRect(x: 38, y: 475, width: 77, height: 114)
            button_Tiger.frame=CGRect(x: 115, y: 475, width: 77, height: 114)
            button_Warm.frame=CGRect(x: 269, y: 475, width: 77, height: 114)
            shot_confirm=2
        case button_Warm:
            button_Warm.frame=CGRect(x: 269, y: 460, width: 77, height: 114)
            button_Bar.frame=CGRect(x: 38, y: 475, width: 77, height: 114)
            button_Tiger.frame=CGRect(x: 115, y: 475, width: 77, height: 114)
            button_Chicken.frame=CGRect(x: 192, y: 475, width: 77, height: 114)
            shot_confirm=3
        default:
            break
        }
    }
    
    @IBAction func button_ShotConfirm_Press(_ sender: Any) {
        image_Win.image=nil
        image_Win_AI.image=nil
        image_draw.image=nil
        switch shot_confirm {
        case 0:
            if cards[round]=="蟲" {
                image_Win_AI.image=UIImage(named: "win.png")
                score_AI+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            else if cards[round]=="棒" {
                image_draw.image=UIImage(named: "draw.png")
            }
            else {
                image_Win.image=UIImage(named: "win.png")
                score+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            show_AI_card()
            round+=1
            image_Shot.image=button_Bar.currentBackgroundImage
            button_Bar.frame=CGRect(x: 38, y: 475, width: 77, height: 114)
            button_Bar.isEnabled=false
        case 1:
            if cards[round]=="棒" {
                image_Win_AI.image=UIImage(named: "win.png")
                score_AI+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            else if cards[round]=="老虎" {
                image_draw.image=UIImage(named: "draw.png")
            }
            else {
                image_Win.image=UIImage(named: "win.png")
                score+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            show_AI_card()
            round+=1
            image_Shot.image=button_Tiger.currentBackgroundImage
            button_Tiger.frame=CGRect(x: 115, y: 475, width: 77, height: 114)
            button_Tiger.isEnabled=false
        case 2:
            if cards[round]=="蟲" {
                image_Win.image=UIImage(named: "win.png")
                score+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            else if cards[round]=="雞" {
                image_draw.image=UIImage(named: "draw.png")
            }
            else {
                image_Win_AI.image=UIImage(named: "win.png")
                score_AI+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            show_AI_card()
            round+=1
            image_Shot.image=button_Chicken.currentBackgroundImage
            button_Chicken.frame=CGRect(x: 192, y: 475, width: 77, height: 114)
            button_Chicken.isEnabled=false
        case 3:
            if cards[round]=="棒" {
                image_Win.image=UIImage(named: "win.png")
                score+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            else if cards[round]=="蟲" {
                image_draw.image=UIImage(named: "draw.png")
            }
            else {
                image_Win_AI.image=UIImage(named: "win.png")
                score_AI+=1
                label_Score.text=String(score)
                label_Score_AI.text=String(score_AI)
            }
            show_AI_card()
            round+=1
            image_Shot.image=button_Warm.currentBackgroundImage
            button_Warm.frame=CGRect(x: 269, y: 475, width: 77, height: 114)
            button_Warm.isEnabled=false
        default:
            break
        }
    }
    
    @IBAction func button_Playagain(_ sender: Any) {
        viewDidLoad()
    }
}
