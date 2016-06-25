//
//  ViewController.swift
//  Geofitti
//
//  Created by Chase Wang on 6/25/16.
//  Copyright © 2016 Geofitti. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawView = DrawView_DisplayingRasterImages.init(frame: self.view.frame)
        self.view.addSubview(drawView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }


}

