//
//  labyrinthPathCell.swift
//  Truelrbuios
//
//  Created by  on 2025/9/20.
//

import UIKit

class labyrinthPathCell: UICollectionViewCell {
    
    @IBOutlet weak var modelSculpt: UIImageView!
    
    @IBOutlet weak var figureCraft: UIImageView!
    
   
    @IBOutlet weak var valorStory: UIButton!
    
    @IBOutlet weak var knightOrder: UIButton!
    
    
    @IBOutlet weak var samuraiCode: UIButton!
    
    @IBOutlet weak var ninjaScroll: UIButton!
    
    @IBOutlet weak var filterStudio: UILabel!
    
    
    @IBOutlet weak var warriorPath: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        modelSculpt.maskedlabeVobor(enter: 16)
        
        figureCraft.maskedlabeVobor(enter: 35)
    }
    
    func maskTheatre(_ o:TaglesiBARTopicsCellModel,dymTyoe:Int)  {
        if dymTyoe == 1 {//video
            valorStory.isHidden = false
            modelSculpt.displayCharacterPortrait(from: o.guildBadge)
        }else{
            valorStory.isHidden = true
            modelSculpt.displayCharacterPortrait(from: o.battleScene?.first)
        }
        figureCraft.displayCharacterPortrait(from: o.improvStage)
      
        filterStudio.text = o.actingCoach
        
        warriorPath.text = o.dialogueFlow
        
        samuraiCode.isSelected = (o.tournamentBracket == 1)
    }

}
