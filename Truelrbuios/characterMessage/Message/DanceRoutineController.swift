//
//  DanceRoutineController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/24.
//

import UIKit
import SVProgressHUD

class DanceRoutineController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModelFot.count
    }
    
   
    @IBAction func suteiback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuser =  tableView.dequeueReusableCell(withIdentifier: "NOChauintwCell", for: indexPath) as! NOChauintwCell
        
       
        reuser.selectionStyle = .none
        let infog = cellModelFot[indexPath.row]
        
        reuser.minguod.image = lensCraftController.changeinmge
       
        reuser.cheingNowie.text = infog
        
        
        return reuser
    }
    

    @IBOutlet weak var shadowRealm: UITextField!
    
    @IBOutlet weak var comentVaire: UITableView!
    
    @IBOutlet weak var noconemr: UILabel!
    
    private var nisertgeing:Dictionary<String,Any>
  
    private var cellModelFot:Array<String> =  Array<String>()
   
    init(nisertgeing: Dictionary<String, Any>) {
       
        self.nisertgeing = nisertgeing
       
        super.init(nibName: nil, bundle: nil)
    }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    deinit {
        
        var ifcontains:Bool = false
        
        for (i,user) in CharaMeaasController.chatlist.enumerated() {
            if user.user["mangaPanel"] as? Int == nisertgeing["mangaPanel"] as? Int {
                CharaMeaasController.chatlist[i].messageList = self.cellModelFot
                ifcontains = true
                break
            }
        }
        
        if ifcontains == false{
            let nering = SendingMeass.init()
            nering.user = nisertgeing
            nering.messageList = self.cellModelFot
            CharaMeaasController.chatlist.append(nering)
        }
       
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for (i,user) in CharaMeaasController.chatlist.enumerated() {
            if user.user["mangaPanel"] as? Int == nisertgeing["mangaPanel"] as? Int {
                self.cellModelFot =  CharaMeaasController.chatlist[i].messageList
              
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(suteiback), name: NSNotification.Name.init("Blockuseraction"), object: nil)
        
        comentVaire.delegate = self
        comentVaire.dataSource = self
        comentVaire.estimatedRowHeight = 100
        comentVaire.register(UINib.init(nibName: "NOChauintwCell", bundle: nil), forCellReuseIdentifier: "NOChauintwCell")
        comentVaire.separatorStyle = .none
        noconemr.text  = nisertgeing["heroArchive"]  as? String
    }


    @IBAction func dreamscapeHub(_ sender: UIButton) {
        guard let inputexontern = shadowRealm.text?.trimmingCharacters(in: .whitespacesAndNewlines),inputexontern.count > 0
                 else {
           SVProgressHUD.showInfo(withStatus: "Before Send , please enter something.")
                   
           return
               
       }
        shadowRealm.text = nil
        shadowRealm.resignFirstResponder()
        self.cellModelFot.append(inputexontern)
       
        self.comentVaire.reloadData()
    }
    
    
    @IBAction func lijhngdycb(_ sender: Any) {
        let shipo = TreasuretController.init(nisertgeing: nisertgeing,isfromamatching: true)
       
        shipo.modalPresentationStyle = .fullScreen
        self.present(shipo, animated: true)
        
    }
    
    @IBAction func enchantmentLab(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            self.present(mainViewController, animated: true)
            
            //let user = nisertgeing["mangaPanel"] as? Int
            
            mainViewController.userINfoID = nisertgeing
        }
    }
}


