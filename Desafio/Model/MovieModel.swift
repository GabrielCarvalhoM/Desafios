//
//  MovieModel.swift
//  Desafio
//
//  Created by Gabriel Carvalho on 12/10/22.
//

import Foundation


struct CatalogModel: Codable {
    
    let page: Int
    let results: [MovieModel]
}


struct MovieModel: Codable {

    let title: String
    let vote_average: Float
    let poster_path: String
    
}





