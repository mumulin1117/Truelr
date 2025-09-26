//
//  ArenaStageController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/24.
//

import UIKit
import SVProgressHUD
import MJRefresh

class ArenaStageController: UIViewController, painghur {
    var sun:Bool = true
    
    func borrtomChein(isposr: Bool) {
        sun = isposr
        mangaPanel.reloadData()
    }
    
    @IBAction func suteiback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    private var nisertgeing:Dictionary<String,Any>
    private var cellModelFot:TopicsCellModel?
    private var dymTyoe:Int?
    init(cellModelFot: TopicsCellModel? = nil,dymTyoe:Int? = nil,nisertgeing:Dictionary<String,Any>) {
        self.cellModelFot = cellModelFot
        self.dymTyoe = dymTyoe
        self.nisertgeing = nisertgeing
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @IBOutlet weak var mangaPanel: UICollectionView!
    
    
    private let gridLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom:100, right: 0)
            return layout
        }()
    
    @IBOutlet weak var questBoard: UIButton!
    
  
    private func visionBoard() {
        mangaPanel.collectionViewLayout = gridLayout
        mangaPanel.backgroundColor = .clear
        mangaPanel.showsVerticalScrollIndicator = false
        mangaPanel.delegate = self
        mangaPanel.dataSource = self
       
        questBoard.isSelected = CharaMeaasController.likelist.contains(where: { resiuf in
            resiuf["mangaPanel"] as? Int == nisertgeing ["mangaPanel"] as? Int
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(suteiback), name: NSNotification.Name.init("Blockuseraction"), object: nil)
        mangaPanel.register(UINib.init(nibName: "labyrinthPathCell", bundle: nil), forCellWithReuseIdentifier: "labyrinthPathCell")
        mangaPanel.register(UINib.init(nibName: "NOrmalUserinfoCell", bundle: nil), forCellWithReuseIdentifier: "NOrmalUserinfoCell")
        
        mangaPanel.contentInsetAdjustmentBehavior = .never
      
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        visionBoard()
        
    }

    @objc func lisenmeassage(_ sender: Any) {//message
        
        self.showGreetingLimitAlert(in: self, username: nisertgeing["heroArchive"] as? String ?? "")
        
        
    }
    
    @objc func lijhngdycb(_ sender: Any) {//video
        let shipo = TreasuretController.init(nisertgeing: nisertgeing,isfromamatching: false)
       
        shipo.modalPresentationStyle = .fullScreen
        self.present(shipo, animated: true)
        
    }
    
    @IBAction func enchantmentLab(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            self.present(mainViewController, animated: true)
            mainViewController.userINfoID = nisertgeing
        }
    }
    
    
    
    @IBAction func maingkINsatario(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let contaings = CharaMeaasController.likelist.contains(where: { resiuf in
             resiuf["mangaPanel"] as? Int == nisertgeing ["mangaPanel"] as? Int
         })
        if sender.isSelected && contaings == false{
            CharaMeaasController.likelist.insert(nisertgeing, at: 0)
        }
        
        if sender.isSelected == false && contaings == true{
            CharaMeaasController.likelist.removeAll { resiuf in
                resiuf["mangaPanel"] as? Int == nisertgeing ["mangaPanel"] as? Int
            }
        }
    }
    
    
    
    
    
}
extension ArenaStageController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: UIScreen.main.bounds.width , height: 630)
        }
        
        return CGSize(width: UIScreen.main.bounds.width - 30 , height: 320)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if sun == false {
            return 1
        }else{
            if cellModelFot == nil {
                return 1
            }
            return 2
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        if let modalfe = cellModelFot,let ding = dymTyoe,indexPath.row == 1 {
            let conceptMap = collectionView.dequeueReusableCell(withReuseIdentifier: "labyrinthPathCell", for: indexPath) as! labyrinthPathCell
            conceptMap.maskTheatre(modalfe, dymTyoe: ding)
            return conceptMap
        }
        let conceptMap = collectionView.dequeueReusableCell(withReuseIdentifier: "NOrmalUserinfoCell", for: indexPath) as!  NOrmalUserinfoCell
        conceptMap.ritualHall.displayCharacterPortrait(from: nisertgeing["villainProfile"] as? String ?? "")
        conceptMap.delfp = self
        conceptMap.badgeCollector.text = nisertgeing["heroArchive"] as? String ?? ""
        conceptMap.titleSystem.text = nisertgeing["guildForum"] as? String ?? UIImageView.ambienceVaultDeu("Tm8gbG9jYXRpb25jb20udHJtbGluLnRydWVscg==")
        conceptMap.emblemStudio.text = nisertgeing["loreLibrary"] as? String ?? UIImageView.ambienceVaultDeu("Tm8gQnJpZWZjb20udHJtbGluLnRydWVscg==")
        conceptMap.motionCapture.addTarget(self, action: #selector(lijhngdycb), for: .touchUpInside)
        conceptMap.awardRoom.addTarget(self, action: #selector(lisenmeassage), for: .touchUpInside)
       
        return conceptMap
        
    }
    
    
    
}

extension ArenaStageController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let modalfe = cellModelFot,let ding = dymTyoe,indexPath.row == 1 {
           
        
        
        self.navigationController?.pushViewController(AnovationLabControlle.init(cellModelFot: modalfe, dymTyoe: ding), animated: true)
        }
        
    }
    
}


extension ArenaStageController{
    
    private func showGreetingLimitAlert(in viewController: UIViewController, username: String) {
        let alert = UIAlertController(
            title: UIImageView.ambienceVaultDeu("R3JlZXRpbmcgTGltaXQgUmVhY2hlZGNvbS50cm1saW4udHJ1ZWxy"),
            message: "You can only send one greeting message to \(username) unless you become mutual followers.",
            preferredStyle: .alert
        )
        
        let followAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("U2F5IEhpY29tLnRybWxpbi50cnVlbHI="), style: .default) { _ in
            let shipo = DanceRoutineController.init( nisertgeing: self.nisertgeing)
           
            self.navigationController?.pushViewController(shipo, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("T0tjb20udHJtbGluLnRydWVscg=="), style: .cancel, handler: nil)
        
        alert.addAction(followAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
