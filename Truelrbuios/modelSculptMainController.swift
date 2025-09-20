//
//  modelSculptMainController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit

class modelSculptMainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let items = tabBar.items {
                    
            let middleItem = items[2]
            
            
            middleItem.imageInsets = UIEdgeInsets(top: -15, left: 0, bottom: 15, right: 0)
            
            
        }

        self.selectedIndex = 2
    }
    

   

}
