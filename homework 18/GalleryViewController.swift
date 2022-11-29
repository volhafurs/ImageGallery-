//
//  GalleryViewController.swift
//  homework 18
//
//  Created by Volha Furs on 22.04.22.
//

import UIKit

class GalleryViewController: UIViewController {

    var imagesArrayFromImageController = [UIImage]()
    var imageURLArrayFromImageController = [URL]()
    
    private var CollectionView : UICollectionView!
    private var CellWidth = 170
    private var CellHeight = 170
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(imagesArrayFromImageController)
        print("abbbb")
        CollectionViewCreation()
    }
    
    private func CollectionViewCreation() {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: CellWidth, height: CellHeight)
        flowlayout.scrollDirection = .vertical
        CollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowlayout)
        CollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        CollectionView.delegate = self
        CollectionView.dataSource = self
        view.addSubview(CollectionView)
    }

}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArrayFromImageController.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .black
        cell.imageView.image = imagesArrayFromImageController[indexPath.row]
        return cell
    }
}
