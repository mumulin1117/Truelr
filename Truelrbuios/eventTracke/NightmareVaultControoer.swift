//
//  NightmareVaultControoer.swift
//  Truelrbuios
//
//  Created by  on 2025/9/22.
//

import UIKit

//1vn
class NightmareVaultControoer: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    private let usageManager = CoinUsageManager()
    
    
    private var nisertgeing:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nisertgeing.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let user = nisertgeing[indexPath.row]
        
        let laiu = collectionView.dequeueReusableCell(withReuseIdentifier: "MainshMaCell", for: indexPath) as! MainshMaCell
        laiu.familiarGuide.displayCharacterPortrait(from: user["villainProfile"] as? String)
        laiu.guildBadge.image = UIImage(named: "ProAlert\(CondiFilterControoer.pickingCondictuin.randomElement() ?? 17)=4")
        laiu.petTrainer.tag = indexPath.row
        laiu.petTrainer.addTarget(self, action: #selector(rpeouingtety(sender:)), for: .touchUpInside)
        return laiu
        
    }

   
   @objc func rpeouingtety(sender: UIButton) {
        let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            self.present(mainViewController, animated: true)
            
            mainViewController.userINfoID = nisertgeing[sender.tag]
        }
        
    }
   
    @IBOutlet weak var planetariumView: UICollectionView!
    
    @IBAction func unwindToLike(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }
    
    @IBOutlet weak var fantasyAtlas: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mangaPanel()
        visionBoard()
        fantasyAtlas.setTitle(" \(Somiccon.CurrentCoinggUserOwne)", for: .normal)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateingNotnoeUser), name: NSNotification.Name.init("Blockuseraction"), object: nil)
 
    }
    
    //更新user  移除黑名单数据
   @objc func updateingNotnoeUser()  {
       nisertgeing =  nisertgeing.filter { reijut in//contains(where: $0["mangaPanel"] as? Int )
           return !MonkDisciplineController.bloackuserID.contains { resufi in
               resufi["mangaPanel"] as? Int == reijut["mangaPanel"] as? Int
           }
       }
  
       self.planetariumView.reloadData()
   }
    private let gridLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/2 , height: 236)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 88
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom:80, right: 0)
            return layout
        }()
    private func visionBoard() {
       
        planetariumView.collectionViewLayout = gridLayout
        planetariumView.backgroundColor = .clear
        planetariumView.showsVerticalScrollIndicator = false
        planetariumView.delegate = self
        planetariumView.dataSource = self
       
       
        planetariumView.register(UINib.init(nibName: "MainshMaCell", bundle: nil), forCellWithReuseIdentifier: "MainshMaCell")
        
        
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventr = nisertgeing[indexPath.row]
        
 
        self.navigationController?.pushViewController(ArenaStageController.init(nisertgeing: eventr), animated: true)
    }
    
    @IBAction func actingCoach(_ sender: UIButton) {
        
        let prensebla = RibbonVaulControoer.init()
        self.navigationController?.pushViewController(prensebla, animated: true)
       
    }
    
    @IBAction func harmonyHall(_ sender: UIButton) {
        
        usageManager.onStartMatching = {
            self.mangaPanel()
            self.planetariumView.reloadData()
        }
        
        usageManager.onNavigateToCoinStore = {
            
            self.navigationController?.pushViewController(RibbonVaulControoer(), animated: true)
        }
        if usageManager.canAffordMatch() {
                    // 显示提示但允许继续
            usageManager.showMatchConfirmation(in: self)
        } else {
            // 显示收费确认
            usageManager.showInsufficientBalanceAlert(in: self)
        }
        
       
    }
    
    
    private func mangaPanel()  {
        HaloPulseIndicator.show(info: "")
        let safeCount = Swift.min(4, SharedTopicsController.getingallUser.count)   // 防止越界
                
        self.nisertgeing = Array(SharedTopicsController.getingallUser.shuffled().prefix(safeCount))
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: DispatchWorkItem(block: {
            HaloPulseIndicator.dismiss()
            
        }))
        
    }
    
}
