//
//  ResultrendVaultController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/23.
//

import UIKit

class ResultrendVaultController: UIViewController {
    private var nisertgeing:Dictionary<String,Any>
    init(nisertgeing: Dictionary<String, Any>){
        self.nisertgeing = nisertgeing
        super.init(nibName: nil, bundle: nil)
    }
    
    
    @IBOutlet weak var mimicArt: UIImageView!
    
    @IBOutlet weak var myinger: UIImageView!
    
    
    @IBOutlet weak var beatheij: UIImageView!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func marketStall(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beatheij.startHeartbeatAnimation()
        mimicArt.displayCharacterPortrait(from:  nisertgeing["villainProfile"] as? String)
        myinger.displayCharacterPortrait(from: ViewController.ExestedLogUserPhotp)
        
        mimicArt.transform = CGAffineTransform(rotationAngle: CGFloat(-8 * Double.pi / 180))
        beatheij.transform = CGAffineTransform(rotationAngle: CGFloat(8 * Double.pi / 180))
        
        mimicArt.maskedlabeVobor(enter: 20)
        myinger.maskedlabeVobor(enter: 20)
        
    }



}
