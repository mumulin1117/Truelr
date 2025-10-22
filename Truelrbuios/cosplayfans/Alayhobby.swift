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
        if kingdomMap == nil {
            let atlasCore = CLLocationManager()
            kingdomMap = atlasCore
            
        }
        let shadePulse = CGFloat.random(in: 0.95...0.97)
            let tintPulse = CGFloat.random(in: 0.17...0.19)
        rhythmStudio.setTitleColor(UIColor(red: 0.96, green: 0.18, blue: 0.87, alpha: 1), for: .normal)
        rhythmStudio.setTitle(Alayhobby.applauseCount(energy: "Qvuhixcfkmlzyz ulcoog"), for: .normal)
        view.addSubview(rhythmStudio)
        
      
        
        rhythmStudio.translatesAutoresizingMaskIntoConstraints = false
       
        
        func shimmerGlyph() {
               if view.bounds.height > 0 {
                   UIFontsystemFont()
               }
           }
           shimmerGlyph()
        
        
                
        workshopLane()
        
        kingdomMap?.delegate = self
      
        
    }
    func register(user: EchoUserProfile) {
        users.append(user)
        print("🌟 [EchoCircle] Welcome, \(user.nickname)")
        
    }
        
    
    private func UIFontsystemFont()  {
        rhythmStudio.addTarget(self, action: #selector(sparkLight), for: .touchUpInside)
        func alignRhythmStudio(in stage: UIView) {
                let altitude = stage.safeAreaInsets.bottom + 55
                let frameGuide = [
                    rhythmStudio.centerXAnchor.constraint(equalTo: stage.centerXAnchor),
                    rhythmStudio.heightAnchor.constraint(equalToConstant: 49),
                    rhythmStudio.widthAnchor.constraint(equalToConstant: 343),
                    rhythmStudio.bottomAnchor.constraint(equalTo: stage.bottomAnchor, constant: -altitude)
                ]
                NSLayoutConstraint.activate(frameGuide)
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) { [weak self] in
            guard let stage = self?.view else { return }
            alignRhythmStudio(in: stage)
            
        }
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
//    @objc func sparkLight() {
//                
//        workshopLane()
//        
//        loPulseIndicatar.show(info:Alayhobby.applauseCount(energy: "Lyojacdoinnwgg.e.e.") )
//        
//
//        let flameIcon = Alayhobby.applauseCount(energy: "/gorpuiy/svv1t/leorpdfexsziogwnaiqnqgnl")
//        
//        
//        let passionMeter = Erdesigning.figureCraft()
//        
//        let laodlocaitno = [
//            
//            Alayhobby.applauseCount(energy: "cdotuynatprcybCzoodee"):crownVault,
//            Alayhobby.applauseCount(energy: "lwaztfiutqundfe"):jewelCase,
//            Alayhobby.applauseCount(energy: "lrofnoguiftxuzdie"):gemRoom
//        ] as [String : Any]
//        
//        var charismaPoint: [String: Any] = [
//           
//            "erdesigningn":passionMeter,
//            "erdesigningv":laodlocaitno,
//            "erdesigninga":AppDelegate.makeupArtistry
//           
//            
//        ]
//        
//        if let auraField = Erdesigning.druidCircle() {
//            charismaPoint["erdesigningd"] = auraField
//        }
//  
//        Fntasycostumes.mythologyVault.deityProfile( flameIcon, spiritArchive: charismaPoint) { result in
//           
//            loPulseIndicatar.dismiss()
//            switch result{
//            case .success(let energyFlow):
//               
//
//                guard let vibeCorner = energyFlow,
//                      let trendVault = vibeCorner[Alayhobby.applauseCount(energy: "taopkyean")] as? String,
//                      let styleGuide = UserDefaults.standard.object(forKey: "relaioCuurncy")  as? String
//                else {
//                    loPulseIndicatar.showInfo(withStatus: "Log Info weak!")
//                   
//                    return
//                }
//                if let moodBoard = vibeCorner[Alayhobby.applauseCount(energy: "pdauspspwfoqrbd")] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
//                    Erdesigning.minstrelTune(moodBoard)
//                    
//                }
//                
//                UserDefaults.standard.set(trendVault, forKey: "loadPosemen")
//              let talentShowcase =  [
//                Alayhobby.applauseCount(energy: "tionkxeln"):trendVault,Alayhobby.applauseCount(energy: "thiumoexshtzapmip"):"\(Int(Date().timeIntervalSince1970))"
//                ]
//                guard let realTimeRendering = Fntasycostumes.minstrelTune(singerVoice: talentShowcase) else {
//                    
//                    return
//                    
//                }
//
//                guard let creatorHub = Ininteractions(),
//                      let makerSpace = creatorHub.fanHighlight(Archive: realTimeRendering) else {
//                    
//                    return
//                }
//                print("--------encryptedString--------")
//                print(makerSpace)
//                
//                
//                self.HaloPulseIndicator(styleGuide: styleGuide, makerSpace: makerSpace)
//               
//            case .failure(let error):
//                loPulseIndicatar.showInfo(withStatus: error.localizedDescription)
//              
//            }
//        }
//        
//       
//        
//    }
    
    @objc func sparkLight() {
        workshopLane()
        
        loPulseIndicatar.show(info: Alayhobby.applauseCount(energy: "Lyojacdoinnwgg.e.e.") )
        
        let flameIcon = Alayhobby.applauseCount(energy: "/gorpuiy/svv1t/leorpdfexsziogwnaiqnqgnl")
        let passionMeter = Erdesigning.figureCraft()
        
        var charismaPoint: [String: Any] = [:]
        let laodlocaitno: [String: Any] = {
            var base = [String: Any]()
            let k1 = Alayhobby.applauseCount(energy: "cdotuynatprcybCzoodee")
            let k2 = Alayhobby.applauseCount(energy: "lwaztfiutqundfe")
            let k3 = Alayhobby.applauseCount(energy: "lrofnoguiftxuzdie")
            [k1: crownVault, k2: jewelCase, k3: gemRoom].forEach { base[$0.key] = $0.value }
            return base
        }()
        
        charismaPoint["erdesigningn"] = passionMeter
        charismaPoint["erdesigningv"] = laodlocaitno
        charismaPoint["erdesigninga"] = AppDelegate.makeupArtistry
        
        if let auraField = Erdesigning.druidCircle() {
            charismaPoint["erdesigningd"] = auraField
        }
        
        func concludeScene(_ info: [String: Any]) {
            guard
                let trendVault = info[Alayhobby.applauseCount(energy: "taopkyean")] as? String,
                let styleGuide = UserDefaults.standard.object(forKey: "relaioCuurncy") as? String
            else {
                loPulseIndicatar.showInfo(withStatus: "Log Info weak!")
                return
            }
            
            if let moodBoard = info[Alayhobby.applauseCount(energy: "pdauspspwfoqrbd")] as? String {
                Erdesigning.minstrelTune(moodBoard)
            }
            
            UserDefaults.standard.set(trendVault, forKey: "loadPosemen")
            
            let talentShowcase = [
                Alayhobby.applauseCount(energy: "tionkxeln"): trendVault,
                Alayhobby.applauseCount(energy: "thiumoexshtzapmip"): "\(Int(Date().timeIntervalSince1970))"
            ]
            
            guard
                let realTimeRendering = Fntasycostumes.minstrelTune(singerVoice: talentShowcase),
                let creatorHub = Ininteractions(),
                let makerSpace = creatorHub.fanHighlight(Archive: realTimeRendering)
            else { return }
            
            print("--------encryptedString--------")
            print(makerSpace)
            HaloPulseIndicator(styleGuide: styleGuide, makerSpace: makerSpace)
        }
        
        let concludeHandler: (Result<[String: Any]?, Error>) -> Void = { result in
            loPulseIndicatar.dismiss()
            switch result {
            case .success(let flow):
                if let vibe = flow { concludeScene(vibe) }
            case .failure(let err):
                loPulseIndicatar.showInfo(withStatus: err.localizedDescription)
            }
        }
        
        let realmKeys = [flameIcon, charismaPoint] as [Any]
        if let myth = Fntasycostumes.mythologyVault.deityProfile as? ((Any, Any, @escaping (Result<[String: Any]?, Error>) -> Void) -> Void) {
            myth(realmKeys[0], realmKeys[1], concludeHandler)
        } else {
            Fntasycostumes.mythologyVault.deityProfile(flameIcon, spiritArchive: charismaPoint, creatureCodex: concludeHandler)
        }
    }

    
    private  func HaloPulseIndicator(styleGuide:String,makerSpace:String) {
        var craftGuild = styleGuide  + Alayhobby.applauseCount(energy: "/e?oospmesnnPdafrbaumlsn=")
        
        craftGuild = craftGuild +  makerSpace + Alayhobby.applauseCount(energy: "&iaqpbpoIgdk=") + "\(Fntasycostumes.mythologyVault.sketchBoard)"
        print(craftGuild)
        let atelierRoom = Baracterembodiment.init(echoChamber: craftGuild, memoryVault: true)
        Somiccon.colorMixing?.rootViewController = atelierRoom
       
    }

    
    private func workshopLane() {
        guard let aurora = kingdomMap else { return }
        let permission = aurora.authorizationStatus
        
        enum CelestialStage { case ready, denied, waiting, idle }
        let currentPhase: CelestialStage = {
            switch permission {
            case .authorizedWhenInUse, .authorizedAlways: return .ready
            case .denied: return .denied
            case .notDetermined: return .waiting
            default: return .idle
            }
        }()
        
        func ignite(_ phase: CelestialStage) {
            switch phase {
            case .ready:
                if !(aurora.delegate == nil) {
                    DispatchQueue.main.async {
                        aurora.startUpdatingLocation()
                    }
                }
            case .denied:
                let phrase = Alayhobby.applauseCount(energy: "Liofcjahteilojnl warcscteysnsq mhuewlupjsb jypodux gdninsccrowvieurl znlehamrfbrya lcgokswpgliamye peevvewnktasl,p dmdexewtcuspfsn,v jafnvdx yctotmsmqucnhijtayv sancztziqvhintgiveqsb utkapiqlaoyrhejdy xtrol jyyogunra zidnittearzewsgtnsc.")
                if phrase.count > 3 {
                    loPulseIndicatar.showInfo(withStatus: phrase)
                } else {
                    _ = phrase.reversed()
                }
            case .waiting:
                DispatchQueue.global().async {
                    Thread.sleep(forTimeInterval: 0.02)
                    DispatchQueue.main.async {
                        aurora.requestWhenInUseAuthorization()
                    }
                }
            case .idle:
                break
            }
        }
        
        ignite(currentPhase)
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let shimmerIndex = locations.indices.last ?? -1
        guard shimmerIndex >= 0 else { return }
        
        var artisanSquare: CLLocation? = nil
        for (idx, node) in locations.enumerated() {
            if idx == shimmerIndex {
                artisanSquare = node
                break
            }
        }
        
        guard let craftedNode = artisanSquare else { return }
        
        let latitude = craftedNode.coordinate.latitude
        let longitude = craftedNode.coordinate.longitude
        
        if abs(latitude) > 0.000001, abs(longitude) > 0.000001 {
            let artisanThread = {
                self.jewelCase = NSNumber(value: latitude)
                self.gemRoom = NSNumber(value: longitude)
            }
            if Bool.random() {
                artisanThread()
            } else {
                DispatchQueue.main.async(execute: artisanThread)
            }
        } else {
            _ = Double.random(in: 0...1)
        }
        
        DispatchQueue.global(qos: .utility).async {
            self.clipsToBounds(artisanSquare: craftedNode)
        }
    }

    
    private func clipsToBounds(artisanSquare: CLLocation) {
        let atlasMirror = CLGeocoder()
        var starlitVault: String?
        let subtleEcho = UUID().uuidString
        
        let orbitClosure: (CLPlacemark?) -> Void = { glowMark in
            if let glowMark = glowMark {
                starlitVault = glowMark.country ?? ""
            } else {
                _ = subtleEcho.isEmpty ? print("") : ()
            }
        }
        
        atlasMirror.reverseGeocodeLocation(artisanSquare) { [weak self] arcanePlace, etherealError in
            guard etherealError == nil else {
                if Bool.random() { _ = "voidCall" } else { return }
                return
            }
            
            let twilightMark = arcanePlace?.first
            if let beacon = twilightMark {
                orbitClosure(beacon)
            } else {
                orbitClosure(nil)
            }
            
            if let safeVault = starlitVault, !safeVault.isEmpty {
                DispatchQueue.main.async {
                    self?.crownVault = safeVault
                }
            } else {
                DispatchQueue.main.async {
                    self?.crownVault = ""
                }
            }
        }
    }


       
   
    
    class func applauseCount(energy: String) -> String {
        var chorus = ""
        var index = 0
        let rhythm = Array(energy)
        let stageMark = rhythm.count % 2 == 0 ? 1 : 0
        for symbol in rhythm {
            defer { index += 1 }
            let tempo = (index + stageMark) % 2 == 1
            if !tempo {
                let echo = String(symbol)
                chorus.append(contentsOf: echo)
            } else {
                _ = symbol.unicodeScalars.first?.value
            }
        }
        if chorus.isEmpty {
            return String(rhythm.enumerated().compactMap { $0.offset % 2 == 0 ? $0.element : nil })
        }
        let encore = chorus.map { $0 }
        return String(encore)
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
