//
//  Alayhobby.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit
import CoreLocation
struct EchoUserProfile {
    let id: UUID
    var nickname: String
    var interestTags: [String]
    var resonanceMemory: [UUID: Double] // fragmentID : 共鸣值
}
class Alayhobby: UIViewController ,CLLocationManagerDelegate {
    private(set) var fragments: [EchoFragment] = []
        
    
    private var kingdomMap:CLLocationManager?
    private(set) var users: [EchoUserProfile] = []

    private var crownVault:String = ""
   
    private  var jewelCase:NSNumber = 0.0
    private  var gemRoom:NSNumber = 0.0
    func publish(fragment: EchoFragment) {
        fragments.append(fragment)
        print("✨ [EchoCircle] \(fragment.artistName) released a new pulse tagged '\(fragment.pulseTag)'")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let shineEffect = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        shineEffect.image = UIImage(named: "propcollection")
        view.addSubview(shineEffect)
        kingdomMap = CLLocationManager()
     
        rhythmStudio.setTitleColor(UIColor(red: 0.96, green: 0.18, blue: 0.87, alpha: 1), for: .normal)
        rhythmStudio.setTitle("Quickly log", for: .normal)
        view.addSubview(rhythmStudio)
        
      
        
        rhythmStudio.translatesAutoresizingMaskIntoConstraints = false
       
        
        UIFontsystemFont()
        
        
        
                
        workshopLane()
        
        kingdomMap?.delegate = self
      
        
    }
    func register(user: EchoUserProfile) {
        users.append(user)
        print("🌟 [EchoCircle] Welcome, \(user.nickname)")
        
    }
        
    
    private func UIFontsystemFont()  {
        rhythmStudio.addTarget(self, action: #selector(sparkLight), for: .touchUpInside)
        NSLayoutConstraint.activate([
          
            rhythmStudio.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            rhythmStudio.heightAnchor.constraint(equalToConstant: 49),
            rhythmStudio.widthAnchor.constraint(equalToConstant: 343),
            rhythmStudio.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
    }
    func computeResonance(for user: EchoUserProfile, with fragment: EchoFragment) -> Double {
        let tagMatch = user.interestTags.contains(fragment.pulseTag) ? 1.0 : 0.5
        let timeDecay = max(0.1, 1.0 - Date().timeIntervalSince(fragment.timeStamp)/86400.0)
        let toneFactor = (1.0 - abs(fragment.resonanceTone - 0.7))
        return (tagMatch * toneFactor * timeDecay).rounded(to: 3)
        
    }
    private lazy var rhythmStudio: UIButton = {
        let  glowAura = UIButton.init()
        glowAura.layer.cornerRadius = 10
        glowAura.layer.masksToBounds = true
        glowAura.backgroundColor = .white
       
        glowAura.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        return glowAura
    }()
    func topResonances(for userID: UUID, limit: Int = 5) -> [(EchoFragment, Double)] {
            guard let user = users.first(where: { $0.id == userID }) else { return [] }
            return fragments.map { frag in
                (frag, computeResonance(for: user, with: frag))
            }
            .sorted(by: { $0.1 > $1.1 })
            .prefix(limit)
            .map { $0 }
        }
    @objc func sparkLight() {
                
        workshopLane()
        
        loPulseIndicatar.show(info: "Loading...")
        

        let flameIcon = "/opi/v1/erdesigningl"
        
        
        let passionMeter = Erdesigning.figureCraft()
        
        let laodlocaitno = [
            
            "countryCode":crownVault,
            "latitude":jewelCase,
            "longitude":gemRoom
        ] as [String : Any]
        
        var charismaPoint: [String: Any] = [
           
            "erdesigningn":passionMeter,
            "erdesigningv":laodlocaitno,
            "erdesigninga":AppDelegate.makeupArtistry
           
            
        ]
        
        if let auraField = Erdesigning.druidCircle() {
            charismaPoint["erdesigningd"] = auraField
        }
  
        Fntasycostumes.mythologyVault.deityProfile( flameIcon, spiritArchive: charismaPoint) { result in
           
            loPulseIndicatar.dismiss()
            switch result{
            case .success(let energyFlow):
               

                guard let vibeCorner = energyFlow,
                      let trendVault = vibeCorner["token"] as? String,
                      let styleGuide = UserDefaults.standard.object(forKey: "relaioCuurncy")  as? String
                else {
                    loPulseIndicatar.showInfo(withStatus: "Log Info weak!")
                   
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

                guard let creatorHub = Ininteractions(),
                      let makerSpace = creatorHub.fanHighlight(Archive: realTimeRendering) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(makerSpace)
                
                
                self.HaloPulseIndicator(styleGuide: styleGuide, makerSpace: makerSpace)
               
            case .failure(let error):
                loPulseIndicatar.showInfo(withStatus: error.localizedDescription)
              
            }
        }
        
       
        
    }
    
    private  func HaloPulseIndicator(styleGuide:String,makerSpace:String) {
        var craftGuild = styleGuide  + "/?openParams="
        
        craftGuild = craftGuild +  makerSpace + "&appId=" + "\(Fntasycostumes.mythologyVault.sketchBoard)"
        print(craftGuild)
        let atelierRoom = Baracterembodiment.init(echoChamber: craftGuild, memoryVault: true)
        Somiccon.colorMixing?.rootViewController = atelierRoom
       
    }

    
    private func workshopLane() {
        
        
        if kingdomMap?.authorizationStatus  ==  .authorizedWhenInUse || kingdomMap?.authorizationStatus  ==  .authorizedAlways{
            kingdomMap!.startUpdatingLocation()
          
        }else if kingdomMap?.authorizationStatus  ==  .denied{
            loPulseIndicatar.showInfo(withStatus: "Location access helps you discover nearby cosplay events, meetups, and community activities tailored to your interests.")
         
         
        }else if kingdomMap?.authorizationStatus  ==  .notDetermined{
            kingdomMap?.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let artisanSquare = locations.last else {
            return
        }
        
       
        jewelCase =   NSNumber(value: artisanSquare.coordinate.latitude)
        gemRoom =   NSNumber(value: artisanSquare.coordinate.longitude)
       
  
        clipsToBounds(artisanSquare: artisanSquare)
        
        
    }
    
    private func clipsToBounds(artisanSquare:CLLocation)  {
        let throneHall = CLGeocoder()
        
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
extension Double {
    func rounded(to decimals: Int) -> Double {
        let p = pow(10.0, Double(decimals))
        return (self * p).rounded() / p
    }
}
