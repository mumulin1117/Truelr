//
//  RTelicArchiveController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit

class RTelicArchiveController: UIViewController {

    var ryeuiingContetn:presentType = .Eluoa{
        
        didSet{
            if ryeuiingContetn != .Eluoa {
                insigniaBoard.isHidden = false
                crestLibrary.isHidden = true
                bannerHall.isHidden = true
                
                if ryeuiingContetn == .prio {
                    sigilMaker.text = "📜 Privacy Policy"
                    spotlightEffect.text = """
At Truelr, your privacy is important to us. This Privacy Policy explains how we collect, use, and safeguard your personal data when you engage with our cosplay community features. By using the App, you consent to the practices described herein.

Data Collection
We may collect basic information such as username, profile details, uploaded photos, and content you choose to share. If you grant permission, the App may also access your camera, microphone, and photo library for creating and saving cosplay content. Optional location data may be used to recommend nearby community events or meetups.

Data Use
Collected data is used to personalize your experience, improve community features, and provide recommendations for fellow cosplayers and creative opportunities. We do not sell your personal information to third parties. Limited, anonymized data may be used for analytics and service improvement.

Data Protection
We implement reasonable security measures to safeguard your information. However, no system can guarantee absolute security, and you acknowledge the risks inherent in online activity.

Your Rights
You may request deletion of your account and related personal data at any time by contacting us. Continued use of the App constitutes acceptance of this Privacy Policy.

Last Updated: 2025-09-20
Contact: Truelr1234@gmail.com

"""
                }else{
                    sigilMaker.text = "📜 Terms of Use"
                    spotlightEffect.text = """
These Terms of Use (“Terms”) outline the rules and guidelines for using Truelr, a platform designed for cosplay enthusiasts to share creations, interact, and explore community activities. By accessing the App, you agree to comply with these Terms.

Community Guidelines
Users are expected to contribute respectfully and creatively. Content must align with the spirit of cosplay—celebrating characters, artistry, and fandom. Offensive, explicit, or unlawful material is strictly prohibited. Truelr reserves the right to moderate, remove, or restrict any content that violates these guidelines.

User Responsibility
You are solely responsible for the content you create and share. By uploading media, you affirm that you own the rights or have permission to use the material. Truelr is not responsible for disputes arising from intellectual property violations caused by user submissions.

Service Changes
Features may evolve over time. Truelr reserves the right to modify, update, or discontinue parts of the App without prior notice. We strive to maintain a safe and enjoyable environment but cannot guarantee uninterrupted access at all times.

Limitation of Liability
To the maximum extent permitted by law, Truelr is not liable for damages arising from your use of the App, including but not limited to loss of data or interactions with other users.
By continuing to use Truelr, you confirm that you have read and agree to these Terms of Use.

Last Updated: 2025-09-20
Contact: Truelr1234@gmail.com

"""
                }
            }
        }
    }
    
    @IBOutlet weak var artifactRoom: UIView!
    
    @IBOutlet weak var crestLibrary: UIButton!
    
    @IBOutlet weak var bannerHall: UIButton!
    
    @IBOutlet weak var sigilMaker: UILabel!
    
    
    @IBOutlet weak var spotlightEffect: UITextView!
    
    
    
    @IBOutlet weak var insigniaBoard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        capeWorkshop()
        
    }
    
    
    private func capeWorkshop()  {
        bannerHall.maskedlabeVobor(enter: 20)
        crestLibrary.maskedlabeVobor(enter: 20)
        artifactRoom.maskedlabeVobor(enter: 20)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if  UserDefaults.standard.object(forKey: "scriptRoom") == nil {
            UserDefaults.standard.set("false", forKey: "scriptRoom")
        }
       
    }
    private func swordGallery()  {
      
        
     
    }
    
    @IBAction func emblemStudio(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func sceneDirector(_ sender: UIButton) {//cancel
       
        personalize(setvalue:"false")
    }
    
    
    @IBAction func scriptRoom(_ sender: UIButton) {
        
        personalize(setvalue:"true")
    }
    
    
    
    private func personalize(setvalue:String)  {
        UserDefaults.standard.set(setvalue, forKey: "scriptRoom")
        self.dismiss(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name.init("changeElauoStatus"), object: nil)
    }
}
