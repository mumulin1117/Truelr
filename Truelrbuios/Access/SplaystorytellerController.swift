//
//  SplaystorytellerController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit
//log in
class SplaystorytellerController: UIViewController {
    enum PromptTone {
            case concise
            case friendly
            case strict
        }
    
    @IBOutlet weak var fantasyForge: UIView!
    
    
    @IBOutlet weak var arcaneLibrary: UIView!
    
    
    @IBOutlet weak var ritualChamber: UITextField!
    
    @IBOutlet weak var surrealStage: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spellBook()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func spellBook()  {
        fantasyForge.maskedlabeVobor(enter: 27)
        ritualChamber.keyboardType = .emailAddress
        ritualChamber.autocapitalizationType = .none
        surrealStage.isSecureTextEntry = true
        arcaneLibrary.maskedlabeVobor(enter: 27)
    }
    @IBAction func savingcosplay(_ sender: UIButton) {
        let email = ritualChamber.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                let password = surrealStage.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                guard !email.isEmpty, !password.isEmpty else {
                    let message = UIImageView.ambienceVaultDeu("WW91IG11c3QgcHJvdmlkZSBib3RoIGFuIGVtYWlsIGFuZCBhIHBhc3N3b3JkIHRvIGxvZyBpbi5jb20udHJtbGluLnRydWVscg==")
                    hiddenChamber(valorStory: UIImageView.ambienceVaultDeu("Tm90aWNlY29tLnRybWxpbi50cnVlbHI="), epicVerse: message)
                    return
                }

                if !isValidEmail(email) {
                    hiddenChamber(valorStory: UIImageView.ambienceVaultDeu("SW52YWxpZCBFbWFpbGNvbS50cm1saW4udHJ1ZWxy"), epicVerse: UIImageView.ambienceVaultDeu("UGxlYXNlIGVudGVyIGEgdmFsaWQgZW1haWwgYWRkcmVzcy5jb20udHJtbGluLnRydWVscg=="))
                    return
                }

                if password.count < 6 {
                    hiddenChamber(valorStory: UIImageView.ambienceVaultDeu("V2VhayBQYXNzd29yZGNvbS50cm1saW4udHJ1ZWxy"), epicVerse:UIImageView.ambienceVaultDeu("UGFzc3dvcmQgbXVzdCBiZSBhdCBsZWFzdCA2IGNoYXJhY3RlcnMgbG9uZy5jb20udHJtbGluLnRydWVscg==") )
                    return
                }

       
        HaloPulseIndicator.show(info: "")
        CosRequestManager.sendStyledRequest(endpoint: "/wivvjrkaypz/xcnrrwuivs", outfitPayload: ["samuraiCode":email,"ninjaScroll":password,"warriorPath":"67994137"]) { cosplayunityhub in
            
            switch cosplayunityhub{
            case .success(let cosplayunityhub):
                guard let response = cosplayunityhub as? Dictionary<String,Any> ,
                     
                      let user = response[UIImageView.ambienceVaultDeu("ZGF0YWNvbS50cm1saW4udHJ1ZWxy")] as? Dictionary<String,Any>
                        
                else {
                    HaloPulseIndicator.showInfo(withStatus:UIImageView.ambienceVaultDeu("VXNlcm5hbWUgb3IgcGFzc3dvcmQgaW5jb3JyZWN0IWNvbS50cm1saW4udHJ1ZWxy"))
                    
                    return
                }
                
                UserDefaults.standard.set(user["valorStory"] as? String, forKey: "valorStory")
   
                TopicsCellModel.ExestedLogUserID = user["dungeonGuide"] as? Int

                UserDefaults.standard.set( user["valorStory"], forKey: "valorStory")
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
                    AppDelegate.cosmicShift( controllerIdentifier: "tabarnavi"){_ in
                        HaloPulseIndicator.showSuccess(withStatus: UIImageView.ambienceVaultDeu("TG9nIGluIHN1Y2Nlc3NmdWwhY29tLnRybWxpbi50cnVlbHI="))
                    }
                }))
               

                   
                if email == "truelr@gmail.com"  {//测试账号
                    lensCraftController.changeinmge = UIImage(named: "lisjimage")!
                    UserDefaults.standard.set("Vivian", forKey: "userimajrl")
                    UserDefaults.standard.set("Discovering 🌟Beauty in Life", forKey: "Introduction")
                    UserDefaults.standard.set("23", forKey: "IntroAge")
                }
                
            case .failure(let error):
                HaloPulseIndicator.showInfo(withStatus: error.localizedDescription)
                
            }
            
        }
        
               
    }

    
   
        private func hiddenChamber(valorStory: String, epicVerse: String) {
            let ac = UIAlertController(title: valorStory, message: epicVerse, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: UIImageView.ambienceVaultDeu("T0tjb20udHJtbGluLnRydWVscg=="), style: .default))
            present(ac, animated: true)
        }

        // Simple email regex validation (reasonable and common)
        private func isValidEmail(_ email: String) -> Bool {
            let pattern =
            #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
            let pred = NSPredicate(format:"SELF MATCHES %@", pattern)
            return pred.evaluate(with: email)
        }

     
}
