//
//  CondiFilterControoer.swift
//  Truelrbuios
//
//  Created by  on 2025/9/22.
//

import UIKit
import SVProgressHUD

var ifpickedCondition:Bool = false

class CondiFilterControoer: UIViewController {
    @IBAction func bahingop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var nightmareVault: UISlider!
    
     var casheCondictuin:Array<Int> = []
    
    
    static var pickingCondictuin:Array<Int> = [16,17]
    
    static var pickingAge:(Int,Int) = (18,60)
    @IBOutlet weak var fantasyForge: UIButton!
    
    @IBOutlet weak var resent: UIButton!
    
    @IBOutlet weak var savecondi: UIButton!
    
    
    @IBOutlet weak var ageArray: UILabel!
    
    
    @objc func somavhange()  {
        ageArray.text = "\(Int(nightmareVault.minimumValue))-\(Int(nightmareVault.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nightmareVault.addTarget(self, action: #selector(somavhange), for: .valueChanged)
        resent.maskedlabeVobor(enter: 30)
        savecondi.maskedlabeVobor(enter: 30)
        casheCondictuin = CondiFilterControoer.pickingCondictuin
        
        nightmareVault.value = Float(CondiFilterControoer.pickingAge.1)
        ageArray.text =  "\(CondiFilterControoer.pickingAge.0)-\(CondiFilterControoer.pickingAge.1)"
        
        self.view.subviews.forEach { agg in
            if let bav = agg as? UIButton{
                if casheCondictuin.contains(bav.tag) {
                    bav.isSelected = true
                }
               
            }
        }
        
    }
    
    @IBAction func heroicDeed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            casheCondictuin.append(sender.tag)
        }else{
            casheCondictuin = casheCondictuin.filter({ ik in
                ik != sender.tag
            })
        }
    }
    

    
    @IBAction func harmonyHall(_ sender: UIButton) {
        casheCondictuin.removeAll()
        CondiFilterControoer.pickingCondictuin.removeAll()
        CondiFilterControoer.pickingAge.0 = 18
        CondiFilterControoer.pickingAge.1 = 60
        
        nightmareVault.value = 60
        self.view.subviews.forEach { agg in
            if let bav = agg as? UIButton{
                bav.isSelected = false
            }
        }
    }
    
    
    @IBAction func labyrinthPath(_ sender: Any) {
        CondiFilterControoer.pickingCondictuin = casheCondictuin
        
        CondiFilterControoer.pickingAge.0 = Int(self.nightmareVault.minimumValue)
        CondiFilterControoer.pickingAge.1 = Int(self.nightmareVault.value)
        SVProgressHUD.showSuccess(withStatus:UIImageView.ambienceVaultDeu("U2F2ZSBzdWNjZXNzZnVsIWNvbS50cm1saW4udHJ1ZWxy") )
        self.navigationController?.popViewController(animated: true)
    }
}
