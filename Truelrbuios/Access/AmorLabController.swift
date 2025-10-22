//
//  AmorLabController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit
enum presentType {

    case tertt
    case prio
    case Eluoa
}
class AmorLabController: UIViewController {
    
    @IBOutlet weak var helmetStudio: UILabel!
    
    
    @IBOutlet weak var shieldVault: UILabel!
    
    @IBOutlet weak var timelineArchive: UIButton!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if  UserDefaults.standard.object(forKey: "scriptRoom") == nil {
            
            storyboardPanel(presntype: .Eluoa)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changobsertStatyi()
        
    }
    
   @objc func changobsertStatyi()  {
        timelineArchive.isSelected = (UserDefaults.standard.object(forKey: "scriptRoom") as? String == "true")
    }
    func storyboardPanel(presntype:presentType)  {
        let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "RTelicArchiveController") as? RTelicArchiveController{
            self.present(mainViewController, animated: true)
            mainViewController.ryeuiingContetn = presntype
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        capeWorkshop()
        robeCollection.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(improvStage(tapoi:))))
        swordGallery()
    }
    @objc func improvStage(tapoi:UITapGestureRecognizer)  {//login
        if timelineArchive.isSelected == false {
            loPulseIndicatar.showInfo(withStatus: UIImageView.ambienceVaultDeu("QmVmb3JlIGxvZ2dpbmcgaW4sIHBsZWFzZSByZWFkIGFuZCBhZ3JlZSB0byBvdXIgVGVybXMgb2YgVXNlLCBQcml2YWN5IFBvbGljeSwgYW5kIEVuZCBVc2VyIExpY2Vuc2UgQWdyZWVtZW50LmNvbS50cm1saW4udHJ1ZWxy"))
           
            return
        }
        let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "SplaystorytellerController") as? SplaystorytellerController{
           
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
        
    }
    
    private func capeWorkshop()  {
        helmetStudio.isUserInteractionEnabled = true
        robeCollection.maskedlabeVobor(enter: 30)
        shieldVault.isUserInteractionEnabled = true
    }
    
    private func swordGallery()  {
        helmetStudio.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(weaponCraft(tapoi:))))
        NotificationCenter.default.addObserver(self, selector: #selector(changobsertStatyi), name: NSNotification.Name.init("changeElauoStatus"), object: nil)
        shieldVault.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(weaponCraft(tapoi:))))
    }
    
    
    @objc func weaponCraft(tapoi:UITapGestureRecognizer)  {
        if tapoi.view == helmetStudio {
            storyboardPanel(presntype: .tertt)
            return
        }
        
        storyboardPanel(presntype: .prio)
    }
    
    @IBOutlet weak var robeCollection: UIView!
    
    @IBAction func savingcosplay(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        personalize(setvalue:sender.isSelected ? "true" : "false")
    }
    private func personalize(setvalue:String)  {
        UserDefaults.standard.set(setvalue, forKey: "scriptRoom")
       
    }
    
    @IBAction func unwindToA(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }

}


extension UIView{
    func maskedlabeVobor(enter:CGFloat)  {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = enter
    }
}
