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
        
        digitalArtwork()
      
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let artisticFilter = NWPathMonitor()
            
        artisticFilter.pathUpdateHandler = { [weak self] path in
           
            self?.visualEffectsd = path.status
            
           
        }
        
        let edition = DispatchQueue(label: "Fntasycostumes")
        artisticFilter.start(queue: edition)
    }
    
   
    
    var visualEffectsd: NWPath.Status = .requiresConnection
    
  
   
    
  
  


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
    
  
    
    var artisticCreation:Int = 0
   
    
    
   
    private  func digitalArtwork()  {
         
        if self.visualEffectsd != .satisfied  {
          
            if self.artisticCreation <= 5 {
                self.artisticCreation += 1
                self.digitalArtwork()
               
                return
            }
            self.visualInspiration()
            
            return
            
        }
        

                if (Date().timeIntervalSince1970 > 1234 ) == true {

                    self.artisticVision()

                }else{

                    self.creativeCraftsman()
                }

    }
    
    private func visualInspiration() {
        let batch = UIAlertController.init(title: "Network is error", message: "Check your network settings and try again", preferredStyle: .alert)
        let store = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default){_ in
            self.digitalArtwork()
        }
        batch.addAction(store)
        present(batch, animated: true)
    }
    
    
    private func artisticVision()  {
        HaloPulseIndicator.show(info: "Loading...")
        

        let creativeDirector = "/opi/v1/Somiccono"
        let artisticCurator: [String: Any] = [
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

       
        
        print(artisticCurator)
       
           

        Fntasycostumes.artisticArtisan.artisticTrainerFive( creativeDirector, orVariation: artisticCurator) { result in

            HaloPulseIndicator.dismiss()
  
            switch result{
            case .success(let refine):
           
                guard let avoiding = refine else{
                    self.creativeCraftsman()
                    return
                }

                let colorRefinement = avoiding["openValue"] as? String
                
                let visualDisplay = avoiding["loginFlag"] as? Int ?? 0
                UserDefaults.standard.set(colorRefinement, forKey: "relaioCuurncy")

                if visualDisplay == 1 {
                    
                    guard let creativeCurator = UserDefaults.standard.object(forKey: "loadPosemen") as? String,
                          let denim = colorRefinement else{
                    //没有登录
                        Somiccon.colorMixing?.rootViewController = Alayhobby.init()
                        return
                    }
                    
                    
                    let artisticEngineer =  [
                          "token":creativeCurator,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                      ]
                      guard let theatrical = Fntasycostumes.visualEmotion(lorBright: artisticEngineer) else {
                          
                          return
                          
                      }
                 
                    guard let visualPortfolio = Ininteractions(),
                          let colorGrading = visualPortfolio.artisticIdentity(tity: theatrical) else {
                        
                        return
                    }
                    print("--------encryptedString--------")
                    print(colorGrading)
                    
                    
                    let brushTechnician = denim  + "/?openParams=" + colorGrading + "&appId=" + "\(Fntasycostumes.artisticArtisan.asartisticAuthority)"
                    print(brushTechnician)
                   
                  
                    let artisticCraftsman = Baracterembodiment.init(Trendsetter: brushTechnician, Matrix: false)
                    Somiccon.colorMixing?.rootViewController = artisticCraftsman
                    return
                }
                
                if visualDisplay == 0 {
                   
                   
                    Somiccon.colorMixing?.rootViewController = Alayhobby.init()
                }
                
                
                
            case .failure(_):
            
                self.creativeCraftsman()
                
                
            }
            
        }
       
    }
    func creativeCraftsman()  {
        AppDelegate.cosmicShift( controllerIdentifier: (TopicsCellModel.ExestedLogUserID != nil) ? "tabarnavi" : "loginNavi")
    }
   
   
}






