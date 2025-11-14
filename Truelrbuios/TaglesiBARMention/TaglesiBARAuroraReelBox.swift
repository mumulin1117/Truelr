//
//  TaglesiBARAuroraReelBox.swift
//  Truelrbuios
//
//  Created by  on 2025/9/25.
//

import UIKit
import AVFoundation

class TaglesiBARAuroraReelBox: UIView {

    private var harmonyPlayer: AVPlayer?
        
    private var cascadeLayer: AVPlayerLayer?
    
    func igniteStream(resource: String) {
        var sourceURL: URL
        if resource.hasPrefix("http") {
            sourceURL = URL(string: resource)!
        } else {
            sourceURL = URL(fileURLWithPath: resource)
        }
        
        harmonyPlayer = AVPlayer(url: sourceURL)
        cascadeLayer = AVPlayerLayer(player: harmonyPlayer)
        cascadeLayer?.frame = UIScreen.main.bounds
        cascadeLayer?.videoGravity = .resizeAspectFill
        
        if let layer = cascadeLayer {
            self.layer.addSublayer(layer)
        }
    }
  
    func sparkOn() {
        harmonyPlayer?.play()
    }
    
    
    func sparkOff() {
        harmonyPlayer?.pause()
    }

}
