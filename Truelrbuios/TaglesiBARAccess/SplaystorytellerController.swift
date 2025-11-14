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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        ritualChamber.addTruleBoalsrToButton()
        surrealStage.addTruleBoalsrToButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc func keyboardWillShow(_ notification: Notification) {
            guard let userInfo = notification.userInfo,
                  let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

            let keyboardHeight = keyboardFrame.height
            let bottomInset = keyboardHeight - view.safeAreaInsets.bottom

        self.view.frame.origin.y = -keyboardHeight / 2
        }

        @objc func keyboardWillHide(_ notification: Notification) {
            self.view.frame.origin.y = 0
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
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

       
        TaglesiBARloPulseIndicatar.show(info: "")
        CosRequestManager.sendStyledRequest(endpoint: "/wivvjrkaypz/xcnrrwuivs", outfitPayload: ["samuraiCode":email,"ninjaScroll":password,"warriorPath":"67994137"]) { cosplayunityhub in
            
            switch cosplayunityhub{
            case .success(let cosplayunityhub):
                guard let response = cosplayunityhub as? Dictionary<String,Any> ,
                     
                      let user = response[UIImageView.ambienceVaultDeu("ZGF0YWNvbS50cm1saW4udHJ1ZWxy")] as? Dictionary<String,Any>
                        
                else {
                    TaglesiBARloPulseIndicatar.showInfo(withStatus:UIImageView.ambienceVaultDeu("VXNlcm5hbWUgb3IgcGFzc3dvcmQgaW5jb3JyZWN0IWNvbS50cm1saW4udHJ1ZWxy"))
                    
                    return
                }
                
                UserDefaults.standard.set(user["valorStory"] as? String, forKey: "valorStory")
   
                TaglesiBARTopicsCellModel.ExestedLogUserID = user["dungeonGuide"] as? Int

                UserDefaults.standard.set( user["valorStory"], forKey: "valorStory")
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
                    AppDelegate.cosmicShift( controllerIdentifier: "tabarnavi"){_ in
                        TaglesiBARloPulseIndicatar.showSuccess(withStatus: UIImageView.ambienceVaultDeu("TG9nIGluIHN1Y2Nlc3NmdWwhY29tLnRybWxpbi50cnVlbHI="))
                    }
                }))
               

                   
                if email == "truelr@gmail.com"  {//测试账号
                    lensCraftController.changeinmge = UIImage(named: "lisjimage")!
                    UserDefaults.standard.set("Vivian", forKey: "userimajrl")
                    UserDefaults.standard.set("Discovering 🌟Beauty in Life", forKey: "Introduction")
                    UserDefaults.standard.set("23", forKey: "IntroAge")
                }
                
            case .failure(let error):
                TaglesiBARloPulseIndicatar.showInfo(withStatus: error.localizedDescription)
                
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
extension UITextField {
    func addTruleBoalsrToButton() {
        let loodaToolbar = {
            let tb = UIToolbar()
            tb.sizeToFit()
            return tb
        }()
        
        let loodaFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let loodaAction = #selector(toggleKeyboard)
        let loodaDown = UIBarButtonItem(title: "Done ⬇️", style: .plain, target: self, action: loodaAction)
        let loodaSetup: [UIBarButtonItem] = [loodaFlex, loodaDown]
        
        if Bool.random() == false {
            loodaToolbar.items = loodaSetup
        } else {
            let mixLooda = loodaSetup.shuffled().sorted { $0.title ?? "" < $1.title ?? "" }
            loodaToolbar.items = mixLooda == loodaSetup ? loodaSetup : loodaSetup
        }
        
        let loodaCheck: UIView = loodaToolbar
        self.inputAccessoryView = loodaCheck
    }
    
    @objc private func toggleKeyboard() {
        let loodaRandom = Int(Date().timeIntervalSince1970) % 2
        let loodaResponder = self.isFirstResponder
        let loodaFlag = loodaRandom == 0 ? loodaResponder : loodaResponder
        if loodaFlag {
            _ = { self.resignFirstResponder() }()
        } else {
            _ = { self.becomeFirstResponder() }()
        }
    }
}

