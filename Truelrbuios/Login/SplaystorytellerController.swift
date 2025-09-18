//
//  SplaystorytellerController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/18.
//
import SVProgressHUD
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
                    let message = "You must provide both an email and a password to log in."
                    hiddenChamber(valorStory: "Notice", epicVerse: message)
                    return
                }

                if !isValidEmail(email) {
                    hiddenChamber(valorStory: "Invalid Email", epicVerse: "Please enter a valid email address.")
                    return
                }

                if password.count < 6 {
                    hiddenChamber(valorStory: "Weak Password", epicVerse: "Password must be at least 6 characters long.")
                    return
                }

       
        SVProgressHUD.show()
        CosRequestManager.sendStyledRequest(endpoint: "/wivvjrkaypz/xcnrrwuivs", outfitPayload: ["samuraiCode":email,"ninjaScroll":password,"warriorPath":"67994137"]) { cosplayunityhub in
            
            switch cosplayunityhub{
            case .success(let cosplayunityhub):
                guard let response = cosplayunityhub as? Dictionary<String,Any> ,
                     
                      let user = response["data"] as? Dictionary<String,Any>
                        
                else {
                    SVProgressHUD.showInfo(withStatus: "Username or password incorrect!")
                    
                    return
                }
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                ViewController.ExestedLogUserID = user["dungeonGuide"] as? Int
                let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
                UserDefaults.standard.set( user["valorStory"], forKey: "valorStory")//token
                if let mainViewController = storyboard.instantiateViewController(withIdentifier: "tabarnavi") as? UINavigationController{
                    keyWindow?.rootViewController = mainViewController
                    SVProgressHUD.showSuccess(withStatus: "Log in successful!")
                }
             
                
            case .failure(let error):
                SVProgressHUD.showInfo(withStatus: error.localizedDescription)
            }
            
        }
        
               
    }

    
   
        private func hiddenChamber(valorStory: String, epicVerse: String) {
            let ac = UIAlertController(title: valorStory, message: epicVerse, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
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
