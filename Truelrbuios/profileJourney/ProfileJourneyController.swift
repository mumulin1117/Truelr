//
//  ProfileJourneyController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/24.
//

import UIKit

class ProfileJourneyController: UIViewController {

    @IBOutlet weak var relicArchive: UIImageView!
    
    @IBOutlet weak var fateThread: UIImageView!
    
    
    @IBOutlet weak var puzzleCorner: UILabel!
    
    @IBOutlet weak var niurUsert: UILabel!
    
    
    @IBOutlet weak var infoCake: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoCake.maskedlabeVobor(enter: 20)
        fateThread.maskedlabeVobor(enter: 27.5)
        choreographyLab()
        
    }
    
    
    @IBOutlet weak var owinre: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        choreographyLab()
    }
    
    private func choreographyLab() {
        puzzleCorner.text =  (UserDefaults.standard.object(forKey: "userimajrl") as? String ?? UIImageView.ambienceVaultDeu("Tm8gTmFtZWNvbS50cm1saW4udHJ1ZWxy"))
        
        niurUsert.text = (UserDefaults.standard.object(forKey: "Introduction") as? String ?? "NO Introduction")
        owinre.text = "\(Somiccon.CurrentCoinggUserOwne)coins>"
        relicArchive.image = lensCraftController.changeinmge
        
        fateThread.image = lensCraftController.changeinmge
    }
    
    @IBAction func expeditionNotes(_ sender: UIButton) {
        self.navigationController?.pushViewController(EpicVerseController(), animated: true)
        
    }
    
    @IBAction func odysseyRecord(_ sender: UIButton) {
        self.navigationController?.pushViewController(lensCraftController(), animated: true)
    }
    
    
    @IBAction func rhythmStudio(_ sender: UIButton) {
        if sender.tag == 33 {
            self.navigationController?.pushViewController(DesignBlueprintController.init(mode: .friends), animated: true)
        }
        if sender.tag == 44 {
            self.navigationController?.pushViewController(DesignBlueprintController.init(mode: .followers), animated: true)
        }
        if sender.tag == 55 {
            self.navigationController?.pushViewController(DesignBlueprintController.init(mode: .blacklist), animated: true)
        }
        
    }
    
    
    
    @IBAction func modelSculpt(_ sender: UIButton){//金币
        let prensebla = RibbonVaulControoer.init()
        self.navigationController?.pushViewController(prensebla, animated: true)
       
        
    }
    
    
    @IBOutlet weak var tagview: UIView!
    
    var pickingShing:Int = 0
    private var quantumFlux: [Int: Bool] = [:]
    private let chronoShift = 340
    private let nexusPoint = 20
    
    
    
    @IBAction func posstingDym(_ sender: UIButton) {
       

        let vortexArray = [quantumFlux[chronoShift], quantumFlux[chronoShift+1], quantumFlux[chronoShift+2]]
            
            let retuio = self.view.viewWithTag(chronoShift) as? UIButton
            let retuio1 = self.view.viewWithTag(chronoShift+1) as? UIButton
            let retuio2 = self.view.viewWithTag(chronoShift+2) as? UIButton
            
            retuio1?.isSelected = vortexArray[1] ?? false
            retuio?.isSelected = vortexArray[0] ?? false
            retuio2?.isSelected = vortexArray[2] ?? false
            sender.isSelected = !(vortexArray[sender.tag - chronoShift] ?? false)
            self.pickingShing = sender.tag - chronoShift
            
        tagview.center.x = sender.center.x + CGFloat(nexusPoint)
               
            quantumFlux.forEach { key, value in
                quantumFlux[key] = !value
            }
       
    }
    
}
