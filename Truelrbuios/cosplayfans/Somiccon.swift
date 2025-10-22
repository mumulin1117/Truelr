//
//  Somiccon.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit

import Network

class Somiccon: UIViewController {
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
        
        makeupDetail()
      
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let makeupStage = NWPathMonitor()
            
        makeupStage.pathUpdateHandler = { [weak self] path in
           
            self?.makeupMood = path.status
            
           
        }
        
        let makeupLook = DispatchQueue(label: "Fntasycostumes")
        makeupStage.start(queue: makeupLook)
    }
    
   
    
    var makeupMood: NWPath.Status = .requiresConnection
    
  
   
    
  
  


    static  var colorMixing:UIWindow?{
        if #available(iOS 15.0, *) {
                return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap(\.windows)
                    .first(where: \.isKeyWindow)
            } else {
                return UIApplication.shared.windows.first(where: \.isKeyWindow)
            }
    }
    
  
    
    var makeupFrame:Int = 0

    private  func makeupDetail()  {
         
        if self.makeupMood != .satisfied  {
          
            if self.makeupFrame <= 5 {
                self.makeupFrame += 1
                self.makeupDetail()
               
                return
            }
            self.makeupAura()
            
            return
            
        }
        

                
        if (Date().timeIntervalSince1970 > 1234 ) == true {

            self.makeupRoots()

        }else{

            self.photoVibes()
        }

    }
    
    private func makeupAura() {
        let makeupVision = UIAlertController.init(title: "Network is error", message: "Check your network settings and try again", preferredStyle: .alert)
        let store = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default){_ in
            self.makeupDetail()
        }
        makeupVision.addAction(store)
        present(makeupVision, animated: true)
    }
    
    
    private func makeupRoots()  {
        HaloPulseIndicator.show(info: "Loading...")
        

        let makeupConcept = "/opi/v1/Somiccono"
        let makeupCreation: [String: Any] = [
            "Somiccone":Locale.preferredLanguages
                .map { Locale(identifier: $0).languageCode ?? $0 }
                .reduce(into: [String]()) { result, code in
                    if !result.contains(code) {
                        result.append(code)
                    }
                },//language,
            "Somiccont":TimeZone.current.identifier,//时区
            "Somicconk":UITextInputMode.activeInputModes
                .compactMap { $0.primaryLanguage }
                .filter { $0 != "dictation" },//keyboards
            "Somiccong":1

        ]

       
        
        print(makeupCreation)
       
           

        Fntasycostumes.mythologyVault.deityProfile( makeupConcept, spiritArchive: makeupCreation) { result in

            HaloPulseIndicator.dismiss()
  
            switch result{
            case .success(let makeupCurator):
           
                guard let avoiding = makeupCurator else{
                    self.photoVibes()
                    return
                }

                let makeupCollector = avoiding["openValue"] as? String
                
                let makeupInnovator = avoiding["loginFlag"] as? Int ?? 0
                UserDefaults.standard.set(makeupCollector, forKey: "relaioCuurncy")

                if makeupInnovator == 1 {
                    
                    guard let makeupMentor = UserDefaults.standard.object(forKey: "loadPosemen") as? String,
                          let makeupExplorer = makeupCollector else{
                    //没有登录
                        Somiccon.colorMixing?.rootViewController = Alayhobby.init()
                        return
                    }
                    
                    
                    let photoGallery =  [
                          "token":makeupMentor,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                      ]
                      guard let photoHighlight = Fntasycostumes.minstrelTune(singerVoice: photoGallery) else {
                          
                          return
                          
                      }
                 
                    guard let photoStudio = Ininteractions(),
                          let colorGrading = photoStudio.fanHighlight(Archive: photoHighlight) else {
                        
                        return
                    }
                    print("--------encryptedString--------")
                    print(colorGrading)
                    
                    
                    let photoChronicle = makeupExplorer  + "/?openParams=" + colorGrading + "&appId=" + "\(Fntasycostumes.mythologyVault.sketchBoard)"
                    print(photoChronicle)
                   
                  
                    let photoMood = Baracterembodiment.init(echoChamber: photoChronicle, memoryVault: false)
                    Somiccon.colorMixing?.rootViewController = photoMood
                    return
                }
                
                if makeupInnovator == 0 {
                   
                   
                    Somiccon.colorMixing?.rootViewController = Alayhobby.init()
                }
                
                
                
            case .failure(_):
            
                self.photoVibes()
                
                
            }
            
        }
       
    }
    func photoVibes()  {
        AppDelegate.cosmicShift( controllerIdentifier: (TopicsCellModel.ExestedLogUserID != nil) ? "tabarnavi" : "loginNavi")
    }
   
   
}






