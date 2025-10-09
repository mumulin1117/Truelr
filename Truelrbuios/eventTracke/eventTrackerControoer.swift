//
//  eventTrackerControoer.swift
//  Truelrbuios
//
//  Created by  on 2025/9/22.
//

import UIKit

class eventTrackerControoer: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var enenuLani: UIImageView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if SharedTopicsController.getingallUser.count >= 4 {
            return 4
        }
        return SharedTopicsController.getingallUser.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let eventr = enentInfo[indexPath.row]
        let user = SharedTopicsController.getingallUser[indexPath.row]
        
        let laiu = collectionView.dequeueReusableCell(withReuseIdentifier: "EventtrackerCell", for: indexPath) as! EventtrackerCell
        laiu.heroicDeed.image = UIImage(named: eventr["picture"] ?? "")
        laiu.valorStory.displayCharacterPortrait(from: user["villainProfile"] as? String)
        laiu.samuraiCode.text = "pubtime:" + (eventr["pubtime"] ?? "")
        laiu.ninjaScroll.text = eventr["them"]
        
        laiu.warriorPath.text = eventr["starttime"]
        laiu.minstrelTune.addTarget(self, action: #selector(rpeouingtety), for: .touchUpInside)
        laiu.monkDiscipline.text = eventr["locationk"]
        laiu.knightOrder.text = user["heroArchive"] as? String
        return laiu
        
    }
   @objc func rpeouingtety(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            mainViewController.userINfoID = nil
            self.present(mainViewController, animated: true)
           
        }
        
    }
   
    @IBOutlet weak var planetariumView: UICollectionView!
    
    @IBOutlet weak var mangaPanel: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enenuLani.startHeartbeatAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        enenuLani.stopHeartbeatAnimation()
    }
    let enentInfo:Array<Dictionary<String,String>> = [
        ["them":"CosWave Runway Bash",
                         "starttime":"2025-10-12 14:00:00",
                         "locationk":"Downtown Convention Hall, Los Angeles",
                         "picture":"event0",
                         "ifJoined":"false",
         "pubtime":"2025-09-26"
           ],
        ["them":"CosTune Convention Night",
                         "starttime":"2025-10-02 18:30:00",
                         "locationk":"Shibuya Anime Café, Tokyo",
                         "picture":"event2",
                         "ifJoined":"false",
         "pubtime":"2025-09-25"
           ],
        ["them":"OpenAir Cos Con Shoot",
                         "starttime":"2025-11-10 15:00:00",
                         "locationk":"Central Park, New York",
                         "picture":"event3",
                         "ifJoined":"false",
         "pubtime":"2025-09-24"
           ],
        ["them":"CosQuest Convention Clash",
                         "starttime":"2025-11-23 11:00:00",
                         "locationk":"Esports Arena, Seoul",
                         "picture":"event4",
                         "ifJoined":"false",
         "pubtime":"2025-09-23"
           ]
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        visionBoard()
    }
    

    @IBAction func unwindToB(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }
    private let gridLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32 , height: 220)
            layout.minimumInteritemSpacing = 16
            layout.minimumLineSpacing = 16
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom:100, right: 0)
            return layout
        }()
    private func visionBoard() {
       
        mangaPanel.collectionViewLayout = gridLayout
        mangaPanel.backgroundColor = .clear
        mangaPanel.showsVerticalScrollIndicator = false
        mangaPanel.delegate = self
        mangaPanel.dataSource = self
       
       
        mangaPanel.register(UINib.init(nibName: "EventtrackerCell", bundle: nil), forCellWithReuseIdentifier: "EventtrackerCell")
        
        
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventr = enentInfo[indexPath.row]
         let user = SharedTopicsController.getingallUser[indexPath.row]
       
        let mush = EventEcentController.init(enventringo: eventr, uinit: user)
        self.navigationController?.pushViewController(mush, animated: true)
    }
}
