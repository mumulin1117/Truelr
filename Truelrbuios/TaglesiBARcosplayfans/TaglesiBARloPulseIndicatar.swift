//
//  TaglesiBARloPulseIndicatar.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit

class TaglesiBARloPulseIndicatar {
    
    static let swordGallery = TaglesiBARloPulseIndicatar()
    private var weaponCraft: UIWindow?
        private var relicArchive: UIView?
        private var artifactRoom: UIActivityIndicatorView?
        private var emblemStudio: UILabel?
        private var insigniaBoard: UIImageView?
    // MARK: - Show Loading
    class func show(info:String) {
        swordGallery.TaglesiBARsigilMaker(TaglesiBARstageLight: info, sTaglesiBARpotlightEffect: nil, TaglesiBARDirector: true)
    }
    
    // MARK: - Show Info
    class func showInfo(withStatus message: String) {
        swordGallery.TaglesiBARsigilMaker(TaglesiBARstageLight: message, sTaglesiBARpotlightEffect: UIImage(systemName: "info.circle"), TaglesiBARDirector: false)
    }
    
    // MARK: - Show Success
    class func showSuccess(withStatus message: String) {
        swordGallery.TaglesiBARsigilMaker(TaglesiBARstageLight: message, sTaglesiBARpotlightEffect: UIImage(systemName: "checkmark.circle.fill"), TaglesiBARDirector: false)
    }
    
    // MARK: - Dismiss
    class func dismiss() {
        swordGallery.TaglesiBARcrestLibrary()
    }
    
    // MARK: - Core View
    private func TaglesiBARsigilMaker(TaglesiBARstageLight: String, sTaglesiBARpotlightEffect: UIImage?, TaglesiBARDirector: Bool) {
            TaglesiBARcrestLibrary()
            
            let TaglesiBARwindow = UIWindow(frame: UIScreen.main.bounds)
            TaglesiBARwindow.windowLevel = .alert + 1
            TaglesiBARwindow.backgroundColor = .clear
            
            let TaglesiBARcontainer = UIView()
            TaglesiBARcontainer.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            TaglesiBARcontainer.layer.cornerRadius = 14
            TaglesiBARcontainer.translatesAutoresizingMaskIntoConstraints = false
            
            let TaglesiBARstack = UIStackView()
            TaglesiBARstack.axis = .vertical
            TaglesiBARstack.alignment = .center
            TaglesiBARstack.spacing = 12
            TaglesiBARstack.translatesAutoresizingMaskIntoConstraints = false
            
            let TaglesiBARindicatorView = UIActivityIndicatorView(style: .large)
            TaglesiBARindicatorView.color = .white
        TaglesiBARindicatorView.stopAnimating()
            let imageView = UIImageView(image: sTaglesiBARpotlightEffect)
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
            
            let labelTaglesiBAR = UILabel()
            labelTaglesiBAR.text = TaglesiBARstageLight
            labelTaglesiBAR.textColor = .white
            labelTaglesiBAR.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            labelTaglesiBAR.numberOfLines = 2
            labelTaglesiBAR.textAlignment = .center
            
            if TaglesiBARDirector {
                TaglesiBARstack.addArrangedSubview(TaglesiBARindicatorView)
                TaglesiBARindicatorView.startAnimating()
            } else if let icon = sTaglesiBARpotlightEffect {
                TaglesiBARstack.addArrangedSubview(imageView)
            }
            TaglesiBARstack.addArrangedSubview(labelTaglesiBAR)
            
            TaglesiBARcontainer.addSubview(TaglesiBARstack)
            TaglesiBARwindow.addSubview(TaglesiBARcontainer)
            
            NSLayoutConstraint.activate([
                TaglesiBARcontainer.centerXAnchor.constraint(equalTo: TaglesiBARwindow.centerXAnchor),
                TaglesiBARcontainer.centerYAnchor.constraint(equalTo: TaglesiBARwindow.centerYAnchor),
                TaglesiBARcontainer.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                
                TaglesiBARstack.topAnchor.constraint(equalTo: TaglesiBARcontainer.topAnchor, constant: 20),
                TaglesiBARstack.bottomAnchor.constraint(equalTo: TaglesiBARcontainer.bottomAnchor, constant: -20),
                TaglesiBARstack.leadingAnchor.constraint(equalTo: TaglesiBARcontainer.leadingAnchor, constant: 16),
                TaglesiBARstack.trailingAnchor.constraint(equalTo: TaglesiBARcontainer.trailingAnchor, constant: -16),
            ])
            
            TaglesiBARwindow.makeKeyAndVisible()
            
            weaponCraft = TaglesiBARwindow
            relicArchive = TaglesiBARcontainer
            artifactRoom = TaglesiBARindicatorView
            emblemStudio = labelTaglesiBAR
            insigniaBoard = imageView
            
            // 轻微缩放动画
            TaglesiBARcontainer.alpha = 0
            TaglesiBARcontainer.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseOut,
                           animations: {
                TaglesiBARcontainer.alpha = 1
                TaglesiBARcontainer.transform = .identity
            })
            
            // 自动隐藏非 loading 的提示
            if !TaglesiBARDirector {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    self?.TaglesiBARcrestLibrary()
                }
            }
        }
        
        private func TaglesiBARcrestLibrary() {
            self.weaponCraft?.isHidden = true
            self.weaponCraft = nil
            self.relicArchive = nil
            self.artifactRoom?.stopAnimating()
            self.artifactRoom = nil
            self.emblemStudio = nil
        }
    }

