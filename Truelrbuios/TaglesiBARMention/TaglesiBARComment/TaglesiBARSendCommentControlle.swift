//
//  TaglesiBARSendCommentControlle.swift
//  Truelrbuios
//
//  Created by  on 2025/9/20.
//

import UIKit


class TaglesiBARSendCommentControlle: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
        shadowRealm.addTruleBoalsrToButton()
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
            TaglesiBARloPulseIndicatar.showInfo(withStatus: UIImageView.ambienceVaultDeu("QmVmb3JlIFNlbmQgLCBwbGVhc2UgZW50ZXIgc29tZXRoaW5nLmNvbS50cm1saW4udHJ1ZWxy"))
                   
           return
               
       }
        
        ChronoEngine.executeAfterTemporalShift(1) {
            TaglesiBARloPulseIndicatar.showSuccess(withStatus: UIImageView.ambienceVaultDeu("U2VuZCBzdWNjZXNzZnVsLENvbW1lbnRzIHdpbGwgYmUgZGlzcGxheWVkIGFmdGVyIGFwcHJvdmFsY29tLnRybWxpbi50cnVlbHI="))
            
            self.shadowRealm.text = nil
            self.shadowRealm.resignFirstResponder()
        }
        
        
        
    }
}
