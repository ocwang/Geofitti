//
//  CameraViewController.swift
//  Geofitti
//
//  Created by Chase Wang on 6/25/16.
//  Copyright © 2016 Geofitti. All rights reserved.
//

import UIKit
import GoogleMaps


class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(37.422089, -122.084047)
        marker.title = "GooglePlex"
        marker.snippet = "USA"
        let camera = GMSCameraPosition.cameraWithLatitude(37.422089, longitude: -122.084047, zoom:17.5, bearing:30, viewingAngle:40)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        self.view = mapView
        let cameraButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        cameraButton.setTitle("Camera", forState: .Normal)
        cameraButton.addTarget(self, action: #selector(OpenCamera(_:)), forControlEvents: .TouchUpInside)
        cameraButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        self.view.addSubview(cameraButton)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func OpenCamera(sender: UIButton!){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    
    
    //    @IBAction func openCamera(sender: UIButton) {
    //
    //        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
    //            let imagePicker = UIImagePickerController()
    //            imagePicker.delegate = self
    //            imagePicker.sourceType = .Camera
    //            imagePicker.allowsEditing = false
    //            self.presentViewController(imagePicker, animated: true, completion: nil)
    //        }
    //    }
    


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
    
    
        dismissViewControllerAnimated(true) {
            
            
            self.performSegueWithIdentifier("editPhotoSegue", sender: self)
        }
    }

    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editPhotoSegue" {
            let destination = segue.destinationViewController as! GrafittiViewController
            destination.image = image
        }
    }
    
    @IBAction func unwindToMaps(segue: UIStoryboardSegue) {
        
    }
    
}

