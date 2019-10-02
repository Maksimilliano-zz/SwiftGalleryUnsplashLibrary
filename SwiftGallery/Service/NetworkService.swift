//
//  NetworkService.swift
//  SwiftGallery
//
//  Created by Максим Чижавко on 23/08/2019.
//  Copyright © 2019 Максим Чижавко. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(serachterm: String, complition: @escaping (Data?, Error?) -> Void ) {
        let parameters = self.prepareParameters(searchTerm: serachterm)
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = self.prepareHeader()
        request.httpMethod = "get"
        let task = self.createDataTask(from: request, complition: complition)
        task.resume()
    }
    
    private func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID 8cfbfb0008f84ad1e460b867c465b1271c58d577146d1d5d6cce2a5d517b5c37"
        return headers
    }
    
    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map{
            URLQueryItem(name: $0, value: $1)
        }
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, complition: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, responce, error) in
            DispatchQueue.main.async {
                complition(data, error)
            }
        })
    }
    
}
