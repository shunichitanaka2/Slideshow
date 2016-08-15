//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田中舜一 on 2016/08/01.
//  Copyright © 2016年 田中舜一. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    
    @IBOutlet weak var RepeatButton: UIButton!
    @IBOutlet weak var ProgressButton: UIButton!
    @IBOutlet weak var PrevButton: UIButton!
    
    
    @IBOutlet weak var tesPic: UIImageView!
    
    let gzo:[UIImage] = [UIImage(named: "Picture/cat1.jpg")!,UIImage(named: "Picture/cat2.jpg")!,UIImage(named: "Picture/cat3.jpg")!,UIImage(named: "Picture/cat4.jpg")!]
    
    var count = 0
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myImage = UIImage(named: "Picture/cat1.jpg")
        
        tesPic.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(ViewController.imageTapped(_:))))
 
        tesPic.image = myImage
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        NSLog("%d",count)
        
        count = (count + 1)%4
        tesPic.image = gzo[count]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toScaleView") {
            
            let scaleView:ScaleView = segue.destinationViewController as! ScaleView
            scaleView.largePic = tesPic
            
        }
    }
    
    
    func imageTapped (sender:UIGestureRecognizer) {
        
        if(!timer.valid){
            performSegueWithIdentifier("toScaleView", sender: nil)
        }
    }
    
    @IBAction func ProgressButton(sender: AnyObject) {
        if(!timer.valid){
            count = (count + 1)%4
            
            tesPic.image = gzo[count]
        }
    }
    
    
    @IBAction func PrevButton(sender: AnyObject) {
        if(!timer.valid){
            count = (count + 3)%4
            
            tesPic.image = gzo[count]
        }
    }
    
    
    @IBAction func RepeatButton(sender: AnyObject) {
        
        switch RepeatButton.titleLabel?.text {
        case "再生"? :
            RepeatButton.setTitle("停止", forState: UIControlState.Normal)
            
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            ProgressButton.titleLabel?.textColor = UIColor.grayColor()
            PrevButton.titleLabel?.textColor = UIColor.grayColor()
            
        default:
            RepeatButton.setTitle("再生", forState:UIControlState.Normal)
            timer.invalidate()
            ProgressButton.titleLabel?.textColor = UIColor.blackColor()
            PrevButton.titleLabel?.textColor = UIColor.blackColor()
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

}







