//
//  MovieListViewController.swift
//  Desafio
//
//  Created by Gabriel Carvalho on 12/10/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    let mls = MovieListeService()
    private var movies = [MovieModel]()

    
    private let tableView: UITableView = {
    
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    
        
        return tableView
    }()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        mls.fetchData() {[weak self] Result in
            switch Result {
            case.success(let catalog):
                self?.movies = catalog.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case.failure(let error):
              print(error)
            }
        }
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}




extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
             return UITableViewCell()
         }
        
        mls.fetchImage(path: movies[indexPath.row].poster_path) { Image in
            cell.image.image = Image
        }
        
        cell.label.text = movies[indexPath.row].title
        cell.label2.text = "⭐ \(movies[indexPath.row].vote_average)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
