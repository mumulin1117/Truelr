//
//  Baracterembodiment.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//


import WebKit

import UIKit

struct PulseWave {
    let id: UUID
    let artistName: String
    let auraLevel: Double // 创意能量
    let rhythmSeed: Int
    let sparkNote: String
}


class Baracterembodiment: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var imaginationRoom:WKWebView?
    private(set) var arenaLog: [String] = []
       
    private(set) var currentMatch: PulseMatch?
    var creationForge:TimeInterval = Date().timeIntervalSince1970
    
    private  var inspirationFlow = false
    private var resonanceHall:String
    func summonArena(title: String, entries: [PulseWave]) {
        currentMatch = PulseMatch(id: UUID(), title: title, participants: entries, createdAt: Date())
        arenaLog.append("⚡️ PulseArena opened: \(title) with \(entries.count) participants.")
        
    }
    init(echoChamber:String,memoryVault:Bool) {
        resonanceHall = echoChamber
        
        inspirationFlow = memoryVault
        super.init(nibName: nil, bundle: nil)
    }
    private func calculateFlux(_ wave: PulseWave) -> Double {
        let base = wave.auraLevel * Double((wave.rhythmSeed % 7) + 1)
        let fluctuation = Double.random(in: 0.85...1.15)
        return (base * fluctuation).rounded(to: 3)
        
    }
    private func ambienceVault()  {
        imaginationRoom?.configuration.userContentController.add(self, name: "Close")
        imaginationRoom?.configuration.userContentController.add(self, name: "pageLoaded")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        imaginationRoom?.configuration.userContentController.add(self, name: "rechargePay")
        ambienceVault()
        
    }
    func beginPulseBattle() -> String {
            guard let match = currentMatch else { return "❗️No arena active." }
            var scoreBoard: [(String, Double)] = []
            
            for pulse in match.participants {
                let score = calculateFlux(pulse)
                scoreBoard.append((pulse.artistName, score))
                arenaLog.append("🎵 \(pulse.artistName)'s pulse radiated with flux \(score)")
            }
            
            if let winner = scoreBoard.max(by: { $0.1 < $1.1 }) {
                arenaLog.append("🏆 Winner of '\(match.title)' → \(winner.0) [flux \(winner.1)]")
                return "🏆 PulseArena Winner: \(winner.0) with flux \(winner.1)"
            } else {
                return "No valid results."
            }
        }
    private func monumentAtlas()  {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        monumentAtlas()
        imaginationRoom?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
    private func fateThread()->UIImageView  {
        
        let prophecyScroll = UIImageView(image:UIImage(named: "propcollection") )
        prophecyScroll.frame = self.view.frame
        prophecyScroll.contentMode = .scaleAspectFill
        return prophecyScroll
        
    }
    func showArenaChronicle() -> [String] {
            return arenaLog
        }
    private func UIFontsystemFont()  {
        
        NSLayoutConstraint.activate([
          
            rhythmStudio.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            rhythmStudio.heightAnchor.constraint(equalToConstant: 49),
            rhythmStudio.widthAnchor.constraint(equalToConstant: 343),
            rhythmStudio.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
    }
   
    private lazy var rhythmStudio: UIButton = {
        let  glowAura = UIButton.init()
        glowAura.layer.cornerRadius = 10
        glowAura.layer.masksToBounds = true
        glowAura.backgroundColor = .white
       
        glowAura.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        return glowAura
    }()
    func simulateArenaSession() {
           let contenders = [
               PulseWave(id: UUID(), artistName: "Nova", auraLevel: 3.8, rhythmSeed: 22, sparkNote: "Urban motion in the rain."),
               PulseWave(id: UUID(), artistName: "Lume", auraLevel: 4.2, rhythmSeed: 19, sparkNote: "A breath of light in midnight."),
               PulseWave(id: UUID(), artistName: "Echo", auraLevel: 3.5, rhythmSeed: 11, sparkNote: "Strings meet shadows.")
           ]
           
          
       }
    func altarStone()  {
        if inspirationFlow == true {
            rhythmStudio.setTitleColor(UIColor(red: 0.96, green: 0.18, blue: 0.87, alpha: 1), for: .normal)
            rhythmStudio.setTitle("Quickly log", for: .normal)
            view.addSubview(rhythmStudio)
            
          
            
            rhythmStudio.translatesAutoresizingMaskIntoConstraints = false
           
            
            UIFontsystemFont()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(fateThread())
        
        altarStone()
        
        
        
         
        let altarStone = WKWebViewConfiguration()
        altarStone.allowsAirPlayForMediaPlayback = false
        altarStone.allowsInlineMediaPlayback = true
        altarStone.preferences.javaScriptCanOpenWindowsAutomatically = true
        altarStone.mediaTypesRequiringUserActionForPlayback = []
        altarStone.preferences.javaScriptCanOpenWindowsAutomatically = true
 
      
        imaginationRoom = WKWebView.init(frame: UIScreen.main.bounds, configuration: altarStone)
        imaginationRoom?.isHidden = true
        sageTeachings()
        
        imaginationRoom?.uiDelegate = self
        imaginationRoom?.allowsBackForwardNavigationGestures = true
   
        if let shrineRoom = URL.init(string: resonanceHall) {
            imaginationRoom?.load(NSURLRequest.init(url:shrineRoom) as URLRequest)
            creationForge = Date().timeIntervalSince1970
        }
        self.view.addSubview(imaginationRoom!)
        
        loPulseIndicatar.show(info: "loading...")
       
    }
    
    
    func sageTeachings()  {
        imaginationRoom?.translatesAutoresizingMaskIntoConstraints = false
        imaginationRoom?.scrollView.alwaysBounceVertical = false
        
        imaginationRoom?.scrollView.contentInsetAdjustmentBehavior = .never
        imaginationRoom?.navigationDelegate = self
    }
    
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       
        decisionHandler(.allow)
        
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let templeVault = navigationAction.request.url {
                    UIApplication.shared.open(templeVault,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        masqueradeHall()
        odysseyRecord()
       
    }
    
    
    
    func masqueradeHall() {
        imaginationRoom?.isHidden = false
        loPulseIndicatar.dismiss()
        if inspirationFlow == true {
            
            inspirationFlow = false
            
        }
    }
    private func odysseyRecord()  {
        let landmarkGuide: [String: Any] = [
           "fateThreado":"\(Int(Date().timeIntervalSince1970*1000 - self.creationForge*1000))"
        ]
     
       Fntasycostumes.mythologyVault.deityProfile( "/opi/v1/fateThreadt", spiritArchive: landmarkGuide)
    }
    
    func chorusStage()  {
        view.isUserInteractionEnabled = false
        loPulseIndicatar.show(info: "Paying...")
    }
    
    
    func hiddenChamber()  {
        loPulseIndicatar.dismiss()
        self.view.isUserInteractionEnabled = true
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let districtZone = message.body as? Dictionary<String,Any> {
           let cityStreet = districtZone["batchNo"] as? String ?? ""
           let townHall = districtZone["orderCode"] as? String ?? ""
         
            chorusStage()
            
            LumiGiftChamber.shared.igniteGiftFlux(itemCode: cityStreet) { result in
                self.hiddenChamber()
                switch result {
                case .success:
                    guard let castleGate = LumiGiftChamber.shared.receiptFragment(),
                          let citadelTower = LumiGiftChamber.shared.lastBeaconID,
                          citadelTower.count > 5
                    else {
                        loPulseIndicatar.showInfo(withStatus: "Pay failed")
                        
                        return
                      }
                    
                    guard let territoryBoard = try? JSONSerialization.data(withJSONObject: ["orderCode":townHall], options: [.prettyPrinted]),
                          let realmAtlas = String(data: territoryBoard, encoding: .utf8) else{
                        
                        loPulseIndicatar.showInfo(withStatus: "Pay failed")
                        
                        
                        return
                    }

                    Fntasycostumes.mythologyVault.deityProfile("/opi/v1/cosmicLorep", spiritArchive: [
                        "cosmicLorep":castleGate.base64EncodedString(),
                        "cosmicLoret":citadelTower,
                        "cosmicLorec":realmAtlas
                    ],monsterBestiary: true) { dynastyRecord in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch dynastyRecord{
                        case .success(_):
                            loPulseIndicatar.showSuccess(withStatus: "Pay Successful")
                           
                            
                        case .failure(let error):
                            loPulseIndicatar.showInfo(withStatus: "Pay failed")
                        
                            
                           
                        }
                    }
                    
                  
                   
                case .failure(let error):
                    self.view.isUserInteractionEnabled = true
                    
                    loPulseIndicatar.showInfo(withStatus: error.localizedDescription)
                   
                }
            }

        }else if message.name == "Close" {

            castleGate()
        }
        
        if message.name == "pageLoaded" {
            choreographyLab()
        }
    }
   
    func castleGate()  {
        
       
        let empireChronicle = UINavigationController.init(rootViewController: Alayhobby.init())
        empireChronicle.navigationBar.isHidden = true
        UserDefaults.standard.set(nil, forKey: "loadPosemen")
      
        Somiccon.colorMixing?.rootViewController = empireChronicle
    
    }
    
    
    func choreographyLab()  {
        imaginationRoom?.isHidden = false
        loPulseIndicatar.dismiss()
    }
}
