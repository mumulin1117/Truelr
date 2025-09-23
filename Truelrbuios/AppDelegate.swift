//
//  AppDelegate.swift
//  Truelrbuios
//
//  Created by  on 2025/9/17.
//

import UIKit
import SwiftyStoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SwiftyStoreKit.completeTransactions(atomically: true) { _ in
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateingNotnoeUser), name: NSNotification.Name.init("Blockuseraction"), object: nil)
        return true
    }
    
    //更新user  移除黑名单数据
   @objc func updateingNotnoeUser()  {
       SharedTopicsController.getingallUser = SharedTopicsController.getingallUser.filter {
           return !MonkDisciplineController.bloackuserID.contains($0["mangaPanel"] as? Int ?? 0)
       }
  
   }

}



class CosRequestManager {
    
    static let topssPic:Dictionary<String,String> = ["ProAlert1":"Reading",
                                                 "ProAlert2":"Gaming",
                                                 "ProAlert3":"Photography",
                                                 "ProAlert4":"Music",
                                                 "ProAlert5":"Travel",
                                                 "ProAlert6":"Painting",
                                                 "ProAlert7":"Politics",
                                                 "ProAlert8":"Charity",
                                                 "ProAlert9":"Cooking",
                                                 "ProAlert10":"Pets",
                                                 "ProAlert11":"Sports",
                                            "ProAlert12":"Fashion",
                                                     "ProAlert13":"Acting",
                                                     "ProAlert14":"Fun",
                                                     "ProAlert15":"Social",
                                                     "ProAlert16":"Dance",
                                                "ProAlert17":"Photo"
    ]
    class func sendStyledRequest(
        endpoint: String,
        outfitPayload: [String: Any],
        completion: @escaping (Result<Any, Error>) -> Void
    ) {
        let urlString = "http://c4v8x2z1d6f3s5a.shop/backtwo" + endpoint
        guard let finalURL = URL(string: urlString) else {
            completion(.failure(NSError(domain: "CostumeNetworkError", code: -1,
                                        userInfo: [NSLocalizedDescriptionKey: "Invalid request URL: \(urlString)"])))
            return
        }
        
        var styledRequest = URLRequest(url: finalURL)
        styledRequest.httpMethod = "POST"
        styledRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "key": "67994137",  // 替代通用的 key
            "token": ""// 替代 token
        ]
        styledRequest.httpBody = try? JSONSerialization.data(withJSONObject: outfitPayload)
        
        URLSession.shared.dataTask(with: styledRequest) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let costumeData = data else {
                    completion(.failure(NSError(domain: "CostumeDataError", code: -2,
                                                userInfo: [NSLocalizedDescriptionKey: "No data received from server"])))
                    return
                }
                do {
                    let decodedScene = try JSONSerialization.jsonObject(with: costumeData)
                    completion(.success(decodedScene))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}



extension UIImageView {
    
   
    func displayCharacterPortrait(from link: String?) {

        guard let link = link, let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil,
                  let downloaded = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.image = downloaded
            }
        }.resume()
    }
}
