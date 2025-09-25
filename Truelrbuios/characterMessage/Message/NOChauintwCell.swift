//
//  NOChauintwCell.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/24.
//

import UIKit

class NOChauintwCell: UITableViewCell {

    @IBOutlet weak var cheingNowie: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cheingNowie.maskedlabeVobor(enter: 10)
        minguod.maskedlabeVobor(enter: 16)
    }

    @IBOutlet weak var minguod: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
