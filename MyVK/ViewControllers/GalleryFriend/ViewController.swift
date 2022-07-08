//
//  ViewController.swift
//  testGallery
//
//  Created by Rodion Molchanov on 20.04.2021.
//

import UIKit

class ViewController: UIViewController {
    var imageGallerySelectedIndexPath = 0
    var imageGalleryFoto = [UIImage]()


    @IBOutlet weak var galleryView: GalleryHorisontalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        galleryView.setImages(images: imageGalleryFoto, imageGallerySelectedIndexPath: imageGallerySelectedIndexPath)
    }



}

