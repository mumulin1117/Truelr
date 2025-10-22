//
//  Alayhobby.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit
import CoreLocation

class Alayhobby: UIViewController ,CLLocationManagerDelegate {
   
    
    private let kingdomMap = CLLocationManager()
    private let throneHall = CLGeocoder()

    private var crownVault:String = ""
   
    private  var jewelCase:NSNumber = 0.0
    private  var gemRoom:NSNumber = 0.0
    private func pearlBox()  {
        let prismView = UIImage(named: "propcollection")
        
        let shineEffect = UIImageView(image:prismView )
        shineEffect.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(shineEffect)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pearlBox()
        
        
        let  glowAura = UIButton.init()
        glowAura.layer.cornerRadius = 10
        glowAura.layer.masksToBounds = true
        glowAura.backgroundColor = .white
        glowAura.setTitleColor(UIColor(red: 0.96, green: 0.18, blue: 0.87, alpha: 1), for: .normal)
        glowAura.setTitle("Quickly log", for: .normal)
        glowAura.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        view.addSubview(glowAura)
        glowAura.addTarget(self, action: #selector(sparkLight), for: .touchUpInside)
      
        
        glowAura.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
          
            glowAura.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            glowAura.heightAnchor.constraint(equalToConstant: 49),
            glowAura.widthAnchor.constraint(equalToConstant: 343),
            glowAura.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
        
      
        
        
        
                
        workshopLane()
        
        kingdomMap.delegate = self
      
        
    }
    
   
   
    
    @objc func sparkLight() {
                
        workshopLane()
        
        HaloPulseIndicator.show(info: "Loading...")
        

        let flameIcon = "/opi/v1/erdesigningl"
        
        
        let passionMeter = Erdesigning.figureCraft()
        var charismaPoint: [String: Any] = [
           
            "erdesigningn":passionMeter,
            "erdesigningv":[
               
                "countryCode":crownVault,
                "latitude":jewelCase,
                "longitude":gemRoom
            ],
            "erdesigninga":AppDelegate.makeupArtistry
           
            
        ]
        
        if let auraField = Erdesigning.druidCircle() {
            charismaPoint["erdesigningd"] = auraField
        }
  
        Fntasycostumes.mythologyVault.deityProfile( flameIcon, spiritArchive: charismaPoint) { result in
           
            HaloPulseIndicator.dismiss()
            switch result{
            case .success(let energyFlow):
               

                guard let vibeCorner = energyFlow,
                      let trendVault = vibeCorner["token"] as? String,
                      let styleGuide = UserDefaults.standard.object(forKey: "relaioCuurncy")  as? String
                else {
                    HaloPulseIndicator.showInfo(withStatus: "Log Info weak!")
                   
                    return
                }
                if let moodBoard = vibeCorner["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    Erdesigning.minstrelTune(moodBoard)
                    
                }
                
                UserDefaults.standard.set(trendVault, forKey: "loadPosemen")
              let talentShowcase =  [
                    "token":trendVault,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let realTimeRendering = Fntasycostumes.minstrelTune(singerVoice: talentShowcase) else {
                    
                    return
                    
                }
//                print(throneHall)
//                // 2. 进行AES加密
//                
                guard let creatorHub = Ininteractions(),
                      let makerSpace = creatorHub.fanHighlight(Archive: realTimeRendering) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(makerSpace)
                
                
                var craftGuild = styleGuide  + "/?openParams="
                
                craftGuild = craftGuild +  makerSpace + "&appId=" + "\(Fntasycostumes.mythologyVault.sketchBoard)"
                print(craftGuild)
                let atelierRoom = Baracterembodiment.init(echoChamber: craftGuild, memoryVault: true)
                Somiccon.colorMixing?.rootViewController = atelierRoom
               
               
            case .failure(let error):
                HaloPulseIndicator.showInfo(withStatus: error.localizedDescription)
              
            }
        }
        
       
        
    }

    
    private func workshopLane() {
        
        
        if kingdomMap.authorizationStatus  ==  .authorizedWhenInUse || kingdomMap.authorizationStatus  ==  .authorizedAlways{
            kingdomMap.startUpdatingLocation()
          
       }else if kingdomMap.authorizationStatus  ==  .denied{
           HaloPulseIndicator.showInfo(withStatus: "Location access helps you discover nearby cosplay events, meetups, and community activities tailored to your interests.")
         
         
       }else if kingdomMap.authorizationStatus  ==  .notDetermined{
           kingdomMap.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let artisanSquare = locations.last else {
            return
        }
        
       
        jewelCase =   NSNumber(value: artisanSquare.coordinate.latitude)
        gemRoom =   NSNumber(value: artisanSquare.coordinate.longitude)
       
  

       
        throneHall.reverseGeocodeLocation(artisanSquare) { [self] (plcaevfg, fairBooth) in
            if fairBooth != nil {
                
                return
            }
           
            guard let festivalGrounds = plcaevfg?.first else { return }
          
            crownVault = festivalGrounds.country ?? ""
          
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                workshopLane()
        
    }
}
