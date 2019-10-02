//
//  NetworkDataFetcher.swift
//  SwiftGallery
//
//  Created by Максим Чижавко on 23/08/2019.
//  Copyright © 2019 Максим Чижавко. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchImagies(searchTerms: String, complition: @escaping (SearchResult?) ->()) {
        networkService.request(serachterm: searchTerms) { (data, error) in
            if let error = error {
                print("Oops... we got an arror \(error.localizedDescription)")
                complition(nil)
            }
            
            let decode = self.decodeJSON(type: SearchResult.self, from: data)
            complition(decode)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
         let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError  {
            print("Filed to decode JSON \(jsonError.localizedDescription)")
            return nil
        }
    }
}
