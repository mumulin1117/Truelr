//
//  MainshMaCell.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/23.
//

import UIKit

class MainshMaCell: UICollectionViewCell {

    @IBOutlet weak var familiarGuide: UIImageView!
    
    
    @IBOutlet weak var petTrainer: UIButton!
    
    
    @IBOutlet weak var guildBadge: UIImageView!
    
    
    @IBOutlet weak var planetariumView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        familiarGuide.layer.borderColor = UIColor.white.cgColor
        familiarGuide.layer.borderWidth = 3
        familiarGuide.maskedlabeVobor(enter: 15)
        familiarGuide.transform = CGAffineTransform(rotationAngle: CGFloat(-8 * Double.pi / 180))
        
    }
    
    
    

}
