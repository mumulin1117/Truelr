//
//  QuestSeekerControlle.swift
//  Truelrbuios
//
//  Created by  on 2025/9/20.
//

import UIKit
import SVProgressHUD
import PhotosUI
class QuestSeekerControlle: UIViewController ,UITextViewDelegate{
    private var selectedMedia: URL?   // 本地选中的图片或视频
      
    private var postText: String = ""
   
    private let videoCost: Int = 20   // 发布视频所需金币
    
    
    private  var pickingShing:Int = 0
    
    private lazy var chasloogVIew: PostChargeDialog = {
        let view = PostChargeDialog.init(frame: UIScreen.main.bounds)
       
        return view
    }()
    @IBAction func posstingDym(_ sender: UIButton) {
       
        if sender.tag - 340 ==  self.pickingShing {
            return
        }
        postText = ""
        dreamscapeHub.text = nil
        Seriuh.setBackgroundImage(UIImage.init(named: "heroArchive0"), for: .normal)
        let retuio = self.view.viewWithTag(340) as? UIButton
        let retuio1 = self.view.viewWithTag(341) as? UIButton
        retuio1?.isSelected = false
        retuio?.isSelected = false
        
        sender.isSelected = true
        self.pickingShing = sender.tag - 340
        if self.pickingShing == 1 {
            self.indicaterNned.isHidden = false
        }else{
            self.indicaterNned.isHidden = true
        }
        
    }
    
    @IBOutlet weak var indicaterNned: UIImageView!
    
    
    @IBOutlet weak var Seriuh: UIButton!
    
    @IBOutlet weak var dreamscapeHub: UITextView!
    
    @IBAction func planetariumView(_ sender: UIButton) {
        
        var config = PHPickerConfiguration(photoLibrary: .shared())
        
        if pickingShing == 0 {
            config.filter = .any(of: [.images])
        }else{
            config.filter = .any(of: [ .videos])
        }
                
               
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dreamscapeHub.delegate = self
        Seriuh.layer.cornerRadius = 15
        Seriuh.layer.masksToBounds = true
    }
    
    @IBAction func dreamscapeHub(_ sender: UIButton) {
        postText = dreamscapeHub.text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard postText.count > 0,postText != "  Text something..."
                 else {
           SVProgressHUD.showInfo(withStatus: "Before post , please enter something.")
                   
           return
               
       }
        
        guard let mediaURL = selectedMedia else {
            SVProgressHUD.showInfo(withStatus: "Please add an image or video before posting.")
                    return
                }
        
        //是否添加了图片或者视频
        
        
        //是否添加了文字
        
        
        
        
        
        
        
        
        //post 是视频
        if pickingShing == 1 {
            chasloogVIew.show(in: self.view, cost: 20)
            chasloogVIew.onPostConfirmed = {
                
                if ViewController.CurrentCoinggUserOwne < self.videoCost {
                    //如果金币不足，谈出金币页面
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
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
           
            SVProgressHUD.showSuccess(withStatus: "Send successful,your post will be displayed after approval")
            
            self.dreamscapeHub.text = nil
            self.dreamscapeHub.resignFirstResponder()
            self.navigationController?.popViewController(animated: true)
        }))
       
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }

}
extension QuestSeekerControlle: PHPickerViewControllerDelegate {
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
        } else if provider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
            provider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { [weak self] url, _ in
                guard let strongSelf = self, let url = url else { return }
                let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent(url.lastPathComponent)
                try? FileManager.default.copyItem(at: url, to: tempURL)
                DispatchQueue.main.async {
                    strongSelf.selectedMedia = tempURL
                    strongSelf.Seriuh.setBackgroundImage(UIImage(systemName: "video.fill") , for: .normal)
                }
            }
        }
    }
}
