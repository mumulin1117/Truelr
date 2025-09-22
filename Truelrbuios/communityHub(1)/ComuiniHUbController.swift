//
//  ComuiniHUbController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit
import MJRefresh
import SVProgressHUD

class ComuiniHUbController: UIViewController {
//user
    @IBOutlet weak var AnimeStudioCell: UICollectionView!
    
    //dym
    @IBOutlet weak var mangaPanel: UICollectionView!
    
    private var topics:Array<TopicsCellModel> = Array<TopicsCellModel>()
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
    
    var pickingShing:Int = 0
    @IBAction func posstingDym(_ sender: UIButton) {
       
        let retuio = self.view.viewWithTag(340) as? UIButton
        let retuio1 = self.view.viewWithTag(341) as? UIButton
        retuio1?.isSelected = false
        retuio?.isSelected = false
        
        sender.isSelected = true
        self.pickingShing = sender.tag - 340
        self.mangaPanel.mj_header?.beginRefreshing()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
       override func viewDidLoad() {
           super.viewDidLoad()
           visionBoard()
           
           masqueradeHall()
          
           self.mangaPanel.mj_header?.beginRefreshing()
       }
       
       private func visionBoard() {
           mangaPanel.collectionViewLayout = gridLayout
           mangaPanel.backgroundColor = .clear
           mangaPanel.showsVerticalScrollIndicator = false
           mangaPanel.delegate = self
           mangaPanel.dataSource = self
           mangaPanel.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction:#selector(designBlueprint) )
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
        
           CosRequestManager.sendStyledRequest(endpoint: "/koczejjgz/nxpav", outfitPayload: ["sigilMaker":20,"insigniaBoard":1,"emblemStudio":"67994137"]) { cosplayunityhub in
               
               switch cosplayunityhub{
               case .success(let cosplayunityhub):
                   
                   guard let response = cosplayunityhub as? Dictionary<String,Any> ,
                         
                           let user = response["data"] as? Array<Dictionary<String,Any>>
                           
                   else {
                       
                       SVProgressHUD.showInfo(withStatus: "No topic data nowing!")
                       
                       return
                   }
                   let alltopiv = user.toCharacterCards()
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
                   self.mangaPanel.mj_header?.endRefreshing()
               case .failure(let error):
                   self.mangaPanel.mj_header?.endRefreshing()
                   SVProgressHUD.showInfo(withStatus: error.localizedDescription)
               }
               
               
           }
       }
    
    
    @objc private func masqueradeHall()  {
        self.activeUserpics = SharedTopicsController.getingallUser.suffix(4)
        self.AnimeStudioCell.reloadData()
//        CosRequestManager.sendStyledRequest(endpoint: "/dlzeplzdlmstdz/sxsiciehbldjf", outfitPayload: ["animeStudio":"67994137"]) { cosplayunityhub in
//            
//            switch cosplayunityhub{
//            case .success(let cosplayunityhub):
//                
//                guard let response = cosplayunityhub as? Dictionary<String,Any> ,
//                      
//                        let user = response["data"] as? Array<Dictionary<String,Any>>
//                        
//                else {
//                    
//                    SVProgressHUD.showInfo(withStatus: "No active user data nowing!")
//                    
//                    return
//                }
//                if SharedTopicsController.getingallUser.count == 0 {
//                    ComuiniHUbController.getingallUser = user
//                }
//               
//
//               
//            case .failure(let error):
//               break
//            }
//            
//            
//        }
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
           return conceptMap
           
       }
       
       
       
   }

   extension ComuiniHUbController:UICollectionViewDelegate{
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if collectionView == AnimeStudioCell {
               return
           }
           let moakil = self.topics[indexPath.row]
           self.navigationController?.pushViewController(AnovationLabControlle.init(cellModelFot: moakil, dymTyoe: pickingShing), animated: true)
         
           
       }
       
   }
