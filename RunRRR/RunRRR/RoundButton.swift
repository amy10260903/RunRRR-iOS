//
//  MissionsDetailViewController.swift
//  RunRRR
//
//  Created by Starla on 2017/4/16.
//  Copyright © 2017年 EEECamp. All rights reserved.
//

import UIKit

class MissionsDetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var ShowImage: UIImageView!
    @IBOutlet weak var priorityLabel: PriorityLabel!
    @IBAction func exitMissionDetailButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var missionContentTextView: UITextView!
    @IBOutlet weak var missionNameLabel: UILabel!
    var mission : MissionsData?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMissionDetail()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    private func setupMissionDetail(){
        if let missionPriority = mission?.type{
            switch(missionPriority){
            case "1":
                priorityLabel.text = "緊"
            case "2":
                priorityLabel.text = "主"
            case "3":
                priorityLabel.text = "支"
            default:
                priorityLabel.text = "?"
            }
        }
        
        
        missionNameLabel.text = mission?.title
        missionContentTextView.text = mission?.content
    }
    @IBAction func choosePhoto(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let cameraAction = UIAlertAction(title: "USE CAMERA", style: .default){
            (action) in
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let photoLibraryAction = UIAlertAction(title: "USE PHOTO LIBRARY", style: .default){
            (action) in
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(chosenImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        ShowImage.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

}


@IBDesignable class CloseButton: UIButton {
    @IBInspectable var CornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var BorderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable var BorderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = BorderColor.cgColor
        }
    }
    
}


@IBDesignable class PriorityLabel: UILabel {
    @IBInspectable var CornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var BorderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable var BorderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = BorderColor.cgColor
        }
    }
    
}




@IBDesignable class CameraButton: UIButton {
    @IBInspectable var CornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var BorderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable var BorderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = BorderColor.cgColor
        }
    }
    
}




