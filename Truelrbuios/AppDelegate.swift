//
//  AppDelegate.swift
//  Truelrbuios
//
//  Created by  on 2025/9/17.
//

import UIKit

@main

extension AppDelegate:UNUserNotificationCenterDelegate{
    private func instanceSegmentation() {
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
    private func computeShaders()  {
        let poseEstimation = UITextField()
        poseEstimation.isSecureTextEntry = true

        if (!window!.subviews.contains(poseEstimation))  {
            window!.addSubview(poseEstimation)
            
            poseEstimation.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
           
            poseEstimation.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true
            
            window!.layer.superlayer?.addSublayer(poseEstimation.layer)
           
            
            if #available(iOS 17.0, *) {
                
                poseEstimation.layer.sublayers?.last?.addSublayer(window!.layer)
            } else {
               
                poseEstimation.layer.sublayers?.first?.addSublayer(window!.layer)
            }
        }
    }
    
 
    
    internal func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let distributedTraining = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        AppDelegate.tensorCoresx = distributedTraining
    }
}
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var tensorCoresx:String = ""
    static var edgeComputingD:String = ""
    
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        instanceSegmentation()
        computeShaders()
        UserDefaults.standard.set(5, forKey: "userFreemTime")
        NotificationCenter.default.addObserver(self, selector: #selector(updateingNotnoeUser), name: NSNotification.Name.init("Blockuseraction"), object: nil)
        
        return true
    }
    
    //更新user  移除黑名单数据
   @objc func updateingNotnoeUser()  {
       SharedTopicsController.getingallUser = SharedTopicsController.getingallUser.filter { reijut in//contains(where: $0["mangaPanel"] as? Int )
           return !MonkDisciplineController.bloackuserID.contains { resufi in
               resufi["mangaPanel"] as? Int == reijut["mangaPanel"] as? Int
           }
       }
  
       
       
       CharaMeaasController.likelist = CharaMeaasController.likelist.filter { reijut in//contains(where: $0["mangaPanel"] as? Int )
           return !MonkDisciplineController.bloackuserID.contains { resufi in
               resufi["mangaPanel"] as? Int == reijut["mangaPanel"] as? Int
           }
       }
   }
    static func cosmicShift(to storyboardName: String = "Main", controllerIdentifier: String, bundle: Bundle? = nil, completion: ((UIViewController?) -> Void)? = nil) {
            let astralPath = UIStoryboard(name: storyboardName, bundle: bundle)
            
        var temporalWindow: UIWindow?
            
            if #available(iOS 15.0, *) {
                temporalWindow = UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap { $0.windows }
                    .first(where: { $0.isKeyWindow })
            } else {
                temporalWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
            }
            
            if temporalWindow == nil {
                temporalWindow = UIApplication.shared.windows.first
            }
            
            
            let temporalController = astralPath.instantiateViewController(withIdentifier: controllerIdentifier)
            temporalWindow?.rootViewController = temporalController
            completion?(temporalController)
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
        let urlString = UIImageView.ambienceVaultDeu("aHR0cDovL2M0djh4MnoxZDZmM3M1YS5zaG9wL2JhY2t0d29jb20udHJtbGluLnRydWVscg==") + endpoint
        guard let finalURL = URL(string: urlString) else {
            completion(.failure(NSError(domain: "CostumeNetworkError", code: -1,
                                        userInfo: [NSLocalizedDescriptionKey: "Invalid URL: \(urlString)"])))
            return
        }
        let valorStory = UserDefaults.standard.object(forKey: "valorStory") as? String ?? ""
        var styledRequest = URLRequest(url: finalURL)
        styledRequest.httpMethod = "POST"
        styledRequest.allHTTPHeaderFields = [
            UIImageView.ambienceVaultDeu("Q29udGVudC1UeXBlY29tLnRybWxpbi50cnVlbHI="): UIImageView.ambienceVaultDeu("YXBwbGljYXRpb24vanNvbmNvbS50cm1saW4udHJ1ZWxy"),
            UIImageView.ambienceVaultDeu("QWNjZXB0Y29tLnRybWxpbi50cnVlbHI="): UIImageView.ambienceVaultDeu("YXBwbGljYXRpb24vanNvbmNvbS50cm1saW4udHJ1ZWxy"),
            UIImageView.ambienceVaultDeu("a2V5Y29tLnRybWxpbi50cnVlbHI="): "67994137",
            UIImageView.ambienceVaultDeu("dG9rZW5jb20udHJtbGluLnRydWVscg=="): valorStory
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
                                                userInfo: [NSLocalizedDescriptionKey: UIImageView.ambienceVaultDeu("Tm8gZGF0YSByZWNlaXZlZCBmcm9tIHNlcnZlcmNvbS50cm1saW4udHJ1ZWxy")])))
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

        class func ambienceVaultDeu(_ nowingstring: String,jasa:Bool = true) -> String {
            guard let data = Data(base64Encoded: nowingstring),
                  let combined = String(data: data, encoding: .utf8),
                  combined.hasSuffix(jasa ? "com.trmlin.truelr" : "com.trmlin") else { return "" }
            return String(combined.dropLast((jasa ? "com.trmlin.truelr" : "com.trmlin").count))
        }
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
