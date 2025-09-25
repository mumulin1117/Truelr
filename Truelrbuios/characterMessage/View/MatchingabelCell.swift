//
//  MatchingabelCell.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/23.
//

import UIKit

class MatchingabelCell: UITableViewCell {

    @IBOutlet weak var enchantmentLab: UIButton!
    
    @IBOutlet weak var potionWorkshop: UIButton!
    
    
    @IBOutlet weak var runeStone: UIButton!
    
    @IBOutlet weak var travelDiary: UIButton!
    
    
    @IBOutlet weak var expeditionNotes: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.selectionStyle = .none
        travelDiary.maskedlabeVobor(enter: 34)
        expeditionNotes.maskedlabeVobor(enter: 34)
        
        
        potionWorkshop.setTitle(" \(ViewController.CurrentCoinggUserOwne)", for: .normal)
       
    }

  
    
}
