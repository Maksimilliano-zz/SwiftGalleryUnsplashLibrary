//
//  MainTabBarController.swift
//  SwiftGallery
//
//  Created by Максим Чижавко on 21/08/2019.
//  Copyright © 2019 Максим Чижавко. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray

        let photosVC =  PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        
        viewControllers = [
            generateTabBarController(rootVC: photosVC, image: #imageLiteral(resourceName: "picturies"), title: "Photos"), generateTabBarController(rootVC: ViewController(), image: #imageLiteral(resourceName: "favorite"), title: "Favotites")
        ]
        
    }
    
    private func generateTabBarController(rootVC: UIViewController ,image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
    

    

}
