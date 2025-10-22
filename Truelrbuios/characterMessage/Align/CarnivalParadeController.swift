//
//  CarnivalParadeController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/23.
//

import UIKit


class CarnivalParadeController: UIViewController {
    private var flameTicker: Timer?
        
    private var remainEchoSeconds = 20
    
    
    
    private var nisertgeing:Dictionary<String,Any>
    init(nisertgeing: Dictionary<String, Any>){
        self.nisertgeing = nisertgeing
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func marketStall(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var timecutdown: UIButton!
    
    @IBOutlet weak var shineEffect: UIView!
    
    @IBOutlet weak var journeyLog: UILabel!
    
    @IBOutlet weak var dreamscapeHub: UILabel!
    
    
    @IBOutlet weak var ribbonVault: UIImageView!
    
    @IBOutlet weak var shine: UIView!
    
    @IBOutlet weak var useravaterot: UIImageView!
    
    @IBOutlet weak var loreLibrary: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        igniteFlameTicker()
        loreLibrary.text = nisertgeing["loreLibrary"] as? String
        useravaterot.maskedlabeVobor(enter: 20)
        shine.maskedlabeVobor(enter: 20)
        timecutdown.maskedlabeVobor(enter: 28)
        dreamscapeHub.maskedlabeVobor(enter: 12.5)
        
        NotificationCenter.default.addObserver(self, selector: #selector(marketStall), name: NSNotification.Name.init("Blockuseraction"), object: nil)
        useravaterot.displayCharacterPortrait(from: nisertgeing["villainProfile"] as? String)
        ribbonVault.image = UIImage(named: "ProAlert\(CondiFilterControoer.pickingCondictuin.randomElement() ?? 17)=3")
        let createAge = Int.random(in: CondiFilterControoer.pickingAge.0...CondiFilterControoer.pickingAge.1)
        nisertgeing["age"] = createAge
        
        dreamscapeHub.text = "\(createAge)"
        journeyLog.text = nisertgeing["heroArchive"] as? String
    }

    @IBAction func prototypeDesk(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func artistryHub(_ sender: UIButton) {
    
        //随机成功或者失败
        let isFlameActive = Bool.random()
        
        if isFlameActive == true {
            let reser = ResultrendVaultController.init(nisertgeing: nisertgeing)
            flameTicker?.invalidate()
            self.navigationController?.pushViewController(reser, animated: true)
        }else{
            loPulseIndicatar.showInfo(withStatus: UIImageView.ambienceVaultDeu("TWF0Y2hpbmcgZmFpbGVkLCB0aGUgb3RoZXIgcGFydHkgaGFzIGxlZnRjb20udHJtbGluLnRydWVscg=="))
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    
    @IBAction func labyrinthPath(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            self.present(mainViewController, animated: true)
            
            let user = nisertgeing["mangaPanel"] as? Int
            
            mainViewController.userINfoID = nisertgeing
        }
    }
    
    
    private func igniteFlameTicker() {
            flameTicker = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                self.remainEchoSeconds -= 1
                self.timecutdown.setTitle("\(self.remainEchoSeconds)s", for: .normal)
                
                if self.remainEchoSeconds <= 0 {
                    self.flameTicker?.invalidate()
                    self.flameTicker = nil
                    loPulseIndicatar.showInfo(withStatus: UIImageView.ambienceVaultDeu("U29ycnksIGl0J3MgdGltZWNvbS50cm1saW4udHJ1ZWxy"))
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
        
       
    deinit {
        flameTicker?.invalidate()
    }
    
    
}
