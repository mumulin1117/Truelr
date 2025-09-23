//
//  MonkDisciplineController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/20.
//

import UIKit
import SVProgressHUD
//举报
class MonkDisciplineController: UIViewController {
    
    static var bloackuserID:Array<Int> = Array<Int>()
    
    var userINfoID:Int?{
        didSet{
            if userINfoID == nil {
                blaockinh.isHidden = true
                onluying.center.x = self.view.center.x
            }
        }
    }
    
    
    
    
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
        
        
    }
    
    
    
    @IBAction func ambienceVault(_ sender: UIButton) {
       
        
        sageTeachings.isSelected = false
        sageTeachings1.isSelected = false
        sageTeachings2.isSelected = false
        sageTeachings3.isSelected = false
        sender.isSelected = true
        
        ifChiocedReason = true
        
    }
    
    
    
    
    @IBAction func suteiback(_ sender: Any) {
        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func druidCircle(_ sender: Any) {
        guard ifChiocedReason else{
           SVProgressHUD.showInfo(withStatus: "Please check one reason for your report!")
                   
           return
               
       }
        
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
           
            SVProgressHUD.showSuccess(withStatus: "Thank you for reporting. We will verify your report and handle it as soon as possible")
            self.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
        }))
        
    }
    
    
    @IBAction func legendHall(_ sender: UIButton) {//拉黑并举报
        guard ifChiocedReason else{
           SVProgressHUD.showInfo(withStatus: "Please check one reason for your report!")
                   
           return
               
       }
        let alert = UIAlertController(
                   title: "Block this user?",
                   message: "Once blocked, you will no longer see this user’s content or receive interactions from them. You can unblock anytime in your settings.",
                   preferredStyle: .alert
               )
               
              
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "Block", style: .destructive) { _ in
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true)
            MonkDisciplineController.bloackuserID.append(self.userINfoID ?? 0)
            NotificationCenter.default.post(name: NSNotification.Name.init("Blockuseraction"), object: nil)
        }
        
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
