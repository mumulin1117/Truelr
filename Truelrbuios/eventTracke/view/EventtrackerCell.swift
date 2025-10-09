//
//  EventtrackerCell.swift
//  Truelrbuios
//
//  Created by  on 2025/9/22.
//

import UIKit

class EventtrackerCell: UICollectionViewCell {

   
    @IBOutlet weak var heroicDeed: UIImageView!
    
    
    @IBOutlet weak var valorStory: UIImageView!
    
    @IBOutlet weak var knightOrder: UILabel!
    
    
    @IBOutlet weak var samuraiCode: UILabel!
    
    
    @IBOutlet weak var ninjaScroll: UILabel!
    
    
    @IBOutlet weak var warriorPath: UILabel!
    
    @IBOutlet weak var monkDiscipline: UILabel!
    
    @IBOutlet weak var sageTeachings: UILabel!
    
    
    @IBOutlet weak var druidCircle: UILabel!
    
    
    @IBOutlet weak var minstrelTune: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        druidCircle.maskedlabeVobor(enter: 12.5)
        valorStory.maskedlabeVobor(enter: 20)
        
        self.maskedlabeVobor(enter: 20)
    }

}
