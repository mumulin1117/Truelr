//
//  TreasuretController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/24.
//

import UIKit
import SVProgressHUD

class TreasuretController: UIViewController {
    private var vanishTask: DispatchWorkItem?
    
    
    
    
    private var isfromamatching:Bool
    var vloavkDismiss:((Bool)->Void)?
   
    private var nisertgeing:Dictionary<String,Any>
    init(nisertgeing: Dictionary<String, Any>,isfromamatching:Bool = false){
        self.nisertgeing = nisertgeing
        self.isfromamatching = isfromamatching
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func marketStall(_ sender: Any) {
        self.dismiss(animated: true)
        if self.isfromamatching == true {
            if self.vloavkDismiss != nil {
                self.vloavkDismiss?(true)
            }
        }
    }
    
    
    @IBOutlet weak var druidCircle: UILabel!
    
    
    @IBOutlet weak var melodyVault: UIImageView!
    
    
    @IBOutlet weak var rhythmStudio: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        melodyVault.image = lensCraftController.changeinmge
        druidCircle.text = nisertgeing["heroArchive"] as? String
        rhythmStudio.displayCharacterPortrait(from:nisertgeing["villainProfile"] as? String )
        NotificationCenter.default.addObserver(self, selector: #selector(marketStall), name: NSNotification.Name.init("Blockuseraction"), object: nil)
        melodyVault.maskedlabeVobor(enter: 20)
        
        let spectralTask = DispatchWorkItem { [weak self] in
                   guard let self = self else { return }
                   self.dismiss(animated: true)
                   SVProgressHUD.showInfo(withStatus: "Connect failed, the other party has left")
                   if self.isfromamatching {
                       self.vloavkDismiss?(true)
                   }
               }
               
               vanishTask = spectralTask
               DispatchQueue.main.asyncAfter(deadline: .now() + 7, execute: spectralTask)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 页面消失就取消任务
        vanishTask?.cancel()
        vanishTask = nil
        
    }
    
    @IBAction func enchantmentLab(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            self.present(mainViewController, animated: true)
            
            let user = nisertgeing["mangaPanel"] as? Int
            
            mainViewController.userINfoID = nisertgeing
        }
    }
    


}
