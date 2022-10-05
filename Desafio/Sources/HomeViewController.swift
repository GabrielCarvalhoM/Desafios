//
//  HomeViewController.swift
//  Desafio
//
//  Created by Gabriel Carvalho on 03/10/22.
//

import UIKit


final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .green
        navigationItem.title = "HomeViewController"
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
        view.addSubview(button)
        button.setTitle("ir para próxima tela", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    @objc func buttonClicked() {
        
        let DetailsViewController = DetailsViewController()
        navigationController?.pushViewController(DetailsViewController, animated: true)
        
    }
    
    
}
