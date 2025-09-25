//
//  NOrmalUserinfoCell.swift
//  Truelrbuios
//
//  Created by  on 2025/9/24.
//

import UIKit
protocol painghur {
    func borrtomChein(isposr:Bool)
}
class NOrmalUserinfoCell: UICollectionViewCell {
    var delfp:painghur?
    
    @IBOutlet weak var ritualHall: UIImageView!
    
    @IBOutlet weak var badgeCollector: UILabel!
    
    @IBOutlet weak var titleSystem: UILabel!
    
    @IBOutlet weak var emblemStudio: UILabel!
    
    
    @IBOutlet weak var landmarkGuide: UIView!
    
    
    @IBOutlet weak var timelineArchivetag: UIImageView!
    
    
    @IBOutlet weak var timelineArchivetag1: UIImageView!
   
    
    
    @IBOutlet weak var awardRoom: UIButton!
    
    
    @IBOutlet weak var motionCapture: UIButton!
    
    
    @IBOutlet weak var indicatererview: UIView!
    var pickingShing:Int = 0
    
    
    @IBAction func posstingDym(_ sender: UIButton) {
       
        let retuio = self.contentView.viewWithTag(340) as? UIButton
        let retuio1 = self.contentView.viewWithTag(341) as? UIButton
        
        retuio1?.isSelected = false
        retuio?.isSelected = false
        
        sender.isSelected = true
        self.pickingShing = sender.tag - 340
        
        indicatererview.center.x = sender.center.x + 20
       
        if delfp != nil {
            delfp?.borrtomChein(isposr: pickingShing == 0)
        }
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timelineArchivetag.image =  UIImage(named: "ProAlert\(CondiFilterControoer.pickingCondictuin.randomElement() ?? 17)=2")
       
        
        timelineArchivetag1.image =  UIImage(named: "ProAlert\(CondiFilterControoer.pickingCondictuin.randomElement() ?? 17)=2")
       
        landmarkGuide.maskedlabeVobor(enter:  20)
    }

}
