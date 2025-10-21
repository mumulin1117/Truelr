//
//  Baracterembodiment.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//


import WebKit


import UIKit


class Baracterembodiment: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var creativeGroundbreaker:WKWebView?
   
    var visualPattern:TimeInterval = Date().timeIntervalSince1970
    
    private  var artisticGround = false
    private var creativeTrendsetter:String
    
    init(Trendsetter:String,Matrix:Bool) {
        creativeTrendsetter = Trendsetter
        
        artisticGround = Matrix
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        creativeGroundbreaker?.configuration.userContentController.add(self, name: "rechargePay")
        creativeGroundbreaker?.configuration.userContentController.add(self, name: "Close")
        creativeGroundbreaker?.configuration.userContentController.add(self, name: "pageLoaded")
        
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        creativeGroundbreaker?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
    private func artisticTrendsetter()  {
        let creativeForerunner = UIImage(named: "propcollection")
        
        let brushForerunner = UIImageView(image:creativeForerunner )
        brushForerunner.frame = self.view.frame
        brushForerunner.contentMode = .scaleAspectFill
        view.addSubview(brushForerunner)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        artisticTrendsetter()
        if artisticGround == true {
            let  artGeneration = UIButton.init()
            artGeneration.layer.cornerRadius = 10
            artGeneration.layer.masksToBounds = true
            artGeneration.backgroundColor = .white
            artGeneration.setTitleColor(UIColor(red: 0.96, green: 0.18, blue: 0.87, alpha: 1), for: .normal)
            artGeneration.setTitle("Quickly log", for: .normal)
            artGeneration.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
            artGeneration.isUserInteractionEnabled = false
            view.addSubview(artGeneration)
            artGeneration.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
               
                artGeneration.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                artGeneration.heightAnchor.constraint(equalToConstant: 49),
                artGeneration.widthAnchor.constraint(equalToConstant: 343),
                artGeneration.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 55)
            ])
        }
        
        
        
         
        let visualNetwork = WKWebViewConfiguration()
        visualNetwork.allowsAirPlayForMediaPlayback = false
        visualNetwork.allowsInlineMediaPlayback = true
        visualNetwork.preferences.javaScriptCanOpenWindowsAutomatically = true
        visualNetwork.mediaTypesRequiringUserActionForPlayback = []
        visualNetwork.preferences.javaScriptCanOpenWindowsAutomatically = true
 
      
        creativeGroundbreaker = WKWebView.init(frame: UIScreen.main.bounds, configuration: visualNetwork)
        creativeGroundbreaker?.isHidden = true
        creativeGroundbreaker?.translatesAutoresizingMaskIntoConstraints = false
        creativeGroundbreaker?.scrollView.alwaysBounceVertical = false
        
        creativeGroundbreaker?.scrollView.contentInsetAdjustmentBehavior = .never
        creativeGroundbreaker?.navigationDelegate = self
        
        creativeGroundbreaker?.uiDelegate = self
        creativeGroundbreaker?.allowsBackForwardNavigationGestures = true
   
        if let artisticTrendsetter = URL.init(string: creativeTrendsetter) {
            creativeGroundbreaker?.load(NSURLRequest.init(url:artisticTrendsetter) as URLRequest)
            visualPattern = Date().timeIntervalSince1970
        }
        self.view.addSubview(creativeGroundbreaker!)
        
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
             
                if let chuckleChoreographer = navigationAction.request.url {
                    UIApplication.shared.open(chuckleChoreographer,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        creativeGroundbreaker?.isHidden = false
        HaloPulseIndicator.dismiss()
        if artisticGround == true {
            
            artisticGround = false
            
        }

        let creativeForerunner = "/opi/v1/ationgat"
         let brushForerunner: [String: Any] = [
            "ationgao":"\(Int(Date().timeIntervalSince1970*1000 - self.visualPattern*1000))"
         ]
      
        Fntasycostumes.artisticArtisan.artisticTrainerFive( creativeForerunner, orVariation: brushForerunner)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let creativeTrailblazer = message.body as? Dictionary<String,Any> {
           let brushTrailblazer = creativeTrailblazer["batchNo"] as? String ?? ""
           let colorDistinction = creativeTrailblazer["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            HaloPulseIndicator.show(info: "Paying...")
            LumiGiftChamber.shared.igniteGiftFlux(itemCode: "com.yourapp.token100") { result in
                HaloPulseIndicator.dismiss()
                self.view.isUserInteractionEnabled = true
                switch result {
                case .success:
                    guard let artisticPioneer = LumiGiftChamber.shared.receiptFragment(),
                          let creativeInnovator = LumiGiftChamber.shared.lastBeaconID,
                          creativeInnovator.count > 5
                    else {
                        HaloPulseIndicator.showInfo(withStatus: "Pay failed")
                        
                        return
                      }
                    
                    guard let visualAssembly = try? JSONSerialization.data(withJSONObject: ["orderCode":colorDistinction], options: [.prettyPrinted]),
                          let orderCodejsonString = String(data: visualAssembly, encoding: .utf8) else{
                        
                        HaloPulseIndicator.showInfo(withStatus: "Pay failed")
                        
                        
                        return
                    }

                    Fntasycostumes.artisticArtisan.artisticTrainerFive("/opi/v1/ournamep", orVariation: [
                        "ournamep":artisticPioneer.base64EncodedString(),//payload
                        "ournamet":creativeInnovator,//transactionId
                        "ournamec":orderCodejsonString//callbackResult
                    ],creativeTrainerd: true) { creativeOriginator in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch creativeOriginator{
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
           
            let brushOriginator = UINavigationController.init(rootViewController: Alayhobby.init())
            brushOriginator.navigationBar.isHidden = true
            
          
            Somiccon.colorMixing?.rootViewController = brushOriginator
        }
        
        if message.name == "pageLoaded" {
            creativeGroundbreaker?.isHidden = false
            HaloPulseIndicator.dismiss()
        }
    }
   
    
}
