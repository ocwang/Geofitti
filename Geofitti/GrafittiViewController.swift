//
//  GrafittiViewController.swift
//  Geofitti
//
//  Created by Bryan Ye on 25/06/2016.
//  Copyright © 2016 Geofitti. All rights reserved.
//

import UIKit

class GrafittiViewController: UIViewController {
    
    var image: UIImage!

    @IBOutlet weak var grafittiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grafittiImageView.image = image
        // Do any additional setup after loading the view.
        
        
        let drawView = DrawView_BuildingPaths(frame: self.view.frame)
        view.insertSubview(drawView, belowSubview: grafittiImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
