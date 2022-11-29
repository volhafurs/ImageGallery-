//
//  CollectionViewCell.swift
//  homework 18
//
//  Created by Volha Furs on 22.04.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    
    override init(frame: CGRect){
        imageView = UIImageView()
        super .init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
}
