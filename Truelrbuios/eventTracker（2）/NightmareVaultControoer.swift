//
//  NightmareVaultControoer.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/22.
//

import UIKit
//1vn
class NightmareVaultControoer: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    private var nisertgeing:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nisertgeing.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let user = nisertgeing[indexPath.row]
        
        let laiu = collectionView.dequeueReusableCell(withReuseIdentifier: "EventtrackerCell", for: indexPath) as! EventtrackerCell
       
        return laiu
        
    }
   @objc func rpeouingtety(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            self.present(mainViewController, animated: true)
           
        }
        
    }
   
    @IBOutlet weak var planetariumView: UICollectionView!
    
    @IBAction func unwindToLike(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        visionBoard()
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
       
        planetariumView.collectionViewLayout = gridLayout
        planetariumView.backgroundColor = .clear
        planetariumView.showsVerticalScrollIndicator = false
        planetariumView.delegate = self
        planetariumView.dataSource = self
       
       
        planetariumView.register(UINib.init(nibName: "EventtrackerCell", bundle: nil), forCellWithReuseIdentifier: "EventtrackerCell")
        
        
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventr = nisertgeing[indexPath.row]
         let user = SharedTopicsController.getingallUser[indexPath.row]
       
//        let mush = EventEcentController.init(enventringo: eventr, uinit: user)
//        self.navigationController?.pushViewController(mush, animated: true)
    }
}
