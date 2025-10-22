//
//  Baracterembodiment.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//


import WebKit

import UIKit


class Baracterembodiment: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var imaginationRoom:WKWebView?
   
    var creationForge:TimeInterval = Date().timeIntervalSince1970
    
    private  var inspirationFlow = false
    private var resonanceHall:String
    
    init(echoChamber:String,memoryVault:Bool) {
        resonanceHall = echoChamber
        
        inspirationFlow = memoryVault
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        imaginationRoom?.configuration.userContentController.add(self, name: "rechargePay")
        imaginationRoom?.configuration.userContentController.add(self, name: "Close")
        imaginationRoom?.configuration.userContentController.add(self, name: "pageLoaded")
        
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        imaginationRoom?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
    private func fateThread()  {
        let destinyPath = UIImage(named: "propcollection")
        
        let prophecyScroll = UIImageView(image:destinyPath )
        prophecyScroll.frame = self.view.frame
        prophecyScroll.contentMode = .scaleAspectFill
        view.addSubview(prophecyScroll)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fateThread()
        if inspirationFlow == true {
            let  oracleVision = UIButton.init()
            oracleVision.layer.cornerRadius = 10
            oracleVision.layer.masksToBounds = true
            oracleVision.backgroundColor = .white
            oracleVision.setTitleColor(UIColor(red: 0.96, green: 0.18, blue: 0.87, alpha: 1), for: .normal)
            oracleVision.setTitle("Quickly log", for: .normal)
            oracleVision.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
            oracleVision.isUserInteractionEnabled = false
            view.addSubview(oracleVision)
            oracleVision.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
               
                oracleVision.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                oracleVision.heightAnchor.constraint(equalToConstant: 49),
                oracleVision.widthAnchor.constraint(equalToConstant: 343),
                oracleVision.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 55)
            ])
        }
        
        
        
         
        let altarStone = WKWebViewConfiguration()
        altarStone.allowsAirPlayForMediaPlayback = false
        altarStone.allowsInlineMediaPlayback = true
        altarStone.preferences.javaScriptCanOpenWindowsAutomatically = true
        altarStone.mediaTypesRequiringUserActionForPlayback = []
        altarStone.preferences.javaScriptCanOpenWindowsAutomatically = true
 
      
        imaginationRoom = WKWebView.init(frame: UIScreen.main.bounds, configuration: altarStone)
        imaginationRoom?.isHidden = true
        imaginationRoom?.translatesAutoresizingMaskIntoConstraints = false
        imaginationRoom?.scrollView.alwaysBounceVertical = false
        
        imaginationRoom?.scrollView.contentInsetAdjustmentBehavior = .never
        imaginationRoom?.navigationDelegate = self
        
        imaginationRoom?.uiDelegate = self
        imaginationRoom?.allowsBackForwardNavigationGestures = true
   
        if let shrineRoom = URL.init(string: resonanceHall) {
            imaginationRoom?.load(NSURLRequest.init(url:shrineRoom) as URLRequest)
            creationForge = Date().timeIntervalSince1970
        }
        self.view.addSubview(imaginationRoom!)
        
        HaloPulseIndicator.show(info: "loading...")
       
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
        imaginationRoom?.isHidden = false
        HaloPulseIndicator.dismiss()
        if inspirationFlow == true {
            
            inspirationFlow = false
            
        }

        let monumentAtlas = "/opi/v1/ationgat"
         let landmarkGuide: [String: Any] = [
            "ationgao":"\(Int(Date().timeIntervalSince1970*1000 - self.creationForge*1000))"
         ]
      
        Fntasycostumes.mythologyVault.deityProfile( monumentAtlas, spiritArchive: landmarkGuide)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let districtZone = message.body as? Dictionary<String,Any> {
           let cityStreet = districtZone["batchNo"] as? String ?? ""
           let townHall = districtZone["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            HaloPulseIndicator.show(info: "Paying...")
            LumiGiftChamber.shared.igniteGiftFlux(itemCode: "com.yourapp.token100") { result in
                HaloPulseIndicator.dismiss()
                self.view.isUserInteractionEnabled = true
                switch result {
                case .success:
                    guard let castleGate = LumiGiftChamber.shared.receiptFragment(),
                          let citadelTower = LumiGiftChamber.shared.lastBeaconID,
                          citadelTower.count > 5
                    else {
                        HaloPulseIndicator.showInfo(withStatus: "Pay failed")
                        
                        return
                      }
                    
                    guard let territoryBoard = try? JSONSerialization.data(withJSONObject: ["orderCode":townHall], options: [.prettyPrinted]),
                          let realmAtlas = String(data: territoryBoard, encoding: .utf8) else{
                        
                        HaloPulseIndicator.showInfo(withStatus: "Pay failed")
                        
                        
                        return
                    }

                    Fntasycostumes.mythologyVault.deityProfile("/opi/v1/ournamep", spiritArchive: [
                        "ournamep":castleGate.base64EncodedString(),//payload
                        "ournamet":citadelTower,//transactionId
                        "ournamec":realmAtlas//callbackResult
                    ],monsterBestiary: true) { dynastyRecord in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch dynastyRecord{
                        case .success(_):
                            HaloPulseIndicator.showSuccess(withStatus: "Pay Successful")
                           
                            
                        case .failure(let error):
                            HaloPulseIndicator.showInfo(withStatus: "Pay failed")
                        
                            
                           
                        }
                    }
                    
                  
                   
                case .failure(let error):
                    self.view.isUserInteractionEnabled = true
                    
                    HaloPulseIndicator.showInfo(withStatus: error.localizedDescription)
                   
                }
            }

        }else if message.name == "Close" {

            UserDefaults.standard.set(nil, forKey: "loadPosemen")// 清除本地token
           
            let empireChronicle = UINavigationController.init(rootViewController: Alayhobby.init())
            empireChronicle.navigationBar.isHidden = true
            
          
            Somiccon.colorMixing?.rootViewController = empireChronicle
        }
        
        if message.name == "pageLoaded" {
            imaginationRoom?.isHidden = false
            HaloPulseIndicator.dismiss()
        }
    }
   
    
}
