//
//  MonkDisciplineController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/20.
//

import UIKit
import SVProgressHUD
struct ChronoEngine {
    static func executeAfterTemporalShift(_ delay: Double, quantumTask: @escaping () -> Void) {
        SVProgressHUD.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            quantumTask()
        }
    }
}



class MonkDisciplineController: UIViewController {
    
    static var bloackuserID:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    var userINfoID:Dictionary<String,Any>?
    
    
    
    
    private var ifChiocedReason:Bool = false
    
    
    
    @IBOutlet weak var sageTeachings: UIButton!
    
    
    
    @IBOutlet weak var sageTeachings1: UIButton!
    
    @IBOutlet weak var sageTeachings2: UIButton!
    
    
    
    @IBOutlet weak var sageTeachings3: UIButton!
    
    
    
    
    @IBOutlet weak var blaockinh: UIButton!
    
    @IBOutlet weak var onluying: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blaockinh.maskedlabeVobor(enter: 30)
        onluying.maskedlabeVobor(enter: 30)
        shanfert.maskedlabeVobor(enter: 30)
        
    }
    
    
    
    @IBAction func ambienceVault(_ sender: UIButton) {
       
        
        sageTeachings.isSelected = false
        sageTeachings1.isSelected = false
        sageTeachings2.isSelected = false
        sageTeachings3.isSelected = false
        sender.isSelected = true
        
        ifChiocedReason = true
        
    }
    @IBOutlet weak var shanfert: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if userINfoID == nil {
            blaockinh.isHidden = true
            onluying.isHidden = true
            shanfert.isHidden = false
        }else{
            blaockinh.isHidden = false
            onluying.isHidden = false
            shanfert.isHidden = true
        }
    }
    
    
    @IBAction func suteiback(_ sender: Any) {
        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func druidCircle(_ sender: Any) {
        guard ifChiocedReason else{
           SVProgressHUD.showInfo(withStatus: UIImageView.ambienceVaultDeu("")"Please check one reason for your report!")
                   
           return
               
       }
        ChronoEngine.executeAfterTemporalShift(1) {
            SVProgressHUD.showSuccess(withStatus: UIImageView.ambienceVaultDeu("")"Thank you for reporting. We will verify your report and handle it as soon as possible")
            self.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
        }
       
        
    }
    
    
    @IBAction func legendHall(_ sender: UIButton) {//拉黑并举报
        if userINfoID == nil {
            return
        }
        guard ifChiocedReason else{
           SVProgressHUD.showInfo(withStatus: UIImageView.ambienceVaultDeu("")"Please check one reason for your report!")
                   
           return
               
       }
        let alert = UIAlertController(
                   title: UIImageView.ambienceVaultDeu("")"Block this user?",
                   message: UIImageView.ambienceVaultDeu("")"Once blocked, you will no longer see this user’s content or receive interactions from them. You can unblock anytime in your settings.",
                   preferredStyle: .alert
               )
               
              
        let cancel = UIAlertAction(title: UIImageView.ambienceVaultDeu("")"Cancel", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: UIImageView.ambienceVaultDeu("")"Block", style: .destructive) { _ in
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true)
            MonkDisciplineController.bloackuserID.append(self.userINfoID ?? [:])
            NotificationCenter.default.post(name: NSNotification.Name.init("Blockuseraction"), object: nil)
        }
        
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
