//
//  PhotoCell.swift
//  SwiftGallery
//
//  Created by Максим Чижавко on 26/08/2019.
//  Copyright © 2019 Максим Чижавко. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
    
    static let reuseId = "photoCell"
    
    private let checkmark: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "checked"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhotos! {
        didSet {
            let photoURL = unsplashPhoto.urls["regular"]
            guard let imageURL = photoURL, let url = URL(string: imageURL) else { return }
            photoImageView.sd_setImage(with: url, completed: nil)
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateSelectedState()
        setupPhotoImageView()
        setupCheckmark()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPhotoImageView() {
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    private func setupCheckmark() {
        addSubview(checkmark)
        checkmark.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -8).isActive = true
        checkmark.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func updateSelectedState() {
        photoImageView.alpha = isSelected ? 0.7 : 1
        checkmark.alpha = isSelected ? 1 : 0
    }
    
}
