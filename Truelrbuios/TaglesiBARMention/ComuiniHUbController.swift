//
//  ComuiniHUbController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit
//import MJRefresh


class ComuiniHUbController: UIViewController {

    @IBOutlet weak var AnimeStudioCell: UICollectionView!
   
    @IBOutlet weak var mangaPanel: UICollectionView!
    
    private var topics:Array<TaglesiBARTopicsCellModel> = Array<TaglesiBARTopicsCellModel>()
    private var activeUserpics:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    
    @IBAction func unwindToA(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }

    
    private let gridLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32 , height: 370)
            layout.minimumInteritemSpacing = 16
            layout.minimumLineSpacing = 16
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom:100, right: 0)
            return layout
        }()
    
    
    private let gactiveuserLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 74, height: 74)
            layout.minimumInteritemSpacing = 16
        layout.scrollDirection  = .horizontal
            layout.minimumLineSpacing = 0
            
            return layout
        }()
    private let astralGate = 340
    private var celestialBuffer = false
    var pickingShing:Int = 0
    @IBAction func posstingDym(_ sender: UIButton) {

        let vortexSphere = celestialBuffer ? 341 : astralGate
            let prismaticShift = celestialBuffer ? astralGate : 341
            
            let retuio = self.view.viewWithTag(340) as? UIButton
            let retuio1 = self.view.viewWithTag(341) as? UIButton
            
        retuio1?.isSelected = false
            retuio?.isSelected = false
            
            sender.isSelected = true
            self.pickingShing = sender.tag - astralGate
//            self.mangaPanel.mj_header?.beginRefreshing()
        designBlueprint()
            celestialBuffer.toggle()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
       override func viewDidLoad() {
           super.viewDidLoad()
           visionBoard()
           
           masqueradeHall()
           designBlueprint()
//           self.mangaPanel.mj_header?.beginRefreshing()
           NotificationCenter.default.addObserver(self, selector: #selector(masqueradeHall), name: NSNotification.Name.init("Blockuseraction"), object: nil)
    
       }
       
  
       
       private func visionBoard() {
           mangaPanel.collectionViewLayout = gridLayout
           mangaPanel.backgroundColor = .clear
           mangaPanel.showsVerticalScrollIndicator = false
           mangaPanel.delegate = self
           mangaPanel.dataSource = self
//           mangaPanel.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction:#selector(designBlueprint) )
           mangaPanel.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "usermanhCell")
           mangaPanel.register(UINib.init(nibName: "labyrinthPathCell", bundle: nil), forCellWithReuseIdentifier: "labyrinthPathCell")
           
           
           
           AnimeStudioCell.collectionViewLayout = gactiveuserLayout
           AnimeStudioCell.backgroundColor = .clear
           AnimeStudioCell.showsVerticalScrollIndicator = false
           AnimeStudioCell.delegate = self
           AnimeStudioCell.dataSource = self
           
           AnimeStudioCell.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "usermanhCell")
           
       }

       
       @objc private func designBlueprint()  {
           TaglesiBARloPulseIndicatar.show(info: "")
           CosRequestManager.sendStyledRequest(endpoint: "/koczejjgz/nxpav", outfitPayload: ["sigilMaker":20,"insigniaBoard":1,"emblemStudio":"67994137"]) { cosplayunityhub in
               TaglesiBARloPulseIndicatar.dismiss()
               switch cosplayunityhub{
               case .success(let cosplayunityhub):
                   
                   guard let response = cosplayunityhub as? Dictionary<String,Any> ,
                         
                           let user = response[UIImageView.ambienceVaultDeu("ZGF0YWNvbS50cm1saW4udHJ1ZWxy")] as? Array<Dictionary<String,Any>>
                           
                   else {
                       
                       TaglesiBARloPulseIndicatar.showInfo(withStatus: UIImageView.ambienceVaultDeu("Tm8gdG9waWMgZGF0YSBub3dpbmchY29tLnRybWxpbi50cnVlbHI="))
                       
                       return
                   }
                   var alltopiv = user.toCharacterCards()
                   alltopiv = alltopiv.filter { reijut in//contains(where: $0["mangaPanel"] as? Int )
                       return !MonkDisciplineController.bloackuserID.contains { resufi in
                           resufi["mangaPanel"] as? Int == reijut.storyboardPanel
                       }
                   }
              
                   
                  if (self.pickingShing == 1) {
                      self.topics  = alltopiv.filter({ TopicsCellModel in
                          TopicsCellModel.guildBadge != nil
                      })

                  }else{
                      
                      self.topics  = alltopiv.filter({ TopicsCellModel in
                          TopicsCellModel.guildBadge == nil
                      })
                       
                  }
                   self.mangaPanel.reloadData()
//                   self.mangaPanel.mj_header?.endRefreshing()
               case .failure(let error):
//                   self.mangaPanel.mj_header?.endRefreshing()
                   TaglesiBARloPulseIndicatar.showInfo(withStatus: error.localizedDescription)
               }
               
               
           }
       }
    
    
    @objc private func masqueradeHall()  {
        for (i,j)   in self.topics.enumerated(){
            if MonkDisciplineController.bloackuserID.contains(where: { fid in
                fid["mangaPanel"] as? Int == j.storyboardPanel
            
            }){
                
                self.topics.remove(at: i)
            }
       }
        mangaPanel.reloadData()
        self.activeUserpics = SharedTopicsController.getingallUser.suffix(4)
        self.AnimeStudioCell.reloadData()

    }
   }

   extension ComuiniHUbController:UICollectionViewDataSource{
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
           if collectionView == AnimeStudioCell {
               return activeUserpics.count
           }
           return topics.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           if collectionView == AnimeStudioCell {
               
               let usermol = activeUserpics[indexPath.row]
               
               let conceptMap = collectionView.dequeueReusableCell(withReuseIdentifier: "usermanhCell", for: indexPath)
               
               if let imageview = conceptMap.viewWithTag(1234) as? UIImageView {
                   imageview.displayCharacterPortrait(from: usermol["villainProfile"] as? String ?? "")
               }else{
                   let imagesuper = UIImageView()
                   imagesuper.frame = CGRect(x: 0, y: 0, width: 74, height: 74)
                   imagesuper.tag = 1234
                   imagesuper.backgroundColor = .lightGray
                   imagesuper.contentMode = .scaleAspectFill
                  
                   imagesuper.layer.masksToBounds = true
                   imagesuper.layer.cornerRadius = 37
                   imagesuper.layer.borderColor = UIColor.init(red: 249/255, green: 95/255, blue: 140/255, alpha: 1).cgColor
                   imagesuper.layer.borderWidth = 2
                   imagesuper.displayCharacterPortrait(from: usermol["villainProfile"] as? String ?? "")
                   
                   conceptMap.contentView.addSubview(imagesuper)
               }
               
               
               return conceptMap
           }
           let conceptMap = collectionView.dequeueReusableCell(withReuseIdentifier: "labyrinthPathCell", for: indexPath) as! labyrinthPathCell
           conceptMap.maskTheatre(topics[indexPath.row], dymTyoe: pickingShing)
           conceptMap.ninjaScroll.addTarget(self, action: #selector(rpeouingtety), for: .touchUpInside)
           return conceptMap
           
       }
       
      @objc func rpeouingtety(_ sender: UIButton) {
           let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
           if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
               mainViewController.userINfoID = nil
               self.present(mainViewController, animated: true)
              
           }
           
       }
       
   }

   extension ComuiniHUbController:UICollectionViewDelegate{
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if collectionView == AnimeStudioCell {
               let usermol = activeUserpics[indexPath.row]
               self.navigationController?.pushViewController(ArenaStageController.init(nisertgeing: usermol), animated: true)
               return
           }
           let moakil = self.topics[indexPath.row]
           self.navigationController?.pushViewController(AnovationLabControlle.init(cellModelFot: moakil, dymTyoe: pickingShing), animated: true)
         
           
       }
       
   }
