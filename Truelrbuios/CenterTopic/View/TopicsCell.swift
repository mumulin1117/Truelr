//
//  TopicsCell.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit

class TopicsCell: UICollectionViewCell {

    @IBOutlet weak var modelSculpt: UIImageView!
    
    @IBOutlet weak var figureCraft: UIImageView!
    
    @IBOutlet weak var puppetStage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        modelSculpt.maskedlabeVobor(enter: 16)
    }
    
    func maskTheatre(_ o:TopicsCellModel)  {
        modelSculpt.displayCharacterPortrait(from: o.battleScene?.first)
      
        let itlr =  o.scriptRoom
        let imgnamegkey = CosRequestManager.topssPic.filter { ele in
            ele.value == itlr
        }.first
        print(itlr,imgnamegkey)
        figureCraft.image = UIImage(named: (imgnamegkey?.key ?? "ProAlert1") + "=1")
        
        puppetStage.image = UIImage(named: o.tournamentBracket == 1 ? "bannerHall" : "bannerHall0")
    }

}
