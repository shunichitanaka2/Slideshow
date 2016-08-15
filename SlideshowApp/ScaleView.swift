//
//  ScaleView.swift
//  SlideshowApp
//
//  Created by 田中舜一 on 2016/08/03.
//  Copyright © 2016年 田中舜一. All rights reserved.
//

import UIKit

class ScaleView: UIViewController {
    
    
    @IBOutlet weak var ScalePic: UIImageView!
    
    var largePic: UIImageView!
    
    let myImage = UIImage(named: "Picture/cat2.jpg")
    
    override func viewDidLoad() {
        //
        
        
        ScalePic.image = largePic.image
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    
    
    

}
