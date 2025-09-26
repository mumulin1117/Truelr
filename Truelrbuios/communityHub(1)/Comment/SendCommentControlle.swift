//
//  SendCommentControlle.swift
//  Truelrbuios
//
//  Created by  on 2025/9/20.
//

import UIKit
import SVProgressHUD

class SendCommentControlle: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModelFot.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let reuser =  tableView.dequeueReusableCell(withIdentifier: "SendCommentCon") ??
        UITableViewCell(style: .subtitle, reuseIdentifier: "SendCommentCon")
        
       
        reuser.selectionStyle = .none
        let infog = cellModelFot[indexPath.row]
        
        reuser.imageView?.displayCharacterPortrait(from:infog["folkloreRoom"] as? String )
        reuser.imageView?.maskedlabeVobor(enter: 25)
        reuser.textLabel?.text = infog["folkloreRoom"] as? String
        
        reuser.detailTextLabel?.text = infog["mythologyVault"] as? String
        return reuser
    }
    

    @IBOutlet weak var shadowRealm: UITextField!
    
    @IBOutlet weak var comentVaire: UITableView!
    
    @IBOutlet weak var noconemr: UILabel!
    
  
    private var cellModelFot:Array<Dictionary<String,Any>>
   
    init(cellModelFot: Array<Dictionary<String,Any>>) {
        self.cellModelFot = cellModelFot
        
       
        super.init(nibName: nil, bundle: nil)
    }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        comentVaire.delegate = self
        comentVaire.dataSource = self
        comentVaire.estimatedRowHeight = 100
        comentVaire.register(UITableViewCell.self, forCellReuseIdentifier: "SendCommentCon")
        
        if self.cellModelFot.count == 0 {
        
            noconemr.isHidden = false
        }else{
            noconemr.isHidden = true
        }
    }


    @IBAction func dreamscapeHub(_ sender: UIButton) {
        guard let inputexontern = shadowRealm.text?.trimmingCharacters(in: .whitespacesAndNewlines),inputexontern.count > 0
                 else {
           SVProgressHUD.showInfo(withStatus: UIImageView.ambienceVaultDeu("")"Before Send , please enter something.")
                   
           return
               
       }
        
        ChronoEngine.executeAfterTemporalShift(1) {
            SVProgressHUD.showSuccess(withStatus: UIImageView.ambienceVaultDeu("")"Send successful,Comments will be displayed after approval")
            
            self.shadowRealm.text = nil
            self.shadowRealm.resignFirstResponder()
        }
        
        
        
    }
}
