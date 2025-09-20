//
//  SharedTopicsController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit
import SVProgressHUD
import MJRefresh
class SharedTopicsController: UIViewController {
    private var topics:Array<TopicsCellModel> = Array<TopicsCellModel>()
    
  
    
    @IBOutlet weak var topcsView: UICollectionView!
    
    
    private let gridLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32 - 9)/2, height: 220)
            layout.minimumInteritemSpacing = 9
            layout.minimumLineSpacing = 16
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom:100, right: 0)
            return layout
        }()
        
    @IBAction func unwindToA(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }

    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        visionBoard()
        
        self.topcsView.mj_header?.beginRefreshing()
    }
    
    private func visionBoard() {
        topcsView.collectionViewLayout = gridLayout
        topcsView.backgroundColor = .clear
        topcsView.showsVerticalScrollIndicator = false
        topcsView.delegate = self
        topcsView.dataSource = self
        topcsView.mj_header =  MJRefreshNormalHeader(refreshingTarget: self, refreshingAction:#selector(designBlueprint) ) 
        topcsView.register(UINib.init(nibName: "TopicsCell", bundle: nil), forCellWithReuseIdentifier: "TopicsCell")
    }

    
    @objc private func designBlueprint()  {
     
        CosRequestManager.sendStyledRequest(endpoint: "/koczejjgz/nxpav", outfitPayload: ["sigilMaker":20,"insigniaBoard":5,"stageLight":2,"emblemStudio":"67994137"]) { cosplayunityhub in
            
            switch cosplayunityhub{
            case .success(let cosplayunityhub):
                
                guard let response = cosplayunityhub as? Dictionary<String,Any> ,
                      
                        let user = response["data"] as? Array<Dictionary<String,Any>>
                        
                else {
                    
                    SVProgressHUD.showInfo(withStatus: "No topic data nowing!")
                    
                    return
                }
                self.topics = user.toCharacterCards()
                self.topcsView.reloadData()
                self.topcsView.mj_header?.endRefreshing()
            case .failure(let error):
                self.topcsView.mj_header?.endRefreshing()
                SVProgressHUD.showInfo(withStatus: error.localizedDescription)
            }
            
            
        }
    }
}

extension SharedTopicsController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let conceptMap = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicsCell", for: indexPath) as! TopicsCell
        conceptMap.maskTheatre(topics[indexPath.row])
        return conceptMap
        
    }
    
    
    
}

extension SharedTopicsController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moakil = self.topics[indexPath.row]
        
        if let enterController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EnterInTopicController") as? EnterInTopicController{
           
            self.navigationController?.pushViewController(enterController, animated: true)
           
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
                enterController.maskTheatre(moakil)
            }))
            
        }
        
        
    }
    
}


extension Array where Element == [String: Any] {
    func toCharacterCards() -> [TopicsCellModel] {
        return compactMap { TopicsCellModel(setinginit: $0) }
    }
}
