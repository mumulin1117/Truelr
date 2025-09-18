//
//  ComuiniHUbController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/18.
//

import UIKit

class ComuiniHUbController: UIViewController {
//user
    @IBOutlet weak var AnimeStudioCell: UICollectionView!
    
    //dym
    @IBOutlet weak var mangaPanel: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToA(_ segue: UIStoryboardSegue) {
        // 可选：在这里处理回传的数据
    }


}
