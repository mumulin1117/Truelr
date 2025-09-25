//
//  REallListchiwCell.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/24.
//

import UIKit

class REallListchiwCell: UITableViewCell {
    
     let avatarView = UIImageView()
     let nameLabel = UILabel()
     let sayiedLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        avatarView.maskedlabeVobor(enter: 24)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        sayiedLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.contentMode = .scaleAspectFill
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 16)
        sayiedLabel.font = .systemFont(ofSize: 14)
        sayiedLabel.textColor = UIColor(red: 0.98, green: 0.37, blue: 0.55, alpha: 1)
        
       
        contentView.addSubview(avatarView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(sayiedLabel)
       
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 48),
            avatarView.heightAnchor.constraint(equalToConstant: 48),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor),
            
            sayiedLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 12),
            sayiedLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 4),
            sayiedLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -14),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
}
