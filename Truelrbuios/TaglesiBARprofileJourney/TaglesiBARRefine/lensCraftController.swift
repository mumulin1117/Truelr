//
//  lensCraftController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/24.
//

import UIKit

import PhotosUI

class lensCraftController: UIViewController {
    @IBOutlet weak var ritualChamber: UITextField!
    
    @IBOutlet weak var surrealStage: UITextField!
    
    static var changeinmge:UIImage = UIImage.init(named: "Hildojd")!
    
    @IBOutlet weak var introducntion: UITextField!
    
    @IBOutlet weak var Seriuh: UIButton!
    
    
    
    @IBAction func yuqihang(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ritualChamber.addTruleBoalsrToButton()
        surrealStage.addTruleBoalsrToButton()
        Seriuh.maskedlabeVobor(enter: 60)
        introducntion.addTruleBoalsrToButton()
        ritualChamber.text =  UserDefaults.standard.object(forKey: "userimajrl") as? String
        surrealStage.text =  UserDefaults.standard.object(forKey: "IntroAge") as? String
        introducntion.text =  UserDefaults.standard.object(forKey: "Introduction") as? String
        
        Seriuh.setBackgroundImage(lensCraftController.changeinmge, for: .normal)
       
    }


    @IBAction func savingcosplay(_ sender: UIButton) {
        let name = ritualChamber.text
        let age = surrealStage.text
        let filer = introducntion.text
        
        UserDefaults.standard.set(name, forKey: "userimajrl")
        UserDefaults.standard.set(filer, forKey: "Introduction")
        UserDefaults.standard.set(age, forKey: "IntroAge")
        
      
        
        TaglesiBARloPulseIndicatar.showSuccess(withStatus: UIImageView.ambienceVaultDeu("U2F2ZSBzdWNjZXNzZnVsIWNvbS50cm1saW4udHJ1ZWxy"))
        self.navigationController?.popViewController(animated: true)
    }
    private func hiddenChamber(valorStory: String, epicVerse: String) {
        let ac = UIAlertController(title: valorStory, message: epicVerse, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: UIImageView.ambienceVaultDeu("T0tjb20udHJtbGluLnRydWVscg=="), style: .default))
        present(ac, animated: true)
    }
    
    
    @IBAction func planetariumView(_ sender: UIButton) {
        
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .any(of: [.images])
               
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
}


extension lensCraftController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider else { return }
        
        if provider.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
            provider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
                DispatchQueue.main.async {
                    if let img = image as? UIImage {
                        self?.Seriuh.setBackgroundImage(img, for: .normal)
                        lensCraftController.changeinmge = img
                    }
                }
            }
        }
    }
}
