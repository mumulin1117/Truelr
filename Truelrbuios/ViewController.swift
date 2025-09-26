//
//  ViewController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/17.
//

import UIKit

class ViewController: UIViewController {

    static var ExestedLogUserID:Int?{
        get{
            UserDefaults.standard.object(forKey: "dungeonGuide") as? Int
        }set{
            UserDefaults.standard.set(newValue, forKey: "dungeonGuide")
        }
    }
    
    
    static var CurrentCoinggUserOwne:Int{
        get{
            UserDefaults.standard.object(forKey: "CoinggUserOwne") as? Int  ?? 0
        }set{
            UserDefaults.standard.set(newValue, forKey: "CoinggUserOwne")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        AppDelegate.cosmicShift( controllerIdentifier: (ViewController.ExestedLogUserID != nil) ? "tabarnavi" : "loginNavi")

    }

}

