//
//  PostChargeDialog.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/22.
//

import UIKit

class PostChargeDialog: UIView {
    
    var onPostConfirmed: (() -> Void)?
    var onPostCancelled: (() -> Void)?
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let postTokenIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "post_token")) // 用你项目的金币图标
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let usageNoticeLabel: UILabel = {
        let label = UILabel()
        label.text = "Reminder"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "It will cost 10 coins."
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dismissPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let confirmPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.35, blue: 0.47, alpha: 1)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        addSubview(container)
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: 280).isActive = true
        
        container.addSubview(postTokenIcon)
        container.addSubview(usageNoticeLabel)
        container.addSubview(costDetailLabel)
        container.addSubview(dismissPostButton)
        container.addSubview(confirmPostButton)
        
        NSLayoutConstraint.activate([
            postTokenIcon.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            postTokenIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            postTokenIcon.widthAnchor.constraint(equalToConstant: 60),
            postTokenIcon.heightAnchor.constraint(equalToConstant: 60),
            
            usageNoticeLabel.topAnchor.constraint(equalTo: postTokenIcon.bottomAnchor, constant: 12),
            usageNoticeLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            costDetailLabel.topAnchor.constraint(equalTo: usageNoticeLabel.bottomAnchor, constant: 8),
            costDetailLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            costDetailLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            dismissPostButton.topAnchor.constraint(equalTo: costDetailLabel.bottomAnchor, constant: 20),
            dismissPostButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            dismissPostButton.heightAnchor.constraint(equalToConstant: 48),
            dismissPostButton.widthAnchor.constraint(equalToConstant: 100),
            
            confirmPostButton.topAnchor.constraint(equalTo: costDetailLabel.bottomAnchor, constant: 20),
            confirmPostButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            confirmPostButton.heightAnchor.constraint(equalToConstant: 48),
            confirmPostButton.widthAnchor.constraint(equalToConstant: 100),
            
            confirmPostButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20)
        ])
        
        dismissPostButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        confirmPostButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
    }
    
    @objc private func cancelTapped() {
        onPostCancelled?()
        removeFromSuperview()
    }
    
    @objc private func confirmTapped() {
        onPostConfirmed?()
        removeFromSuperview()
    }
    
    func show(in parent: UIView, cost: Int) {
        frame = parent.bounds
        parent.addSubview(self)
        costDetailLabel.text = "It will cost \(cost) coins."
    }
}
