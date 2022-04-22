//
//  ImagesViewController.swift
//  homework 18
//
//  Created by Volha Furs on 22.04.22.
//

import UIKit

class ImagesViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var ImageView: UIImageView!
    
    var imagesArray = [UIImage]()
    var imageURLArray = [URL]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func transitToGalleryVC() {
        let storyboard = UIStoryboard(name: "GalleryViewController", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! GalleryViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.imagesArrayFromImageController = imagesArray
        vc.imageURLArrayFromImageController = imageURLArray
    }
    
    @IBAction func onAddNewImagesButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func onSeeButton(_ sender: Any) {
        print(imagesArray)
        transitToGalleryVC()
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage]
        let imageURL = info[.referenceURL]
        
        if imageURLArray.contains(imageURL as! URL){
            print("already added")
        } else {
            imageURLArray.append(info[.referenceURL] as! URL)
            imagesArray.append(image as! UIImage)
            ImageView.image = image as! UIImage
            ImageView.contentMode = .scaleAspectFill
        }
        picker.dismiss(animated: true, completion: nil)
    }
    

}
