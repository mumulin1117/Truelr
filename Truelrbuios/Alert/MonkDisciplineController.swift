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
    private var ifChiocedReason:Bool = false
    
    
    
    @IBOutlet weak var sageTeachings: UIButton!
    
    
    
    @IBOutlet weak var sageTeachings1: UIButton!
    
    @IBOutlet weak var sageTeachings2: UIButton!
    
    
    
    @IBOutlet weak var sageTeachings3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
}
