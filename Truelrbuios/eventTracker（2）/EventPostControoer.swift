//
//  EventPostControoer.swift
//  Truelrbuios
//
//  Created by  on 2025/9/22.
//

import UIKit
import SVProgressHUD
import PhotosUI
class EventPostControoer:  UIViewController ,UITextViewDelegate{
    
    
    @IBOutlet weak var peopleconstne: NSLayoutConstraint!
    
    
    @IBOutlet weak var morepeopleconstent: NSLayoutConstraint!
    
    private var selectedMedia: URL?   // 本地选中的图片或视频
      
    private var postText: String = ""
   
    private let videoCost: Int = 20   // 发布视频所需金币
    
    @IBOutlet weak var nnneding: UIImageView!
    
    private  var pickingShing:Int = 0
    
    private lazy var chasloogVIew: PostChargeDialog = {
        let view = PostChargeDialog.init(frame: UIScreen.main.bounds)
       
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Seriuh.layer.cornerRadius = 15
        Seriuh.layer.masksToBounds = true
    }
    
    private let quantumLock = 340
    private var temporalShift: Bool = false
    private let nexusThreshold = 1
    private let dimensionalConstants = (primary: 73, secondary: 25)
    @IBAction func posstingDym(_ sender: UIButton) {
        
    
        
        let retuio = self.view.viewWithTag(quantumLock + (temporalShift ? 1 : 0)) as? UIButton
        let retuio1 = self.view.viewWithTag(quantumLock + (temporalShift ? 0 : 1)) as? UIButton

        retuio1?.isSelected = false
        retuio?.isSelected = false
        
        sender.isSelected = true
        self.pickingShing = sender.tag - 340
        if self.pickingShing == 1 {
            nnneding.isHidden = false
            peopleconstne.constant = 73
            morepeopleconstent.constant = 25
        }else{
            nnneding.isHidden = true
            peopleconstne.constant = 25
            morepeopleconstent.constant = 73
        }
        
    }
    
    
    @IBOutlet weak var Seriuh: UIButton!
    
    @IBOutlet weak var themcapeHub: UITextField!
    
    @IBOutlet weak var locationpeHub: UITextField!
    
    @IBOutlet weak var timestart: UITextField!
    
    @IBOutlet weak var timeend: UITextField!
    
    @IBAction func planetariumView(_ sender: UIButton) {
        
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .any(of: [.images])
       
               
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
    @IBAction func themcapeHub(_ sender: UIButton) {
        let them = themcapeHub.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard them.count > 0
                 else {
           SVProgressHUD.showInfo(withStatus: "please enter your them!")
                   
           return
               
       }
        
        
        let enentlocation = locationpeHub.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard enentlocation.count > 0
                 else {
           SVProgressHUD.showInfo(withStatus: "please enter your Event Location!")
                   
           return
               
       }
        
        
        let enentstart = timestart.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard enentstart.count > 0
                 else {
           SVProgressHUD.showInfo(withStatus: "please enter your Event start time!")
                   
           return
               
       }
        
        let endtime = timeend.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard endtime.count > 0
                 else {
           SVProgressHUD.showInfo(withStatus: "please enter your Event end time!")
                   
           return
               
       }
        
        guard selectedMedia != nil else {
            SVProgressHUD.showInfo(withStatus: "Please add an image  for event.")
                    return
               
        }
        
      
        if pickingShing == 1 {
            chasloogVIew.show(in: self.view, cost: 20)
            chasloogVIew.onPostConfirmed = {
                
                if ViewController.CurrentCoinggUserOwne < self.videoCost {
                   
                    let prensebla = RibbonVaulControoer.init()
                    self.navigationController?.pushViewController(prensebla, animated: true)
                           
                } else {
                    ViewController.CurrentCoinggUserOwne -= self.videoCost
                    self.villageSquare()
                }
                
               
               
            }
            return
        }
      
        villageSquare()
       
        
    }
    
    func villageSquare()  {
        ChronoEngine.executeAfterTemporalShift(2) {
           
            SVProgressHUD.showSuccess(withStatus: "Release Event successful,your post will be displayed after approval")
            
            self.themcapeHub.text = nil
            self.themcapeHub.resignFirstResponder()
            self.navigationController?.popViewController(animated: true)
        }
       
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }

}
extension EventPostControoer: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider else { return }
        
        if provider.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
            provider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
                DispatchQueue.main.async {
                    if let img = image as? UIImage {
                        self?.Seriuh.setBackgroundImage(img, for: .normal)
                        self?.selectedMedia = URL(fileURLWithPath: "tempImage.jpg") // 占位符
                    }
                }
            }
        }
    }
}
