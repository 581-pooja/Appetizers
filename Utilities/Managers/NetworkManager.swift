//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 29/06/25.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://mocki.io/v1/b9e2d0bc-a2f4-42ae-948a-ab3883989ea8"
    private let appetizerURL = baseURL // + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>)-> Void){
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, response, error in
            // if error is nil then move on skip the block | else error is present go in block and say unable to Complete
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            // if response not nil then cast as HTTPURLResponse, and take response & check statusCode of response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            // if data is not nil then data stores given data else in else block return error failure & return
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request)) // property result which returns array of appetizer
            }
            catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume() // to fire of the network calls
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        // if appetizer has valid unique key i.e. cacheKey we are saying then check if we have object already yes then return image form cache else go on
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        // if image urlstring is valid stringURL then ok else return nil
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            // if we can have image of data then store in cache for nextTime
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
    
}

// getAppetizers
// Above function is escaping closure returns result i.e array of Appetizer or Error
// since we conform APError to Error now instead of Error u can use APError
// URL : A value that identifies the location of a resource, such as an item on a remote server or the path to a local file. (Returns `nil` if a `URL` cannot be formed with the string)

// For Image Network Call: we don't need error every time just show placeholder
// @escaping closure (Imp)

// downloadImage
// Imp : Cache Image logic: 7.01 - 7.03
