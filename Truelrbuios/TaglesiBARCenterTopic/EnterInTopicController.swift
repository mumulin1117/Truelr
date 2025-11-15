//
//  EnterInTopicController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/19.
//

import UIKit

protocol TopicUpdateDelegate: AnyObject {
    func topicDidUpdate(_ topic: TaglesiBARTopicsCellModel?,index:Int)
}
class EnterInTopicController: UIViewController {
    weak var delegate: TopicUpdateDelegate?
    @IBOutlet weak var commentuseravatoer: UIImageView!
    
    @IBOutlet weak var TaglesiBARTitle: UILabel!
    
    @IBOutlet weak var commentnamealbel: UILabel!
    
    
    @IBOutlet weak var commnetcontent: UILabel!
    
    
    
    @IBOutlet weak var modelSculpt: UIImageView!
    
    @IBOutlet weak var figureCraft: UIImageView!
    
    @IBOutlet weak var puppetStage: UIButton!
   
  
    @IBOutlet weak var illusionLab: UILabel!
    
    
    @IBOutlet weak var shadowRealm: UITextField!
    
    @IBAction func suteiback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
    @IBOutlet weak var screContenvie: UIView!
    
    @IBOutlet weak var shanretopicNam: UILabel!
    private var cellModelFot:TaglesiBARTopicsCellModel?
    private var rowdext:Int = 0
    func maskTheatre(_ o:TaglesiBARTopicsCellModel,indexpathro:Int)  {
        self.cellModelFot = o
        modelSculpt.displayCharacterPortrait(from: o.battleScene?.first)
        self.rowdext = indexpathro
        let itlr =  o.scriptRoom
        let imgnamegkey = CosRequestManager.topssPic.filter { ele in
            ele.value == itlr
        }.first
        
        figureCraft.image = UIImage(named: (imgnamegkey?.key ?? "ProAlert1") + "=1")
        
        let statudim = UIImage(named: o.tournamentBracket == 1 ? "bannerHall" : "bannerHall0")
        
        puppetStage.setBackgroundImage(statudim, for: .normal)
        shanretopicNam.text = "Topic:" + (o.scriptRoom ?? "Cos")
        illusionLab.text = o.dialogueFlow
        
        let comejng = ["That duet was insane, you two nailed the harmony!",
                       "The Naruto dance remix actually slapped harder than expected.",
                       "That skit legit felt like a live anime episode.",
                       "Crazy how I just came to watch and ended up making 5 new friends.",
                       "Fr, everyone’s just vibing and hyping each other up.",
                       "Next time let’s make a group chat so we don’t lose touch."]
        if SharedTopicsController.getingallUser.count >= 6 {
            let comentuser = SharedTopicsController.getingallUser[self.rowdext]
            commentuseravatoer.displayCharacterPortrait(from: comentuser["villainProfile"] as? String)
            
            commentnamealbel.text = comentuser["heroArchive"] as? String
            
            commnetcontent.text = comejng[rowdext]
        }
       
        
        
        
        TaglesiBARloPulseIndicatar.dismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowRealm.addTruleBoalsrToButton()
        TaglesiBARTitle.text = "TaglesiBARShared TopicsTaglesiBAR".replacingOccurrences(of: "TaglesiBAR", with: "")
        TaglesiBARloPulseIndicatar.show(info: "")
        modelSculpt.maskedlabeVobor(enter: 16)
        commentuseravatoer.maskedlabeVobor(enter: 20)
        screContenvie.frame.size = CGSize(width: UIScreen.main.bounds.width - 32, height: 1300)
    }
    

    @IBAction func makeingCstauchang(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.cellModelFot?.tournamentBracket =  sender.isSelected ? 1 : 0
        delegate?.topicDidUpdate(self.cellModelFot, index: rowdext)

    }
    
    @IBAction func dreamscapeHub(_ sender: UIButton) {
        guard let inputexontern = shadowRealm.text?.trimmingCharacters(in: .whitespacesAndNewlines),inputexontern.count > 0
                 else {
            TaglesiBARloPulseIndicatar.showInfo(withStatus: UIImageView.ambienceVaultDeu("QmVmb3JlIFNlbmQgLCBwbGVhc2UgZW50ZXIgc29tZXRoaW5nLmNvbS50cm1saW4udHJ1ZWxy"))
                   
           return
               
       }
        
     
        ChronoEngine.executeAfterTemporalShift(1) {
            TaglesiBARloPulseIndicatar.showInfo(withStatus: UIImageView.ambienceVaultDeu("U2VuZCBzdWNjZXNzZnVsLENvbW1lbnRzIHdpbGwgYmUgZGlzcGxheWVkIGFmdGVyIGFwcHJvdmFsY29tLnRybWxpbi50cnVlbHI="))
            
            self.shadowRealm.text = nil
            self.shadowRealm.resignFirstResponder()
        }
       
        
    }
    
    
    
    
    
}
