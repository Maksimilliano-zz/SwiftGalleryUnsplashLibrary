//
//  SearchResult.swift
//  SwiftGallery
//
//  Created by Максим Чижавко on 23/08/2019.
//  Copyright © 2019 Максим Чижавко. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let total: Int
    let results: [UnsplashPhotos]
}

struct UnsplashPhotos: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue:String]
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

