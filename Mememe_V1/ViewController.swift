//
//  ViewController.swift
//  Mememe_V1
//
//  Created by Nicole on 3/25/16.
//  Copyright © 2016 Nicole. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var albumButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    
    }

    @IBAction func takeAPicture(sender: AnyObject) {
        //
        // create an UIImagePickerController
        let cameraController = UIImagePickerController()
        cameraController.delegate = self
        cameraController.sourceType = .Camera
        
        presentViewController(cameraController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImage(sender: AnyObject) {
        
        //
        // create an UIImagePickerController
        //
        let pickerController = UIImagePickerController()
        
        //
        // set the delegate
        pickerController.delegate = self
        
        //
        // no editing of the photo
        // select from photolibrary
        //
        pickerController.allowsEditing = false
        pickerController.sourceType = .PhotoLibrary
        
        //
        // show the image when 'Image' is clicked
        //
        presentViewController(pickerController, animated: true, completion: nil)
    }

    //
    // receiving the image picked by the user from library
    //
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        //
        // get the picked image
        // set ".ScaleAspectFill" so the image would be displayed correctly
        //
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //
            // imageView is the IBOulet defined above
            //
            imageView.contentMode = .ScaleAspectFill
            imageView.image = image
        
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}