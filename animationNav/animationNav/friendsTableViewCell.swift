//
//  friendsTableViewCell.swift
//  animationNav
//
//  Created by Takamiya Kengo on 2021/01/14.
//

import UIKit

class friendsTableViewCell: UITableViewCell {

    let label:UILabel = {
        let label = UILabel()
        label.text = ""
        label.backgroundColor = .black
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
