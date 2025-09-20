//
//  QuestSeekerControlle.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/20.
//

import UIKit

class QuestSeekerControlle: UIViewController {
    var pickingShing:Int = 0
    @IBAction func posstingDym(_ sender: UIButton) {
       
        let retuio = self.view.viewWithTag(340) as? UIButton
        let retuio1 = self.view.viewWithTag(341) as? UIButton
        retuio1?.isSelected = false
        retuio?.isSelected = false
        
        sender.isSelected = true
        self.pickingShing = sender.tag - 340
        if self.pickingShing == 1 {
            self.indicaterNned.isHidden = false
        }else{
            self.indicaterNned.isHidden = true
        }
        
    }
    
    @IBOutlet weak var indicaterNned: UIImageView!
    
    
    
    @IBOutlet weak var dreamscapeHub: UITextView!
    
    @IBAction func planetariumView(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dreamscapeHub(_ sender: UIButton) {
   
    }
    

}
