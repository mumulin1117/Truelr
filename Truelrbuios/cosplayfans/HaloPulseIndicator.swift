//
//  HaloPulseIndicator.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit

class HaloPulseIndicator {
    
    static let shared = HaloPulseIndicator()
    private var overlayWindow: UIWindow?
        private var containerView: UIView?
        private var indicator: UIActivityIndicatorView?
        private var messageLabel: UILabel?
        private var iconView: UIImageView?
    // MARK: - Show Loading
    class func show(info:String) {
        shared.present(message: info, icon: nil, isLoading: true)
    }
    
    // MARK: - Show Info
    class func showInfo(withStatus message: String) {
        shared.present(message: message, icon: UIImage(systemName: "info.circle"), isLoading: false)
    }
    
    // MARK: - Show Success
    class func showSuccess(withStatus message: String) {
        shared.present(message: message, icon: UIImage(systemName: "checkmark.circle.fill"), isLoading: false)
    }
    
    // MARK: - Dismiss
    class func dismiss() {
        shared.dismissIndicator()
    }
    
    // MARK: - Core View
    private func present(message: String, icon: UIImage?, isLoading: Bool) {
            dismissIndicator()
            
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.windowLevel = .alert + 1
            window.backgroundColor = .clear
            
            let container = UIView()
            container.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            container.layer.cornerRadius = 14
            container.translatesAutoresizingMaskIntoConstraints = false
            
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .center
            stack.spacing = 12
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            let indicatorView = UIActivityIndicatorView(style: .large)
            indicatorView.color = .white
        indicatorView.stopAnimating()
            let imageView = UIImageView(image: icon)
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
            
            let label = UILabel()
            label.text = message
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            label.numberOfLines = 2
            label.textAlignment = .center
            
            if isLoading {
                stack.addArrangedSubview(indicatorView)
                indicatorView.startAnimating()
            } else if let icon = icon {
                stack.addArrangedSubview(imageView)
            }
            stack.addArrangedSubview(label)
            
            container.addSubview(stack)
            window.addSubview(container)
            
            NSLayoutConstraint.activate([
                container.centerXAnchor.constraint(equalTo: window.centerXAnchor),
                container.centerYAnchor.constraint(equalTo: window.centerYAnchor),
                container.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                
                stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
                stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
                stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            ])
            
            window.makeKeyAndVisible()
            
            overlayWindow = window
            containerView = container
            indicator = indicatorView
            messageLabel = label
            iconView = imageView
            
            // 轻微缩放动画
            container.alpha = 0
            container.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseOut,
                           animations: {
                container.alpha = 1
                container.transform = .identity
            })
            
            // 自动隐藏非 loading 的提示
            if !isLoading {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    self?.dismissIndicator()
                }
            }
        }
        
        private func dismissIndicator() {
            self.overlayWindow?.isHidden = true
            self.overlayWindow = nil
            self.containerView = nil
            self.indicator?.stopAnimating()
            self.indicator = nil
            self.messageLabel = nil
        }
    }

