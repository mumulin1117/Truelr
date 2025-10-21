//
//  HaloPulseIndicator.swift
//  Truelrbuios
//
//  Created by mumu on 2025/10/21.
//

import UIKit

class HaloPulseIndicator {
    
    static let shared = HaloPulseIndicator()
    private var pulseWindow: UIWindow?
    private var pulseView: UIView?
    private var statusLabel: UILabel?
    private var iconView: UIImageView?
    
    // MARK: - Show Loading
    class func show(info:String) {
        shared.presentPulse(message: info, icon: nil)
    }
    
    // MARK: - Show Info
    class func showInfo(withStatus message: String) {
        shared.presentPulse(message: message, icon: UIImage(systemName: "info.circle"))
    }
    
    // MARK: - Show Success
    class func showSuccess(withStatus message: String) {
        shared.presentPulse(message: message, icon: UIImage(systemName: "checkmark.seal.fill"))
    }
    
    // MARK: - Dismiss
    class func dismiss() {
        shared.removePulse()
    }
    
    // MARK: - Core View
    private func presentPulse(message: String, icon: UIImage?) {
        removePulse() // 移除旧提示
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = .alert + 1
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 140))
        container.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        container.layer.cornerRadius = 16
        container.center = window.center
        
        let iconImageView = UIImageView(image: icon)
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = CGRect(x: 0, y: 20, width: 50, height: 50)
        iconImageView.center.x = container.frame.width / 2
        
        let label = UILabel(frame: CGRect(x: 10, y: 85, width: 140, height: 40))
        label.text = message
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        container.addSubview(iconImageView)
        container.addSubview(label)
        
        window.addSubview(container)
        window.makeKeyAndVisible()
        
        pulseWindow = window
        pulseView = container
        statusLabel = label
        iconView = iconImageView
        
        // 添加轻微缩放动画（类似心跳感）
        container.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseOut,
                       animations: {
            container.transform = .identity
        })
        
        // 自动隐藏（仅 info/success）
        if icon != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                self?.removePulse()
            }
        }
    }
    
    private func removePulse() {
        guard let pulseView = pulseView else { return }
        UIView.animate(withDuration: 0.25, animations: {
            pulseView.alpha = 0
        }) { _ in
            self.pulseWindow?.isHidden = true
            self.pulseWindow = nil
            self.pulseView = nil
        }
    }
}
