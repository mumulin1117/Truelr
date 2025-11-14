//
//  ResultrendVaultController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/23.
//

import UIKit

class ResultrendVaultController: UIViewController {
    private var nisertgeing:Dictionary<String,Any>
    init(nisertgeing: Dictionary<String, Any>){
        self.nisertgeing = nisertgeing
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    @IBOutlet weak var mimicArt: UIImageView!
    
    @IBOutlet weak var myinger: UIImageView!
    
    
    @IBOutlet weak var beatheij: UIImageView!
   
    
    @IBAction func marketStall(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        CharaMeaasController.matchingSuccessfullist.insert(nisertgeing, at: 0)
        beatheij.startHeartbeatAnimation()
        mimicArt.displayCharacterPortrait(from:  nisertgeing["villainProfile"] as? String)
        myinger.image = lensCraftController.changeinmge
        
        mimicArt.transform = CGAffineTransform(rotationAngle: CGFloat(-8 * Double.pi / 180))
        beatheij.transform = CGAffineTransform(rotationAngle: CGFloat(8 * Double.pi / 180))
        
        mimicArt.maskedlabeVobor(enter: 20)
        myinger.maskedlabeVobor(enter: 20)
        
    }


    @IBAction func lijhngdycb(_ sender: Any) {
        let shipo = TaglesiBARTreasuretController.init(nisertgeing: nisertgeing,isfromamatching: true)
        shipo.vloavkDismiss = {[weak self] result in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        shipo.modalPresentationStyle = .fullScreen
        self.present(shipo, animated: true)
        
    }
    
}
