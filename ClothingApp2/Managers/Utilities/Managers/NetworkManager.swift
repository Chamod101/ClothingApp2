//
//  NetworkManager.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-18.
//

import UIKit

final class NetworkManager{
    
    static let shared = NetworkManager()
    private let cashe = NSCache<NSString, UIImage>()
        
    private let productURL = "https://clothsapi.onrender.com/products"
    

    private init(){}
    
    func getProducts(completed: @escaping (Result<[Product], PError>) -> Void){
        guard let url = URL(string: productURL) else{
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse,  response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let products =  try decoder.decode([Product].self, from: data)
                print(data)
                
                completed(.success(products))
            } catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        let casheKey = NSString(string: urlString)
        
        if let image = cashe.object(forKey: casheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response, error in
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cashe.setObject(image, forKey: casheKey)
            completed(image)
        }
        
        task.resume()
        
    }
}
