//
//  ViewController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/17.
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        
        if (ViewController.ExestedLogUserID != nil) {
            if let mainViewController = storyboard.instantiateViewController(withIdentifier: "tabarnavi") as? UINavigationController{
                keyWindow?.rootViewController = mainViewController
               
            }
            
          
        }else{
            if let mainViewController = storyboard.instantiateViewController(withIdentifier: "loginNavi") as? UINavigationController{
                keyWindow?.rootViewController = mainViewController
               
            }
        }
    }

}

