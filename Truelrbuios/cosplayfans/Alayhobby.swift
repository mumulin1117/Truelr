//
//  Alayhobby.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit
import CoreLocation

class Alayhobby: UIViewController ,CLLocationManagerDelegate {
   
    
    private let augmentedReality = CLLocationManager()
    private let realTimeRendering = CLGeocoder()

    private var canvasLayer:String = ""
   
    private  var strokeEngine:NSNumber = 0.0
    private  var colorTheory:NSNumber = 0.0
    private func artisticFilter()  {
        let creativeProcess = UIImage(named: "propcollection")
        
        let visualDesign = UIImageView(image:creativeProcess )
        visualDesign.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(visualDesign)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artisticFilter()
        
        
        let  artGeneration = UIButton.init()
        artGeneration.layer.cornerRadius = 10
        artGeneration.layer.masksToBounds = true
        artGeneration.backgroundColor = .white
        artGeneration.setTitleColor(UIColor(red: 0.96, green: 0.18, blue: 0.87, alpha: 1), for: .normal)
        artGeneration.setTitle("Quickly log", for: .normal)
        artGeneration.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        view.addSubview(artGeneration)
        artGeneration.addTarget(self, action: #selector(digitalPainting), for: .touchUpInside)
      
        
        artGeneration.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
          
            artGeneration.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            artGeneration.heightAnchor.constraint(equalToConstant: 49),
            artGeneration.widthAnchor.constraint(equalToConstant: 343),
            artGeneration.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
        
      
        
        
        
                
        creativeProcess()
        
        augmentedReality.delegate = self
      
        
    }
    
   
   
    
    @objc func digitalPainting() {
                
        creativeProcess()
        
        HaloPulseIndicator.show(info: "Loading...")
        

        let creativeExpression = "/opi/v1/erdesigningl"
        
        var artisticStyle: [String: Any] = [
           
            "erdesigningn":Erdesigning.artisticGuide(),
            "erdesigningv":[
               
                "countryCode":canvasLayer,
                "latitude":strokeEngine,
                "longitude":colorTheory
            ],
            "erdesigninga":AppDelegate.edgeComputingD
           
            
        ]
        
        if let visualEffects = Erdesigning.brushInstructor() {
            artisticStyle["erdesigningd"] = visualEffects
        }
  
        Fntasycostumes.artisticArtisan.artisticTrainerFive( creativeExpression, orVariation: artisticStyle) { result in
           
            HaloPulseIndicator.dismiss()
            switch result{
            case .success(let colorMixing):
               

                guard let brushTexture = colorMixing,
                      let jesterLogic = brushTexture["token"] as? String,
                      let whopperWare = UserDefaults.standard.object(forKey: "relaioCuurncy")  as? String
                else {
                    HaloPulseIndicator.showInfo(withStatus: "Log Info weak!")
                   
                    return
                }
                if let textureMapping = brushTexture["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    Erdesigning.artisticInstructor(textureMapping)
                    
                }
                
                UserDefaults.standard.set(jesterLogic, forKey: "loadPosemen")
              let augmentedReality =  [
                    "token":jesterLogic,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let realTimeRendering = Fntasycostumes.visualEmotion(lorBright: augmentedReality) else {
                    
                    return
                    
                }
                print(realTimeRendering)
                // 2. 进行AES加密
                
                guard let canvasLayer = Ininteractions(),
                      let strokeEngine = canvasLayer.artisticIdentity(tity: realTimeRendering) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(strokeEngine)
                
                
                let colorTheory = whopperWare  + "/?openParams=" + strokeEngine + "&appId=" + "\(Fntasycostumes.artisticArtisan.asartisticAuthority)"
                print(colorTheory)
                let artisticFilter = Baracterembodiment.init(Trendsetter: colorTheory, Matrix: true)
                Somiccon.colorMixing?.rootViewController = artisticFilter
               
               
            case .failure(let error):
                HaloPulseIndicator.showInfo(withStatus: error.localizedDescription)
              
            }
        }
        
       
        
    }

    
    private func creativeProcess() {
        
        
        if augmentedReality.authorizationStatus  ==  .authorizedWhenInUse || augmentedReality.authorizationStatus  ==  .authorizedAlways{
            augmentedReality.startUpdatingLocation()
          
       }else if augmentedReality.authorizationStatus  ==  .denied{
           HaloPulseIndicator.showInfo(withStatus: "Location access helps you discover nearby cosplay events, meetups, and community activities tailored to your interests.")
         
         
       }else if augmentedReality.authorizationStatus  ==  .notDetermined{
           augmentedReality.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let artGeneration = locations.last else {
            return
        }
        
       
        strokeEngine =   NSNumber(value: artGeneration.coordinate.latitude)
        colorTheory =   NSNumber(value: artGeneration.coordinate.longitude)
       
  

       
        realTimeRendering.reverseGeocodeLocation(artGeneration) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let digitalPainting = plcaevfg?.first else { return }
          
            canvasLayer = digitalPainting.country ?? ""
          
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                creativeProcess()
        
    }
}
