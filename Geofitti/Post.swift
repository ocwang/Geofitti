//
//  Post.swift
//  Geofitti
//
//  Created by Bryan Ye on 26/06/2016.
//  Copyright © 2016 Geofitti. All rights reserved.
//

import Foundation
import Parse
import Bond

class Post: PFObject, PFSubclassing {
    
    var photoUploadTask: UIBackgroundTaskIdentifier?
    
    var image: Observable<UIImage?> = Observable(nil)
    
    
    @NSManaged var imageFile: PFFile?
    
    static func parseClassName() -> String {
        return "Post"
    }
    
    override init() {
        super.init()
    }
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    func uploadPost() {
        if let image = image.value {
            
            guard let imageData = UIImageJPEGRepresentation(image, 1.0) else {return}
            guard let imageFile = PFFile(name: "image.jpg", data: imageData) else {return}
            
            self.imageFile = imageFile
            
            photoUploadTask = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler{ () -> Void in
                UIApplication.sharedApplication().endBackgroundTask(self.photoUploadTask!)
            }
            
            
            saveInBackgroundWithBlock() { (success: Bool, error: NSError?) in
                
                UIApplication.sharedApplication().endBackgroundTask(self.photoUploadTask!)
            }
        }
    }
    
    func downloadImage() {
        if (image.value == nil) {
            imageFile?.getDataInBackgroundWithBlock { (data: NSData?, error: NSError?) -> Void in
                if let data = data {
                    let image = UIImage(data: data, scale:1.0)!
                    self.image.value = image
                }
                
            }
        }
    }
    

}