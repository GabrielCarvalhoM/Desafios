//
//  MovieListService.swift
//  Desafio
//
//  Created by Gabriel Carvalho on 12/10/22.
//

import Foundation
import UIKit

class MovieListeService {
    
    var movies = [MovieModel]()
    
    func fetchData(  completion: @escaping (Result<CatalogModel, Error>) -> Void){
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4195ba418282a09d4cffb2ad77233291")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                
                do {
                    let json = try JSONDecoder().decode(CatalogModel.self, from: data)
                    completion(.success(json))
                    
                } catch ( let error) {
                    completion(.failure(error))
                }
                
            } else {
                print("erro")
                return
            }
        }.resume()
    }
    
    
    
    let url2 = "https://image.tmdb.org/t/p/w500"
    
  
    
    func fetchImage(path: String, completion: @escaping (UIImage?) -> Void ) {
     
        guard let url = URL(string: url2 + path) else {
            completion(nil)
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return }
            DispatchQueue.main.async() {
                let image = UIImage(data: data)
                    completion(image)
            }
        }.resume()
    }
    
    
    
}
