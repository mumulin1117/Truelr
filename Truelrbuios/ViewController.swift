//
//  ViewController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/17.
//

import UIKit

class ViewController: UIViewController {


    
    static var CurrentCoinggUserOwne:Int{
        
        get{
            let k = "CoinggUserOwne"
           return UserDefaults.standard.object(forKey: k) as? Int  ?? 0
        }set{
            let k = "CoinggUserOwne"
            UserDefaults.standard.set(newValue, forKey: k)
        }
    }

   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        AppDelegate.cosmicShift( controllerIdentifier: (TopicsCellModel.ExestedLogUserID != nil) ? "tabarnavi" : "loginNavi")

    }

}

