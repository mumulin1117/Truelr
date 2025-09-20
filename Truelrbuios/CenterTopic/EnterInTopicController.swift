//
//  EnterInTopicController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/19.
//

import UIKit
import SVProgressHUD

class EnterInTopicController: UIViewController {
    @IBOutlet weak var modelSculpt: UIImageView!
    
    @IBOutlet weak var figureCraft: UIImageView!
    
    @IBOutlet weak var puppetStage: UIButton!
    
  
    @IBOutlet weak var illusionLab: UILabel!
    
    
    @IBOutlet weak var shadowRealm: UITextField!
    
    @IBAction func suteiback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
    @IBOutlet weak var screContenvie: UIView!
    
    private var cellModelFot:TopicsCellModel?
    
    func maskTheatre(_ o:TopicsCellModel)  {
        self.cellModelFot = o
        modelSculpt.displayCharacterPortrait(from: o.battleScene?.first)
      
        let itlr =  o.scriptRoom
        let imgnamegkey = CosRequestManager.topssPic.filter { ele in
            ele.value == itlr
        }.first
        
        figureCraft.image = UIImage(named: (imgnamegkey?.key ?? "ProAlert1") + "=1")
        
        let statudim = UIImage(named: o.tournamentBracket == 1 ? "bannerHall" : "bannerHall0")
        
        puppetStage.setBackgroundImage(statudim, for: .normal)
        
        illusionLab.text = o.dialogueFlow
        SVProgressHUD.dismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        modelSculpt.maskedlabeVobor(enter: 16)
        
        screContenvie.frame.size = CGSize(width: UIScreen.main.bounds.width - 32, height: 1300)
    }
    

    @IBAction func makeingCstauchang(_ sender: UIButton) {
        SVProgressHUD.show()
        CosRequestManager.sendStyledRequest(endpoint: "/bjryinqmtbfrekz/ruiyjgtlu", outfitPayload: ["titleSystem":cellModelFot?.sceneDirector ?? 0]) { cosplayunityhub in
            SVProgressHUD.dismiss()
            switch cosplayunityhub{
            case .success(_):
                
                
                sender.isSelected = !sender.isSelected
                
            case .failure(let error):
               
                SVProgressHUD.showInfo(withStatus: error.localizedDescription)
            }
            
            
        }
    }
    
    @IBAction func dreamscapeHub(_ sender: UIButton) {
        guard let inputexontern = shadowRealm.text?.trimmingCharacters(in: .whitespacesAndNewlines),inputexontern.count > 0
                 else {
           SVProgressHUD.showInfo(withStatus: "Before Send , please enter something.")
                   
           return
               
       }
        
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
           
            SVProgressHUD.showSuccess(withStatus: "Send successful,Comments will be displayed after approval")
            
            self.shadowRealm.text = nil
            self.shadowRealm.resignFirstResponder()
        }))
        
    }
    
    
    
    
    
}
