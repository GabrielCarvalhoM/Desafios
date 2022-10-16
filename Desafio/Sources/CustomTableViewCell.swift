//
//  CustomTableViewCell.swift
//  Desafio
//
//  Created by Gabriel Carvalho on 12/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    
    lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        label.text = ""
        
        return label
    }()
    
    lazy var label2: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        label.text = ""
        
        return label
    }()
    
    lazy var image: UIImageView = {
       
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
     
        
        return image
    }()
    
    
    
    static let identifier = "CustomTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.backgroundColor = .white
        contentView.addSubview(label)
        contentView.addSubview(label2)
        contentView.addSubview(image)
        prepareConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func prepareConstraints() {
        NSLayoutConstraint.activate([
        
            self.label.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 10),
            self.label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            self.label2.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
            self.label2.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: -2),
            
            self.image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            self.image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            self.image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            self.image.widthAnchor.constraint(equalToConstant: 80),
            self.image.heightAnchor.constraint(equalToConstant: 40)
        
        ])
    }
    
    
  
}
