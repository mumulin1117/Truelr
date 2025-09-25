//
//  CharaMeaasController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/23.
//

import UIKit

class SendingMeass: NSObject {
    var user: Dictionary<String,Any> = [:]
    var messageList:Array<String> = []
}

class CharaMeaasController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var mangaPanel:Int = 2
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        improvStage.reloadData()
    }
    static var chatlist:Array<SendingMeass> = Array<SendingMeass>()
    
    static var likelist:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    static var matchingSuccessfullist:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()

    @IBOutlet weak var enchantmentLab: UIButton!
    
    
    @IBOutlet weak var enchantmentLab1: UIButton!
    
    
    @IBOutlet weak var enchantmentLab2: UIButton!
    
    
    @IBOutlet weak var improvStage: UITableView!
    @IBOutlet weak var noconemr: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mangaPanel == 2 {
            return 1
        }
        
        if mangaPanel == 0 {
            return CharaMeaasController.chatlist.count
        }
        return  CharaMeaasController.likelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mangaPanel == 2 {
            let reuser =  tableView.dequeueReusableCell(withIdentifier: "MatchingabelCell", for: indexPath) as!  MatchingabelCell
            reuser.runeStone.startHeartbeatAnimation()
            reuser.enchantmentLab.addTarget(self, action: #selector(designBlueprint), for: .touchUpInside)
            reuser.potionWorkshop.addTarget(self, action: #selector(modelSculpt), for: .touchUpInside)
            reuser.runeStone.addTarget(self, action: #selector(moodBoard), for: .touchUpInside)
            reuser.travelDiary.addTarget(self, action: #selector(matinglistlueprint), for: .touchUpInside)
            return reuser
            
        }else{
            
            let reuser =  tableView.dequeueReusableCell(withIdentifier: "REallListchiwCell", for: indexPath) as! REallListchiwCell
             
            
             reuser.selectionStyle = .none
            
            if mangaPanel == 0 {
                let infog =  CharaMeaasController.chatlist[indexPath.row]
                reuser.avatarView.displayCharacterPortrait(from:infog.user["villainProfile"] as? String )
              
                reuser.nameLabel.text = infog.user["heroArchive"] as? String
                
                reuser.sayiedLabel.text = infog.messageList.first
            }else{
                var infog =  CharaMeaasController.likelist[indexPath.row]
                reuser.avatarView.displayCharacterPortrait(from:infog["villainProfile"] as? String )
                
                reuser.nameLabel.text = infog["heroArchive"] as? String
                
                reuser.sayiedLabel.text = "You Like She/he,To connect!"
            }
            
          
             return reuser
        }
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if mangaPanel == 2 {
            return 609
        }
        return 80
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if mangaPanel == 0 {
            let infog =  CharaMeaasController.chatlist[indexPath.row].user
            
     
            self.navigationController?.pushViewController(DanceRoutineController.init(nisertgeing: infog), animated: true)
        }
        
        if mangaPanel == 1 {
            let infog =  CharaMeaasController.likelist[indexPath.row]
            
     
            self.navigationController?.pushViewController(ArenaStageController.init(nisertgeing: infog), animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        improvStage.separatorStyle = .none
        improvStage.delegate = self
        improvStage.dataSource = self
        improvStage.estimatedRowHeight = 100
        improvStage.register(REallListchiwCell.self, forCellReuseIdentifier: "REallListchiwCell")
        improvStage.backgroundColor = .clear
        improvStage.register(UINib(nibName: "MatchingabelCell", bundle: nil), forCellReuseIdentifier: "MatchingabelCell")
        
    }
    
    
    func uprenerwr()  {
        
        if mangaPanel == 0 &&  CharaMeaasController.chatlist.count == 0{
            noconemr.isHidden = false
            noconemr.text = "No message yet"
        }
        
        if mangaPanel == 1 &&  CharaMeaasController.likelist.count == 0{
            noconemr.isHidden = false
            noconemr.text = "No like yet"
        }
        if mangaPanel == 2 {
        
            noconemr.isHidden = true
        }
    }

    @IBAction func clanCircle(_ sender: UIButton) {
        enchantmentLab.isSelected = false
        enchantmentLab1.isSelected = false
        enchantmentLab2.isSelected = false
        
        sender.isSelected = true
        self.mangaPanel = sender.tag - 100
        self.improvStage.reloadData()
    }
}


extension CharaMeaasController{
    
    @objc func designBlueprint(){//filter
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "CondiFilterControoer") as? CondiFilterControoer{
            
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
    }
    
    @objc func matinglistlueprint(){//history
        
        self.navigationController?.pushViewController(DesignBlueprintController.init(mode: .successgfulhistory), animated: true)
    }
    
    
    @objc func modelSculpt(){//金币
        let prensebla = RibbonVaulControoer.init()
        self.navigationController?.pushViewController(prensebla, animated: true)
       
        
    }
    
    
    @objc func moodBoard(){//start 匹配
        if  let user =  SharedTopicsController.getingallUser.randomElement(){
          
            let picvc =  CarnivalParadeController.init(nisertgeing: user)
            
            self.navigationController?.pushViewController(picvc, animated: true)
        }
        
    }
    
    @IBAction func unwindToMessage(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }
}


extension UIView {
    func startHeartbeatAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0       // 初始大小
        animation.toValue = 1.2         // 放大 20%
        animation.duration = 0.6        // 每次持续时间
        animation.autoreverses = true   // 动画完成后反向
        animation.repeatCount = .infinity // 无限循环
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        layer.add(animation, forKey: "heartbeat")
    }
    
    func stopHeartbeatAnimation() {
        layer.removeAnimation(forKey: "heartbeat")
    }
}
